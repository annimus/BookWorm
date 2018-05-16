$(function() {
	// Active Menu
	switch (menu) {

	case 'Home':
		break;

	case 'About Us!':
		$('#about').addClass('active');
		break;

	case 'Contact Us!':
		$('#contact').addClass('active');
		break;

	case 'Manage Books':
		$('#manageBooks').addClass('active');
		break;

	// Highlights Our Collection in the navbar as well as highlights the genre
	// in the sidebar
	default:
		$('#listBooks').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	// -------------------------------------------------------------------------------------------------------------------------------------
	// End Active Menu
	// -------------------------------------------------------------------------------------------------------------------------------------

	// -------------------------------------------------------------------------------------------------------------------------------------
	// Code for jquery DataTable
	// -------------------------------------------------------------------------------------------------------------------------------------
	var $table = $('#bookListTable');

	// Execute this code only where we have the table
	if ($table.length) {
		var jsonURL = '';
		if (window.genreId == '') {
			jsonURL = window.contextRoot + '/json/data/all/books';
		} else {
			jsonURL = window.contextRoot + '/json/data/genre/' + window.genreId
					+ '/books';
		}

		$table.DataTable({
				lengthMenu : [ [ 10, 25, 50, -1 ], [ '10', '25', '50', 'All' ] ],
				pageLength : 5,
				ajax : {
					url : jsonURL,
					dataSrc : ''
				},
				columns : [
						{
							data : 'code',
							mRender : function(data, type, row) {
								return '<img src="' + window.contextRoot
										+ '/resources/images/' + data
										+ '.jpg" class="dataTableImg"/>';
							}
						},
						{
							data : 'name'
						},
						{
							data : 'author'
						},
						{
							data : 'unitPrice',
							mRender : function(data, type, row) {
								return '&#36; ' + data;
							}
						},
						{
							data : 'quantity',
							mRender : function(data, type, row) {
								if (data < 1) {
									return '<font color="red">Out of Stock</font>';
								} else {
									return '<font color="green">Ready for Delivery</font>';
								}
							}
						},
						{
							data : 'id',
							bSortable : false,
							mRender : function(data, type, row) {
								var str = '';
								str += '<a href="'
										+ window.contextRoot
										+ '/show/'
										+ data
										+ '/book" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a> &#160;';
									if (row.quantity < 1) {
									str += '<a href="javascript:void(0)" class="btn btn-success disabled"><span class="glyphicon glyphicon-shopping-cart strikethrough"></span></a>';
								} else {
									str += '<a href="'
											+ window.contextRoot
											+ '/cart/add/'
											+ data
											+ '/book" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
								}
									return str;
							}
						} ]
			});
	}
	// -------------------------------------------------------------------------------------------------------------------------------------
	// End Code for JQuery DataTable
	// -------------------------------------------------------------------------------------------------------------------------------------

	// -------------------------------------------------------------------------------------------------------------------------------------
	// Code for Dismissing the Alert After 3 Seconds
	// -------------------------------------------------------------------------------------------------------------------------------------
	var $alert = $('.alert');

	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 3000)
	}
	
	// -------------------------------------------------------------------------------------------------------------------------------------
	// End Code for Dismissing the Alert After 3 Seconds
	// -------------------------------------------------------------------------------------------------------------------------------------

	// -------------------------------------------------------------------------------------------------------------------------------------
	// Code for JQuery Admin DataTable
	// -------------------------------------------------------------------------------------------------------------------------------------
	var $adminBooksTable = $('#adminBooksTable');

	// Execute this code only where we have the table
	if ($adminBooksTable.length) {
		var jsonURL = window.contextRoot + '/json/data/admin/all/books';

		$adminBooksTable.DataTable({
				lengthMenu : [ [ 10, 25, 50, -1 ], [ '10', '25', '50', 'All' ] ],
				pageLength : 25,
				ajax : {
					url : jsonURL,
					dataSrc : ''
				},
				columns : [
				        {
				        	data : 'id'
				        },
						{
							data : 'code',
							mRender : function(data, type, row) {
								return '<img src="' + window.contextRoot
										+ '/resources/images/' + data + '.jpg" class="adminDataTableImg"/>';
							}
						},
						{
							data : 'name'
						},
						{
							data : 'author'
						},
						{
							data : 'publisher'
						},
						{
							data : 'unitPrice',
							mRender : function(data, type, row) {
								return '&#36; ' + data;
							}
						},
						{
							data : 'quantity',
							mRender : function(data, type, row) {
								if (data < 1) {
									return '<font color="red">Out of Stock</font>';
								} else {
									return data;
								}
							}
						},
						{
							data : 'active',
							bSortable : false,
							mRender : function(data, type, row) {
								var str = '';
								str += '<label class="switch">';
								
								if (data) {
									str += '<input type="checkbox" checked="checked" value="' + row.id + '"/>';
								} else {
									str += '<input type="checkbox" value="' + row.id + '"/>';
								}
								
								str += '<div class="slider"></div>';
								str += '</label>';
								
								return str;
							}
							
						},
						{
							data : 'id',
							bSortable : false,
							mRender : function(data, type, row) {
								var str = '';
								str += '<a href="' + window.contextRoot + '/manage/' + data + '/book" class = "btn btn-warning">';
								str += '<span class="glyphicon glyphicon-pencil"></span> </a>';
								
								return str;
							}
						}],
						
						initComplete: function() {
							var api = this.api();
							
							// Switch Toggle
							api.$('.switch input[type="checkbox"]').on('change', function() {
								var checkbox = $(this);
								var checked = checkbox.prop('checked');
								var dMessage = (checked) ? 'Do you wish to activate this book?' :
														   'Do you wish to deactivate this book?';
								var value = checkbox.prop('value');

								bootbox.confirm({
											size : 'medium',
											title : 'Book Activation & Deactivation',
											message : dMessage,
											callback : function(confirmed) {
												if (confirmed) {
													var activationURL = window.contextRoot + '/manage/book/' + value + '/activation';
													
													$.post(activationURL, function(data) {
														bootbox.alert({
															size : 'medium',
															title : 'Success',
															message : data
														});
													});
													
												} else {
													checkbox.prop('checked', !checked);
												}
											}
										});

							});
						}
			});
	}
});
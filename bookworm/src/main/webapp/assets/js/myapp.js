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
	
		// Highlights Our Collection in the navbar as well as highlights the genre
		// in the sidebar
		default:
			$('#listBooks').addClass('active');
			$('#a_' + menu).addClass('active');
			break;
	}
	
	
	// Code for Jquery DataTable
	var $table = $('#bookListTable');
	
	// Execute this code only where we have the table
	if ($table.length) {
		var jsonURL = '';
		if(window.genreId == '') {
			jsonURL = window.contextRoot + '/json/data/all/books';
		} else {
			jsonURL = window.contextRoot + '/json/data/genre/' + window.genreId + '/books';
		}
		
		$table.DataTable({
			lengthMenu: [[3,5,10,-1], ['3', '5', '10', 'All']],
			pageLength: 5,
			ajax: {
				url: jsonURL,
				dataSrc: ''
			},
			columns: [
			          {
			        	  data: 'code',
			        	  mRender: function(data, type, row) {
			        		  return '<img src="' + window.contextRoot + '/resources/images/' + data + '.jpg" class="dataTableImg"/>';
			        	  }
			          },
			          {
			        	  data: 'name'
			          },
			          {
			        	  data: 'author'
			          },
			          {
			        	  data: 'unitPrice',
			        	  mRender: function(data, type, row) {
			        		  return '&#36; ' + data;
			        	  }
			          },
			          {
			        	  data: 'quantity'
			          },
			          {
			        	  data: 'id',
			        	  bSortable: false,
			        	  mRender: function(data, type, row) {
			        		  var str = '';
			        		  str += '<a href="' + window.contextRoot + '/show/' + data + '/book" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a> &#160;';
			        		  str += '<a href="' + window.contextRoot + '/cart/add/' + data + '/book" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
			        		  
			        		  return str;
			        	  }
			          }
			          ]
		});
	}
});
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
});
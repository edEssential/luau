// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require mustache
//= require_tree ../../templates

jQuery(document).ready(function() {
	
	//// Preloader, hide all page content until window.load
	jQuery('.loadingGif').show();
	
	//// Launch all external links in _blank windows!!
	jQuery("a").click(function() {
		link_host = this.href.split("/")[2];
	    document_host = document.location.href.split("/")[2];

	    if (link_host != document_host) {
	      window.open(this.href);
	      return false;
	    }
	});
	
	//// Detect click from artists view and generate correct artist to display
	jQuery(".artistClick").click(function() {
		
		var id = jQuery(this).prev('.modal-object-id').val();
		
		jQuery.ajax({
			dataType: "json",
			url: "./artists/artist_show_via_ajax_call",
			data: {id: id},
			success: function(data) {
				var artist_content = SMT['artistshow'](data);
				jQuery(window).scrollTo('#section2', {duration:200, offset:45});
				jQuery('#artistShowWrapper').fadeIn(750);
				jQuery('#artistContent').empty().hide().append(artist_content).fadeIn(750);
			}
		});
	});
	//// Close artist display on icon click
	jQuery('#removeArtist').click(function() {
		jQuery('#artistShowWrapper').fadeOut(500, function(){
			jQuery("#artistShowWrapper").hide();
			jQuery("#artistContent").empty();
		});
	});
	
	jQuery(".releaseClick").click(function() {
		
		var id = jQuery(this).prev('.modal-object-id').val();
		
		jQuery.ajax({
			dataType: "json",
			url: "./releases/release_show_via_ajax_call",
			data: {id: id},
			success: function(data) {
				var release_content = SMT['releaseshow'](data);
				jQuery(window).scrollTo('#section3', {duration:200, offset:45});
				jQuery('#releaseShowWrapper').fadeIn(750);
				jQuery('#releaseContent').empty().hide().append(release_content).fadeIn(750);
				if(data.hasOwnProperty("press1")) {
					jQuery('.showHideReview').show();
				} else {
					jQuery('.showHideReview').hide();
				}
			}
		});
	});
	//// Close release display on icon click
	jQuery('#removeRelease').click(function() {
		jQuery('#releaseShowWrapper').fadeOut(500, function(){
			jQuery("#releaseShowWrapper").hide();
			jQuery("#releaseContent").empty();
		});
	});
	
	//// Contact form submission and callback
	jQuery( "#contact-submit" ).click(function() {
		jQuery(".contactTitle").fadeOut(500, function() {
			jQuery(this).html("Thanks for getting in touch!").fadeIn(1000);
			jQuery(".contactForm").empty().append("<h3>I'll get back to you soon</h3>");
			document.getElementById('contactHeader').scrollIntoView(true);
		 });
	});
	
});

//// Load page content once it has been preloaded
jQuery(window).load(function() {
	jQuery('.loadingGif').hide();
  	jQuery('.body').fadeIn(300);
});
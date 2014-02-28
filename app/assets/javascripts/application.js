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
//= require jquery.min
//= require royal-preloader
//= require retina
//= require smoothscroll
//= require waypoints
//= require parallax
//= require navigation
//= require jquery.mixitup
//= require jquery.easing
//= require jquery.fittext
//= require jquery.localscroll
//= require jquery.scrollto
//= require jquery.appear
//= require jquery.waitforimages
//= require jquery.bxslider
//= require jquery.fitvids
//= require main
//= require shortcodes
//= require placeholder 
//= require_tree .

$(document).ready(function() {
	
	//// Preloader, hide all page content until window.load
  	//$('.body').hide();
	//$('.loadingGif').show();
	
	//// Launch all external links in _blank windows!!
	$("a").click(function() {
		link_host = this.href.split("/")[2];
	    document_host = document.location.href.split("/")[2];

	    if (link_host != document_host) {
	      window.open(this.href);
	      return false;
	    }
	});
	
	//// Contact form submission and callback
	$( "#contact-submit" ).click(function() {
		$(".contactTitle").fadeOut(500, function() {
			$(this).html("Thanks for getting in touch!").fadeIn(1000);
		 });
	});
	
	//// Detect click from model? in CMS index view and generate correct mustache template to append to modal
	$( ".cmsEdit" ).click(function() {
		
		var model = $(this).prev().prev('.modal-model-type').val();
		var id = $(this).prev('.modal-object-id').val();
		
		if (model == "releases") {
			$.ajax({
				dataType: "json",
				url: "http://localhost:3000/releases/send_object_via_ajax",
		 		data: {id: id},
				success: function(data) {
					var release_content = SMT['release'](data);
					$('#form-content').empty().append(release_content);
				}
			});
		} else if (model == "videos") {
			$.ajax({
				dataType: "json",
				url: "http://localhost:3000/videos/send_object_via_ajax",
		 		data: {id: id},
				success: function(data) {
					var video_content = SMT['video'](data);
					$('#form-content').empty().append(video_content);
				}
			});
		} else if (model == "shows") {
			$.ajax({
				dataType: "json",
				url: "http://localhost:3000/shows/send_object_via_ajax",
		 		data: {id: id},
				success: function(data) {
					var show_content = SMT['show'](data);
					$('#form-content').empty().append(show_content);
				}
			});
		} else if (model == "contacts") {
			$.ajax({
				dataType: "json",
				url: "http://localhost:3000/contacts/send_object_via_ajax",
		 		data: {id: id},
				success: function(data) {
					var contact_content = SMT['contact'](data);
					$('#form-content').empty().append(contact_content);
				}
			});
		}
	});
	
});

//// Load page content once it has been preloaded
//$(window).load(function() {
//	$('.loadingGif').hide();
  //	$('.body').fadeIn(300);
//});

// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  var date = $("#meeting-date").html().substr(0,10);
  $("#datepicker").datepicker({disabled:true,firstDay:1,dateFormat:'yy-mm-dd'}).datepicker('setDate',date);





	var topics = 0;
	//jQuery(".next-topic").click(function() {
	//	$(".")
	//	topics++;
	//	alert(topics + " here");
	//});
	$("select[id*=meeting_datetime]").each(function() {
			$(this).css('width', '70px');
	});
	jQuery(".comment-btn").click(function() {
		var id = $(this).attr("id");

		if($(this).hasClass('clicked')){
			$(this).removeClass('clicked');
			$("#form-"+id).addClass("hidden");
		}
		else{
			$(this).addClass('clicked');
			$("#form-"+id).removeClass("hidden");
		}
	});

}); 

















// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require turbolinks-compatibility
//= require materialize
//= require_tree .
//= require_self
//= require Chart.bundle

//= require chartkick


$(document).ready(function(){
  console.log("JQuery has loaded")
  $('.modal').modal();
	$(".button-collapse").sideNav();

  // Enable modals for site
  $('#new-habit-button').on('click',function(e){
    e.preventDefault()
    $('#new-habit-modal').modal('open');
  })
})

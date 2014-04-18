// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
console.log($('.page').length)
$(document).ready(function(){
console.log($('.page').length)

  $('.page').height($(window).height())
  $(".nextpage").click(function(){
    // console.log($(this))
    if ($('.page-scroll').css("top") == -($('.page').length-1)*$(window).height()+'px') {

    }else{
      $(".page-scroll").animate({
        top: "-=" + $(window).height()
      })
    }
  });
});

$(document).ready(function(){
  $(".prevpage").click(function(){
    if ($('.page-scroll').css("top") == "0px") {

    }else{
      $(".page-scroll").animate({
        top: "+=" + $(window).height()
      })
    }
  });
});
var flag =1
$(document).ready(function(){
  $(".indexbtn").click(function(){
    if (flag == 1) {
      $('.indexbtn').animate({left:'300px'});
      $('.list').animate({left:'0px'},function(){
        $('#mask').height($(window).height())
        flag = 0
      });
    }else{
      $('.indexbtn').animate({left:'6px'});
      $('.list').animate({left:'-400px'},function(){
        $('#mask').height(0)
        flag = 1
      });
    }

  });
});




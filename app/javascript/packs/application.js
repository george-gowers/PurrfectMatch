// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "controllers"

import "bootstrap";
import { loadDynamicBannerText } from '../componets/banner';


import { initChatroomCable } from '../channels/chatroom_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initChatroomCable();
  jQuery.fn.carousel.Constructor.TRANSITION_DURATION = 2000
  var $item = $('.carousel-item');
  var $wHeight = $(window).height();
  $item.eq(0).addClass('active');
  $item.height($wHeight * 0.65);
  $item.addClass('full-screen');

  $('.carousel img').each(function () {
    var $src = $(this).attr('src');
    var $color = $(this).attr('data-color');
    $(this).parent().css({
      'background-image': 'url(' + $src + ')',
      'background-color': $color
    });
    $(this).remove();
  });

  $(window).on('resize', function () {
    $wHeight = $(window).height();
    $item.height($wHeight * 0.65);
  });

  $('.carousel').carousel({
    interval: 6000,
    pause: "false"
  });

  const banner = document.getElementById("banner-typed-text")
  if (banner) {
    loadDynamicBannerText();
  }

  const photos = document.querySelector(".photo-buttons i");
  const addPhotos = document.querySelector("#add-btn");

  });


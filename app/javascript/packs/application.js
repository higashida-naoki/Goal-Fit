// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 


Rails.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function() {
  const menuToggle = document.getElementById("menu-toggle");
  const menuClose = document.getElementById("menu-close");

  const menu = document.getElementById("menu");

  // ページ読み込み後にメニューの状態を復元
  if (sessionStorage.getItem('menuOpen') === 'true') {
    menu.classList.add('open');
  }

  if (menuToggle && menuClose && menu) {
    menuToggle.addEventListener("click", function() {
      menu.classList.toggle("open");
      sessionStorage.setItem('menuOpen', menu.classList.contains('open'));
    });

    menuClose.addEventListener("click", function() {
      menu.classList.remove("open");
      sessionStorage.setItem('menuOpen', false);
    });
    $('.menu-link').on("click", function() {
      menu.classList.remove("open");
      sessionStorage.setItem('menuOpen', false);
    });
  }
});



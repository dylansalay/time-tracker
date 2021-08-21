// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'core-js/stable'
import 'regenerator-runtime/runtime'
import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$( document ).on('turbolinks:load', function() {
  $('td[id^="work_order_"]').on('click', function() {

    var work_order = $(this).attr('id')
    var id = work_order.split("work_order_").pop()
    if (id != ''){
      $(`#modal-${id}`).modal('show')
    }
  })

  $('.modal-close').on('click', function() {
    $('.work_order_modal').modal('hide')
  })
})
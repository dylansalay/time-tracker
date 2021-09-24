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

  $('.add_work_order').on('click', function() {
    $('#add_work_order').modal('show')
  })

  $(function(){
    var selects = $('#work_orders_table tr').find('td[id^="work_order_"]')
    selects.each(function (index, el) {
      var work_order = $(this).attr('id')
      var value = $(this).text();
      if (!!value) {  
        var id = work_order.split("work_order_").pop()
        var duration = $(`#modal-${id} .modal-body h5:eq(2)`).text().match(/\d+/)[0]; 
        console.log(duration)

        var max = 60
        var color = ((duration/60) * 100)
        console.log(color)
        var white = 1 - color
        $(this).css('background', `linear-gradient(to bottom, yellow ${color}%, white ${white}%)`);

        if (color > 100) {
          var length = $('#work_orders_table th').length
          var next_cell = selects.eq(index + length - 1)
          var next_cell_color = color - 100

          next_cell.css('background', `linear-gradient(to bottom, yellow ${next_cell_color}%, white 0%)`);
        }
      }
    })
  })
})


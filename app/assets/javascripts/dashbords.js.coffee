$(document).on 'page:fetch', ->
  $('body').spin({
    position: 'fixed'
  })
$(document).on 'page:change', ->
  $('body').spin(false)

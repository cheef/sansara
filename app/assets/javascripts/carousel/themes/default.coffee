class Carousel.Themes.Default
  constructor: (@api) ->
  enable: ->
    api = @api

    $(@api.carousel.container.wrapper.element).prepend $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-left-control').
      html('&larr;').
      click -> api.previous()

    $(@api.carousel.container.wrapper.element).append  $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-right-control').
      html('&rarr;').
      click -> api.next()
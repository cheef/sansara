class Carousel.Themes.Eysmond
  constructor: (@api) ->
  enable: ->
    api = @api

    $(@api.carousel.container.wrapper.layout).addClass @defaults.domClass
    $(@api.carousel.container.wrapper.element).prepend $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-left-control').
      click -> api.previous()

    $(@api.carousel.container.wrapper.element).append  $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-right-control').
      click -> api.next()

  defaults:
    domClass: 'b-carousel-eysmond-theme'
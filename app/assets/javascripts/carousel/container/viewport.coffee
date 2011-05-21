class Carousel.Container.Viewport
  constructor: (@container) ->
  draw: ->
    layout    = $('<div>').addClass('l-carousel-viewport')
    container = $('<div>').addClass('b-carousel-viewport')
    $(@container.element).wrap(container)
    @element = $(@container.element).parent('.b-carousel-viewport')

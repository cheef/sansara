class Carousel.Container.Wrapper
  constructor: (@container, @carousel) ->
    @element = $('<div>').addClass('b-carousel')
    @layout  = $('<div>').addClass('l-carousel').html(@element)
  draw: ->
    $(@container).wrap(@layout)
    @element = $(@container).parent('.b-carousel')
    @layout  = $(@element).parent('.l-carousel')
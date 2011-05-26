class Carousel.Container.Viewport
  constructor: (@container, @carousel) ->
    @element = $('<div>').addClass('b-carousel-viewport')
    @layout  = $('<div>').addClass('l-carousel-viewport').html(@element)
  draw: ->
    $(@container).wrap(@layout)
    @element = $(@container).parent('.b-carousel-viewport')
    @layout  = $(@element).parent('.l-carousel-viewport')
    @element.css
      width:  this.width()
      height: this.height()

  width:  -> @carousel.params.width
  height: -> @carousel.params.height

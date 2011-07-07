class Sansara.Widget.Horizontal.Viewport

  constructor: (@widget) ->
    @template = $('<div>').addClass('b-carousel-viewport')
    @template = $('<div>').addClass('l-carousel-viewport').html(@template)
  draw: ->
    $(@widget.api.element).wrap(@template)
    @element = $(@widget.api.element).parent('.b-carousel-viewport')
    @layout  = $(@element).parent('.l-carousel-viewport')
    @element.css
      width:  this.width()
      height: this.height()
  width:  -> @widget.api.params.width
  height: -> @widget.params.height

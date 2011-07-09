class Sansara.Widget.Horizontal.Viewport

  constructor: (@widget) ->
    @template = $('<div>').addClass('b-sansara-viewport')
    @template = $('<div>').addClass('l-sansara-viewport').html(@template)
  draw: ->
    $(@widget.api.element).wrap(@template)
    @element = $(@widget.api.element).parent('.b-sansara-viewport')
    @layout  = $(@element).parent('.l-sansara-viewport')
    @element.css
      width:  this.width()
      height: this.height()
  width:  -> @widget.api.params.width
  height: -> @widget.api.params.height

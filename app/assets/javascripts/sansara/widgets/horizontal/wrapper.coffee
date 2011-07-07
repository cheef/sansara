class Sansara.Widget.Horizontal.Wrapper

  constructor: (@widget) ->
    @template = $('<div>').addClass('b-carousel')
    @template = $('<div>').addClass('l-carousel').html(@template)
  draw: ->
    $(@widget.viewport.layout).wrap(@template)
    @element = $(@widget.viewport.layout).parent('.b-carousel')
    @layout  = $(@element).parent('.l-carousel')
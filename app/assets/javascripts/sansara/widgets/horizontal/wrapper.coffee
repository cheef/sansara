class Sansara.Widget.Horizontal.Wrapper

  constructor: (@widget) ->
    @template = $('<div>').addClass('b-sansara')
    @template = $('<div>').addClass('l-sansara').html(@template)
  draw: ->
    $(@widget.viewport.layout).wrap(@template)
    @element = $(@widget.viewport.layout).parent('.b-sansara')
    @layout  = $(@element).parent('.l-sansara')
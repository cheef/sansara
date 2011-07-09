class Sansara.Widget.Horizontal.Control

  constructor: (@widget) ->
    @template = $('<input>').addClass('b-sansara-control').attr
      type: 'button'
class Sansara.Widget
  constructor: (@name, methods) ->
    $.extend(this, methods)
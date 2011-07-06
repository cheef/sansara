class Sansara.Plugin
  constructor: (@name, methods) ->
    $.extend(this, methods)
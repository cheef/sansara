class Sansara.Plugin

  constructor: (@name, methods) ->
    $.extend(this, methods) if methods?

  enable: (@api) ->
    @api.subscribe(@events, @api) if @events?
    $.extend(@api, @methods) if @methods?
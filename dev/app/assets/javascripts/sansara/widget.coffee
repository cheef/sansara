class Sansara.Widget

  constructor: (@name, methods) ->
    $.extend(this, methods) if methods?

  enable: (@api) ->
    api.subscribe(@events, this) if @events?

  plugins: []
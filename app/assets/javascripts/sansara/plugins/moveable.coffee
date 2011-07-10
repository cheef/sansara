$.sansara.plugin 'moveable',

  enable: (@api) ->
    @api.subscribe @bindings, @api

  methods:

  bindings:

    'draw.moveable': ->
      @current = 1

    'next.moveable': (event, api) ->
      api.trigger 'scroll', to: @current + 1

    'scroll.moveable': (event, api, params) ->
      $(api.element).animate
        left: -(api.widget.viewport.width() * params.to) + api.widget.viewport.width()
      @current = params.to

    'move.moveable': (event, api, params) ->
      $(api.element).css
        left: -(api.widget.viewport.width() * params.to) + api.widget.viewport.width()
      @current = params.to

    'previous.moveable': (event, api) ->
      api.trigger 'scroll', to: @current - 1
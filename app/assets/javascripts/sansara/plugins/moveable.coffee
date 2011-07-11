$.sansara.plugin 'moveable',

  events:

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

  methods:

    draw: -> this.trigger 'draw'
    next: -> this.trigger 'next'
    move: (params)   -> this.trigger 'move', params
    scroll: (params) -> this.trigger 'scroll', params
    previous:        -> this.trigger 'previous'
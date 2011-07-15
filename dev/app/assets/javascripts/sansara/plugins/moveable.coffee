$.sansara.plugin 'moveable',

  events:

    'initialize.moveable': (event, api) ->
      @currentItemPosition = 0

    'draw.moveable': (event, api) ->
      api.move position: 1

    'scroll.moveable': (event, api, params) ->
      @plugins['moveable'].parseMoveParams.call api, params
      @element.animate
        left: -api.width * (@currentItemPosition - 1)

    'move.moveable': (event, api, params) ->
      @plugins['moveable'].parseMoveParams.call api, params
      @element.css
        left: -api.width * (@currentItemPosition - 1)

    'next.moveable': (event, api) ->
      api.trigger 'scroll', position: @currentItemPosition + 1

    'previous.moveable': (event, api) ->
      api.trigger 'scroll', position: @currentItemPosition - 1

  parseMoveParams: (params) ->
    if params.to?
      @currentItem = params.to
      @currentItemPosition = @items.indexOf(@currentItem) + 1

    if params.position?
      @currentItemPosition = params.position
      @currentItem  = @items[ @currentItemPosition - 1 ]

  methods:

    next: -> this.trigger 'next'
    move: (params)   -> this.trigger 'move', params
    scroll: (params) -> this.trigger 'scroll', params
    previous:        -> this.trigger 'previous'
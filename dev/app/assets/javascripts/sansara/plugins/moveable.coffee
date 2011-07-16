$.sansara.plugin 'moveable',

  events:

    'initialize.moveable': (event, api) ->
      @currentPosition = 0

    'draw.moveable': (event, api) ->
      api.move position: 1

    'scroll.moveable': (event, api, params) ->
      @plugins['moveable'].parseMoveParams.call api, params
      @element.animate
        left: -api.itemsBlockWidth * (@currentPosition - 1)

    'move.moveable': (event, api, params) ->
      @plugins['moveable'].parseMoveParams.call api, params
      @element.css
        left: -api.itemsBlockWidth * (@currentPosition - 1)

    'next.moveable': (event, api) ->
      api.trigger 'scroll', position: @currentPosition + 1

    'previous.moveable': (event, api) ->
      api.trigger 'scroll', position: @currentPosition - 1

  parseMoveParams: (params) ->
    if params.to?
      @currentItem = params.to
      @currentPosition = Math.ceil((@items.indexOf(@currentItem) + 1) / @params.size)

    if params.position?
      @currentPosition = params.position
      @currentItem  = @items[ @currentPosition * @params.size - 1 ]

  methods:

    next: -> this.trigger 'next'
    move: (params)   -> this.trigger 'move', params
    scroll: (params) -> this.trigger 'scroll', params
    previous:        -> this.trigger 'previous'
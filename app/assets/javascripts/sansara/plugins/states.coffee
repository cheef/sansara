$.sansara.plugin 'states',

  events:

    'move.states': (event, api) ->
      @plugins['states'].detectState.call api

    'scroll.states': (event, api) ->
      @plugins['states'].detectState.call api

  detectState: ->
    switch
      when @items.length is @currentItemPosition
        this.trigger 'tail'
      when @currentItemPosition is 1
        this.trigger 'head'

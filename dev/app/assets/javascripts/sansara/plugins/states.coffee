$.sansara.plugin 'states',

  events:

    'move.states': (event, api) ->
      @plugins['states'].detectState.call api

    'scroll.states': (event, api) ->
      @plugins['states'].detectState.call api

  detectState: ->
    switch
      when Math.ceil(@items.length / @params.size) is @currentPosition
        this.trigger 'tail'
      when @currentPosition is 1
        this.trigger 'head'

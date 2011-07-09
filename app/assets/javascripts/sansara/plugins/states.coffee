$.sansara.plugin 'states',

  enable: (@api) ->
    @api.subscribe @bindings, this

  bindings:
    'move.plugin.states': (event, api) ->
      switch
        when api.widget.items().length is api.current
          api.trigger('tail')
        when api.current is 1
          api.trigger('head')
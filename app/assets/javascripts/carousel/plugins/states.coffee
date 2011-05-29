class Carousel.Plugins.States
  constructor: (@api) ->
    @api.subscribe 'initialize.plugin.states',
      ((event, api) -> api.subscribe @bindings, @), @

  bindings:
    'move.plugin.states': (event, api) ->
      switch
        when api.carousel.items().length is api.carousel.current
          api.trigger('tail')
        when api.carousel.current is 1
          api.trigger('head')

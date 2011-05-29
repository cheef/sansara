class Carousel.Plugins.AutoScroll
  constructor: (@api) ->
    @api.subscribe 'initialize.plugin.auto_scroll',
      ((event, api) -> ), @
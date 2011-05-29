Carousel.Plugins = {}

class Carousel.PluginManager
  constructor: (@api) -> this.detect()
  add: (name, constructor) ->
    @api.plugins or= {}
    @api.plugins[name] = new constructor(@api)
  detect: ->
    this.add(name, constructor) for name, constructor of (Carousel.Plugins ? {})
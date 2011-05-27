Carousel.Plugins = {}

class Carousel.PluginManager
  constructor: (@carousel) ->
    @carousel.api.subscribe 'initialize.plugin_manager', ( -> ), @
    this.detectPlugins()

  detectPlugins: ->
    constructors = Carousel.Plugins || {}
    api = @carousel.api
    @plugins = $.each constructors, -> new this(api)
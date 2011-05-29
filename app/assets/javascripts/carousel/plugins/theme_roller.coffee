Carousel.Themes = {}

class Carousel.Plugins.ThemeRoller
  constructor: (@api) ->
    @api.subscribe 'initialize.plugin.theme_roller',
      ((event, api) -> api.subscribe @bindings, @), @

    themeCallback = (event, api) ->
      try
        name  = api.carousel.params.theme
        klass = new this.findTheme(name)
        @api.theme = new klass(@api)
      catch error
        window.console.error(error) if window.console?

    @api.subscribe 'initialize.theme', themeCallback, @

  bindings:
    'draw.theme': (event, api) ->
      api.theme.enable()

  findTheme: (name) ->
    theme = null
    $.each Carousel.Themes, ->
      theme = this if this.name isnt '' and this.name is name
    theme

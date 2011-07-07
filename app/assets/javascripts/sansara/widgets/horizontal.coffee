Sansara.Widget.Horizontal = {}

$.sansara.widget 'horizontal',

  plugins: []
  initialize: (@api) ->
    # api.subscribe $name, $callback, $context_of_callback
    @api.subscribe 'initialize.container', this.subscribeBindings, this

  subscribeBindings: (event, api) ->
    api.subscribe @bindings, this

  bindings:
    'draw.viewport': (event, api) ->
      @viewport = new Sansara.Widget.Horizontal.Viewport(this)
      @viewport.draw()

    'draw.wrapper': (event, api) ->
      @wrapper = new Sansara.Widget.Horizontal.Wrapper(this)
      @wrapper.draw()

    'draw.container': (event, api) ->
      $(api.element)
        .addClass('b-carousel-items')
        .css width: this.width()
      api.move(to: 1)

  width: -> this.items().length * @viewport.width()
  items: -> $(@api.element).children('li')
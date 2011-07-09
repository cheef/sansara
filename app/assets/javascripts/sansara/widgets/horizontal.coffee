Sansara.Widget.Horizontal = {}

$.sansara.widget 'horizontal',

  plugins: []

  enable: (@api) ->
    api.subscribe @bindings, this

  bindings:

    'initialize.viewport': (event, api) ->
      @viewport = new Sansara.Widget.Horizontal.Viewport(this)

    'draw.viewport': (event, api) ->
      @viewport.draw()

    'initialize.wrapper': (event, api) ->
      @wrapper = new Sansara.Widget.Horizontal.Wrapper(this)

    'draw.wrapper': (event, api) ->
      @wrapper.draw()

    'draw.container': (event, api) ->
      $(api.element)
        .addClass('b-sansara-items')
        .css width: this.width()
      api.move(to: 1)

    'initialize.controls': (event, api) ->
      @controlPrevious = new Sansara.Widget.Horizontal.Control(this)
      @controlPrevious.template.addClass('b-sansara-control-previous')

      @controlNext = new Sansara.Widget.Horizontal.Control(this)
      @controlNext.template.addClass('b-sansara-control-next')

    'draw.controls': (event, api) ->
      @wrapper.element.prepend @controlPrevious.template
      @controlPrevious.element = @wrapper.element.prev()

      @wrapper.element.append @controlNext.template
      @controlNext.element = @wrapper.element.next()

    'draw.theme': (event, api) ->
      @wrapper.layout.addClass ['l-sansara', api.params.theme, 'theme'].join('-')

  width: -> this.items().length * @viewport.width()
  items: -> $(@api.element).children('li')
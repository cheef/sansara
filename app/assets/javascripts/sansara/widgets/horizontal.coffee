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
      $(api.element).addClass('b-sansara-items')
      api.move(to: 1)

    'initialize.controls': (event, api) ->
      @controlPrevious = new Sansara.Widget.Horizontal.Control(this)
      @controlPrevious.template.addClass('b-sansara-control-previous')

      @controlNext = new Sansara.Widget.Horizontal.Control(this)
      @controlNext.template.addClass('b-sansara-control-next')

    'draw.controls': (event, api) ->
      @wrapper.element.prepend @controlPrevious.template
      @controlPrevious.element = @wrapper.element.find('.b-sansara-control-previous')
      @controlPrevious.element.click -> api.previous()

      @wrapper.element.append @controlNext.template
      @controlNext.element = @wrapper.element.find('.b-sansara-control-next')
      @controlNext.element.click -> api.next()

    'draw.theme': (event, api) ->
      @wrapper.layout.addClass ['l-sansara', api.params.theme, 'theme'].join('-')

    'draw.width': (event, api) ->
      width = api.params.width
      $(api.element).css width: width * this.items().length

      $([ $(api.element).find('li'), @viewport.element, @viewport.layout ]).each ->
        this.css width: width

    'draw.height': (event, api) ->
      height = api.params.height
      $(api.element).find('li').css height: height
      @viewport.element.css height: height


  width: -> this.items().length * @viewport.width()
  items: -> $(@api.element).children('li')
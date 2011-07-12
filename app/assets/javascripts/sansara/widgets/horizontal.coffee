Sansara.Widget.Horizontal = {}

$.sansara.widget 'horizontal',

  plugins: [ 'theme-roller', 'moveable', 'states' ]

  events:

    'initialize.items': (event, api) ->
      api.items = api.element.find('li')

    'initialize.viewport': (event, api) ->
      @viewport = new Sansara.Widget.Horizontal.Viewport(this)

    'draw.viewport': (event, api) ->
      @viewport.draw()

    'initialize.wrapper': (event, api) ->
      @wrapper = new Sansara.Widget.Horizontal.Wrapper(this)

    'draw.wrapper': (event, api) ->
      @wrapper.draw()

    'draw.container': (event, api) ->
      api.element.addClass('b-sansara-items')

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

    'draw.width': (event, api, params = {}) ->
      # width correction
      api.element.find('li img:first').load ->
        correctedWidth = $(this).width()
        api.trigger('draw.width', width: correctedWidth) if correctedWidth isnt api.width

      api.width = params.width || api.params.width || api.items.width()
      @width    = api.width * api.items.length

      api.element.css width: @width

      $([ api.items, @viewport.element, @viewport.layout ]).each ->
        this.css width: api.width

    'draw.height': (event, api, params = {}) ->
      # height correction
      api.element.find('li img:first').load ->
        correctedHeight = $(this).height()
        api.trigger('draw.height', height: correctedHeight) if correctedHeight isnt api.height

      api.height = params.height || api.params.height || api.items.height()
      $([ api.items, @viewport.element, @viewport.layout ]).each ->
        this.css height: api.height

    'move.controls': (event, api) ->
      this.undisableControls()

    'scroll.controls': (event, api) ->
      this.undisableControls()

    'tail.controls': (event, api) ->
      this.disableControl @controlNext

    'head.controls': (event, api) ->
      this.disableControl @controlPrevious

  disabledControlDomClass: 'b-sansara-control-disabled'

  disableControl: (control) ->
    control.element.prop 'disabled', true
    control.element.addClass @disabledControlDomClass

  undisableControls: ->
    for item in [ @controlNext.element, @controlPrevious.element ]
      item.prop 'disabled', false
      item.removeClass @disabledControlDomClass
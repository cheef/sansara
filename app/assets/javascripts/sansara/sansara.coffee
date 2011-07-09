class window.Sansara
  constructor: (element, params) ->
    @api = new Sansara.Api(element, this.mergeParams(params))

    this.initializeWidget()
    this.initializePlugins()

    @api.subscribe @bindings, this
    @api.trigger 'initialize'
    @api.trigger 'draw' if this.isAutorun()

  initializeWidget: ->
    @api.widget = $.sansara.widgets[ @api.params.widget ]
    @api.widget.enable(@api)

  initializePlugins: ->

  mergeParams: (params) ->
    $.extend {}, params || {}, @defaults

  isAutorun: -> @api.params.autorun is true

  bindings:
    'draw.item': (event, api) ->
    'next.item': (event, api) ->
      api.trigger 'scroll', to: @current + 1
    'scroll.item': (event, api, params) ->
      $(api.element).animate
        left: -(api.widget.viewport.width() * params.to) + api.widget.viewport.width()
      @current = params.to
    'move.item': (event, api, params) ->
      $(api.element).css left: -(api.widget.viewport.width() * params.to) + api.widget.viewport.width()
      @current = params.to
    'previous.item': (event, api) ->
      api.trigger 'scroll', to: @current - 1

  defaults:
    autorun: true
    widget: 'horizontal'
    debug: true
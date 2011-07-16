class window.Sansara

  constructor: (element, params) ->
    @api = new Sansara.Api $(element), this.mergeParams(params)

    this.enableWidget()
    this.enablePlugins()

    @api.trigger 'initialize'
    @api.trigger 'draw' if this.isAutorun()

  enableWidget: ->
    widgetName = @api.params.widget
    widgetExtends = $.sansara.widgets[ widgetName ]

    if widgetExtends?
      widget = new Sansara.Widget(widgetName, widgetExtends)

      @api.debug "Enabling '#{widgetName}' widget", widget, ->
        @widget = widget
        @widget.enable(this)
    else
      window.console.error "Widget '#{widgetName}' not found" if window.console?

  enablePlugins: ->
    for pluginName in this.selectedPluginNames()
      pluginExtends = $.sansara.plugins[ pluginName ]

      if pluginExtends?
        this.enablePlugin new Sansara.Plugin(pluginName, pluginExtends)
      else
        window.console.error "Plugin '#{pluginName}' not found" if window.console?

  enablePlugin: (plugin) ->
    try
      @api.debug "Enabling '#{plugin.name}' plugin", plugin, ->
        plugin.enable(this)
        @plugins[ plugin.name ] = plugin

    catch error
      window.console.error "Plugin '#{pluginName}' not enabled, because of error: #{error}" if window.console?

  selectedPluginNames: ->
    pluginNames = $.merge [], @api.widget.plugins || []
    pluginNames = $.merge pluginNames, @api.params.plugins || []

  mergeParams: (params) ->
    $.extend {}, @defaults, params || {}

  isAutorun: -> @api.params.autorun is true

  defaults:
    autorun: true
    widget: 'horizontal'
    debug: false
    theme: 'jquery-carousel'
    size: 1
    sizesAutoCorrection: true
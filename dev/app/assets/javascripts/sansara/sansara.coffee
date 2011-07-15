class window.Sansara

  constructor: (element, params) ->
    @api = new Sansara.Api $(element), this.mergeParams(params)

    this.enableWidget()
    this.enablePlugins()

    @api.trigger 'initialize'
    @api.trigger 'draw' if this.isAutorun()

  enableWidget: ->
    @api.widget = $.sansara.widgets[ @api.params.widget ]
    @api.widget.enable(@api)

  enablePlugins: ->
    for pluginName in this.selectedPluginNames()
      plugin = $.sansara.plugins[ pluginName ]

      if not plugin
        window.console.error "Plugin '#{pluginName}' not found" if window.console?
      else
        this.enablePlugin plugin

  enablePlugin: (plugin) ->
    try
      plugin.enable(@api)
      @api.plugins[ plugin.name ] = plugin
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
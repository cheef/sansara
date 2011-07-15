$.sansara.plugin 'theme-roller',

  events:
    'initialize.theme-roller': (event, api) ->
      @theme = @params.theme

    'draw.theme-roller': (event, api) ->
      @widget.wrapper.layout.addClass @plugins['theme-roller'].getThemeDomClass(@theme)

    'change_theme.theme-roller': (event, api, params = {}) ->
      @widget.wrapper.layout.removeClass @plugins['theme-roller'].getThemeDomClass(@theme)
      @theme = params.name
      this.trigger 'draw.theme-roller'

  methods:

    changeTheme: (name) ->
      this.trigger 'change_theme.theme-roller', name: name

  getThemeDomClass: (theme) ->
    [ 'l-sansara', theme, 'theme' ].join('-')
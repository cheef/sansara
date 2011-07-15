describe "window.Sansara", ->

  sansara = new Sansara mockSandbox(), autorun: false
  plugin  = sansaraPlugin('foo')

  console.log $.sansara.plugins

  describe "when user didn't assign any plugins", ->

    beforeEach ->
      sansara.api.params.plugins = []

    describe "and when widget has required plugin", ->

      beforeEach ->
        sansara.api.widget.plugins = [ @name = plugin.name ]

      describe "selectedPluginNames", ->

        beforeEach -> @result = sansara.selectedPluginNames()

        it "should find this plugin name", ->
          expect( $.inArray(@name, @result) ).not.toBe -1

        it "should be only one plugin", ->
          expect( @result.length ).toBe 1

      describe "enablePlugins", ->

        beforeEach ->
          @callback = plugin.enable = jasmine.createSpy()
          console.log $.sansara.plugins
          sansara.enablePlugins()
          console.log $.sansara.plugins

        it "should enable found plugins", ->
          expect(@callback).toHaveBeenCalled()
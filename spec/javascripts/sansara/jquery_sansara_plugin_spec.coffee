describe "$.sansara.plugin", ->

  it "should be a plugin constructor", ->
    expect( $.isFunction($.sansara.plugin) ).toBeTruthy()

  describe "when calling", ->

    beforeEach ->
      @name    = 'foo'
      @methods = {}
      $.sansara.plugin(@name, @methods)

    it "should add plugin to collection", ->
      expect( $.type($.sansara.plugins[ @name ]) ).toBe 'object'

    describe "added plugin", ->

      beforeEach ->
        @plugin = $.sansara.plugins[ @name ]

      it "should be a Sansara.Plugin instance", ->
        expect(@plugin instanceof Sansara.Plugin).toBeTruthy()
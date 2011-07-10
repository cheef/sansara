describe "$.sansara.widget", ->

  it "should be widget constuctor", ->
    expect( $.isFunction($.sansara.widget) ).toBeTruthy()

  describe "when calling", ->

    beforeEach ->
      @name   = 'foo'
      @method = 'bar'

      methods = {}
      methods[ @method ] = ->

      $.sansara.widget @name, methods

    it "should add new widget to the collection", ->
      expect( $.type($.sansara.widgets[ @name ]) ).toBe 'object'

    describe "added widget", ->
      beforeEach ->
        @widget = $.sansara.widgets[ @name ]

      it "should be an instance of Widget", ->
        expect(@widget instanceof Sansara.Widget).toBeTruthy()

      it "should extend base Widget with new methods", ->
        expect( $.isFunction(@widget[ @method ]) ).toBeTruthy()
describe "$.sansara.widget", ->

  it "should be widget constuctor", ->
    expect(typeof $.sansara.widget).toBe 'function'

  describe "when calling", ->

    beforeEach ->
      @name   = 'foo'
      @method = 'bar'

      methods = {}
      methods[ @method ] = ->

      $.sansara.widget @name, methods

    it "should add new widget to the collection", ->
      expect(typeof $.sansara.widgets[ @name ]).toBe 'object'

    describe "added widget", ->
      beforeEach ->
        @widget = $.sansara.widgets[ @name ]

      it "should be an instance of Widget", ->
        expect(@widget instanceof Sansara.Widget).toBeTruthy()

      it "should extend base Widget with new methods", ->
        expect(typeof @widget[ @method ]).toBe 'function'
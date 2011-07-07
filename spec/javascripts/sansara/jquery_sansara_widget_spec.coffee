describe "$.sansara.widget", ->

  it "should be widget constuctor", ->
    expect(typeof $.sansara.widget).toBe 'function'

  describe "when calling", ->

    beforeEach ->
      @name = 'foo'
      $.sansara.widget @name, ->

    it "should add new widget to the collection", ->
      expect(typeof $.sansara.widgets[ @name ]).toBe 'object'
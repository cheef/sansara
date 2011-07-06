describe "$.sansara.widget", ->

  it "should be widget constuctor", ->
    expect(typeof $.sansara.widget).toBe 'function'

  describe "when calling", ->

    it "should add new widget to the collection", ->
describe "$.sansara", ->

  it "should be a carousel constructor", ->
    expect(typeof $.sansara).toBe 'function'

  describe "when calling", ->
    setFixtures $('<div class="foo">')

#    it "should store an api object to the data", ->
#      expect(typeof @element.data('sansara')).toBe 'object'

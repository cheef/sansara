describe "$.sansara", ->

  it "should be a carousel constructor", ->
    expect(typeof $.sansara).toBe 'function'

  describe "when calling", ->
    console.log mockSandboxTemplate()
    setFixtures $('<div class="foo">')
    console.log $('.foo')
#    @element = sansaraMock()

    it "should store an api object to the data", ->
      expect(typeof @element.data('sansara')).toBe 'object'

describe 'jquery-carousel', ->
  it "should be in jQuery.fn", ->
    expect(typeof $.fn.carousel).toBe 'function'

  it "should be an element function", ->
    expect(typeof $(window).carousel).toBe 'function'

  describe 'when applying to an element', ->
    sandbox = null
    beforeEach ->
      sandbox = setCarouselSandbox()
      sandbox.carousel
        width:  250
        height: 250

    it "should store carousel api to the data", ->
      expect(typeof sandbox.data('carousel')).toBe 'object'
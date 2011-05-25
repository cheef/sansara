describe 'jquery-carousel', ->
  it "should be in jQuery.fn list", ->
    expect(typeof $.fn.carousel).toBe 'function'
  it "should be existed function for element", ->
    expect(typeof $(window).carousel).toBe 'function'

  describe 'when applying to an element', ->
    beforeEach ->
      @sandbox = defineCarousel()
    it "should store carousel api to the it data", ->
      expect(typeof @sandbox.data('carousel')).toBe 'object'
    it "should add 'b-carousel-items' class to it", ->
      expect(@sandbox).toHaveClass 'b-carousel-items'

    for event in ['initialize', 'draw']
      it "should define '#{event}' event", ->
        expect($(@sandbox)).toHandle event

    describe 'and wrap it with viewport, that', ->
      beforeEach ->
        @parent = @sandbox.parent()
      it "should has 'b-carousel-viewport' class", ->
        expect(@parent).toHaveClass 'b-carousel-viewport'

#      it "should has an layout", ->
#        expect(parent.parent()).toHaveClass 'l-carousel-viewport'


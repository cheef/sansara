describe "Carousel.Utils", ->
  describe "method arrayFromArguments", ->
    for arg in [ undefined, null, [] ]
      it "should expects wrong arguments like '#{arg}' and convert it to array", ->
        expect( Carousel.Utils.arrayFromArguments arg ).toEqual []

    it "should converts 'arguments' object to array", ->
      arg = -> arguments
      expect( Carousel.Utils.arrayFromArguments arg ).toEqual []

  describe "method parseMixedArguments", ->
    arg = null
    beforeEach ->
      arg = ['method', -> ]

    it "should convert arguments to hash", ->
      expect( typeof Carousel.Utils.parseMixedArguments(arg) ).toEqual 'object'

    it "should correctly convert two-arguments execution", ->
      expect( Carousel.Utils.parseMixedArguments(arg).method ).toBeDefined()

    it "should correctly convert one-argument execution", ->
      arg = [ method: -> ]
      expect( Carousel.Utils.parseMixedArguments(arg).method ).toBeDefined()

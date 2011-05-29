describe 'Carousel.Themes', ->
  describe "when theme names isn't defined in the arguments", ->
    beforeEach ->
      @carousel = defineCarousel()
      @api = @carousel.data('carousel')
      @theme = new Carousel.Themes.Default(@api)

    describe "it should use default theme", ->
      it "should add theme class to the wrapper layout", ->
        expect( $(@api.carousel.container.wrapper.layout) ).toHaveClass(@theme.defaults.domClass)

  describe "when theme name is defined in the arguments", ->

    for name in ['Eysmond', 'Default']
      describe "and name is '#{name}'", ->
        beforeEach ->
          @carousel = defineCarousel(theme: name)
          @theme = new (Carousel.Themes[name])({})
          @api = @carousel.data('carousel')

        it "should add theme class to the wrapper layout", ->
          expect( $(@api.carousel.container.wrapper.layout) ).toHaveClass(@theme.defaults.domClass)
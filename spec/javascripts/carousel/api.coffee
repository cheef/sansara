describe 'Carousel.Api', ->
  api = new Carousel.Api {}
  methods = ['trigger', 'subscribe', 'next', 'previous']

  for method in methods
    it "should has '#{method}' public method", ->
      expect( eval("typeof api.#{method}") ).toBe 'function'

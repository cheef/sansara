describe 'Sansara.Api', ->

  beforeEach ->
    @api = apiMock()

  for method in [ 'trigger', 'subscribe', 'next', 'previous' ]
    it "should has '#{method}' public method", ->
      expect( $.isFunction(@api[ method ]) ).toBeTruthy()

  describe "subscribe", ->

    beforeEach ->
      @api.subscribe (@event = 'foo'), (@callback = ->)

    it "should add event to the sansara element", ->
      expect( @api.element ).toHandle @event

  describe "trigger", ->

    beforeEach ->
      @callback = jasmine.createSpy()
      @api.subscribe 'foo', @callback
      @api.trigger 'foo'

    it "should run subscribed callback", ->
      expect(@callback).toHaveBeenCalled()
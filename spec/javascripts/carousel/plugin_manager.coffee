describe 'Carousel.PluginManager', ->
  beforeEach ->
    @api = apiStub()
    @manager = new Carousel.PluginManager(@api)
    Carousel.Plugins = {}
    Carousel.Plugins[@name = 'foo'] = @constructor = -> 'bar'
  describe 'method add', ->
    beforeEach -> @manager.add @name, @constructor
    it "should store plugin to the api", ->
      expect(@api.plugins).toBeDefined()
    it "should store plugin by name", ->
      expect(@api.plugins[@name]).toBeDefined()
    it "should initialize plugin instance", ->
      expect(@api.plugins[@name]).toEqual(new @constructor)

  describe 'method detect', ->
    it "should run 'add' method if at least one plugin were found", ->
      spyOn(@manager, 'add')
      @manager.detect()
      expect(@manager.add).toHaveBeenCalled()
    it "should detect and store found plugins to the api", ->
      @manager.detect()
      expect(@api.plugins).toBeDefined()
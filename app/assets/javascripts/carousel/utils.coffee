Carousel = Carousel || {}
Carousel.Utils =

  arrayFromArguments: (args) ->
    if typeof args is 'undefined' then []
    else Array.prototype.slice.call(args)

  # Allows formats below:
  # 'method', callback,  [context]
  # { method: callback}, [context]
  #
  parseMixedArguments: (args) ->
    args       = Carousel.Utils.arrayFromArguments(args)
    nameOrHash = args.shift()

    if typeof nameOrHash is 'string'
      bindings = {}
      bindings[nameOrHash] = args.shift()
    else
      bindings = nameOrHash

    context = args.shift()

    if typeof bindings isnt 'object'
      throw "First param should be a string or hash, but received #{typeof bindings}"

    [ bindings, context ]

  debugWrapper: (context, message, callback) ->
    console.log(message) if window.console && @params.debug
    callback.apply context
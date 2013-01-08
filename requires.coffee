# Anything involving Node's "require" (besides NPM modules) goes here

@requires = {
  require: __meteor_bootstrap__.require
}

requires.addRequire = (names...) ->
  _.each names, (name) ->
    requires[name] = requires.require name

requires.addRequire 'request', 'fs', 'querystring', 'util', 'path'

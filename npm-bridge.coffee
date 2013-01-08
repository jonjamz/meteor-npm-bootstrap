# Modules
@modules = {}

# Import NPM Module to Meteor (after npm install in (root)/public/node_modules)
modules.importModules = (names...) ->
  _.each names, (name) ->
    modulePath = "node_modules/#{name}"
    base = requires.path.resolve "."
    base = requires.path.dirname global.require.main.filename  if base is "/"
    publicPath = requires.path.resolve base + "/public/" + modulePath
    staticPath = requires.path.resolve base + "/static/" + modulePath
    if requires.fs.existsSync publicPath
      modules[name] = requires.require publicPath
    else if requires.fs.existsSync staticPath
      modules[name] = requires.require staticPath
    else
      console.log "node_modules not found at #{publicPath} or #{staticPath}"

# example after creating ./public/node_modules and running npm install cheerio:
modules.importModules "cheerio"

# then you'd access Cheerio by calling modules.cheerio from anywhere

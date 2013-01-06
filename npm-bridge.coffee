# Modules
@Modules = {}

# Import NPM Module to Meteor
importModule = (modulePath, moduleVar) ->
  require = __meteor_bootstrap__.require
  path = require("path")
  fs = require("fs")
  modulePath = "node_modules/#{modulePath}"
  base = path.resolve(".")
  base = path.dirname(global.require.main.filename)  if base is "/"
  publicPath = path.resolve(base + "/public/" + modulePath)
  staticPath = path.resolve(base + "/static/" + modulePath)
  if fs.existsSync(publicPath)
    Modules[moduleVar] = require(publicPath)
  else if fs.existsSync(staticPath)
    Modules[moduleVar] = require(staticPath)
  else
    #console.log publicPath
    console.log "node_modules not found"

# example after creating ./public/node_modules and running npm install cheerio:
importModule "cheerio", "Cheerio"

# then you'd access cheerio by calling Modules.cheerio from anywhere

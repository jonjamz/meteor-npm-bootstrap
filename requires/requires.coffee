# Node.js and NPM packages

@requires = {
  NpmReq: (n) ->
    Npm.require n
  MeteorReq: (n) ->
    Meteor.require n
  addNpmReq: (names...) ->
    for n in names
      requires[n] = requires.NpmReq n
  addMeteorReq: (names...) ->
    for n in names
      requires[n] = new requires.MeteorReq n
}

requires.addNpmReq 'fs',
  'util'
  'path'
  'child_process'
  'http'
  'querystring'

requires.addMeteorReq 'urlparse',
  'cheerio'
  'string'

@Fiber = requires.NpmReq 'fibers'
@Future = requires.NpmReq 'fibers/future'

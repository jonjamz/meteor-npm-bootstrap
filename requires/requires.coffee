# Node.js and NPM packages
# Once added here, access with requires.packageName

@requires = {
  
  # This is for anything already included with the project, like Node.js modules or Fibers
  NpmReq: (n) ->
    Npm.require n
  addNpmReq: (names...) ->
    for n in names
      requires[n] = requires.NpmReq n
  
  # This is for NPM packages that you'll specify in package.json with the NPM Atmosphere package
  # https://atmosphere.meteor.com/package/npm
  MeteorReq: (n) ->
    Meteor.require n
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

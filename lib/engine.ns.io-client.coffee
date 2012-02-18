# require
engine = require 'engine.io-client'
engineNsBase = require 'engine.ns.io-base'

# extend engine
engineNsBase.extendEngine engine

# re-export engine
module.exports = engine

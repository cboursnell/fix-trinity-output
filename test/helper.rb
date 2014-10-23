require 'simplecov'
require 'test/unit'
begin; require 'turn/autorun'; rescue LoadError; end
require 'shoulda-context'
require 'fix-trinity-output'

Turn.config.format = :pretty
Turn.config.trace = 5

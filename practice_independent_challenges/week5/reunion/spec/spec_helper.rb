require 'pry'
require './lib/activity'
require './lib/reunion'

def capture_stdout
  original_stdout = $stdout
  $stdout = StringIO.new
  yield
  $stdout.string
ensure
  $stdout = original_stdout
end

RSpec.configure do |config|
  config.formatter = :documentation
end
require 'dotenv'
Dotenv.load

DevCycleClient = DevCycle::Client.new(
  ENV['DEVCYCLE_SERVER_SDK_KEY'],
  DevCycle::Options.new,
  true
)
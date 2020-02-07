# frozen_string_literal: true

require 'pry'
require 'awesome_print'

require 'securerandom'
require 'tick_tick/api/client'

def generate_id
  SecureRandom.hex(12)
end

c = TickTick::API::Client.new(logger: ::Logger.new(STDERR))

if File.exist?('test-token')
  c.token = File.read('test-token')
else
  c.sign_in(username: ENV['TICKTICK_USERNAME'], password: ENV['TICKTICK_PASSWORD'])
  File.write('test-token', c.token)
end

require 'tick_tick/api/entities/batch_check'

data = c.batch_check
ap data
bc = TickTick::API::Entities::BatchCheck.new(data)

ap bc

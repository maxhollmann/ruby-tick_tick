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

task = TickTick::API::Response.new(
  id: generate_id,
  projectId: 'inbox115730865',
  title: %w[this task is to test the api of TickTick via ruby].shuffle.join(' ').capitalize,
  assignee: nil,
  content: '',
  deleted: 0,
  dueDate: nil,
  exDate: [],
  isFloating: false,
  items: [],
  modifiedTime: '2020-02-07T14:11:54.573+0000',
  priority: 0,
  progress: 0,
  reminders: [],
  sortOrder: -12_094_627_905_536,
  startDate: nil,
  status: 0,
  tags: ['business'],
  timeZone: 'Europe/Berlin',
)

c.add_task task
c.delete_task task
c.empty_trash

# frozen_string_literal: true

require 'tick_tick/api/entities/base'
require 'tick_tick/api/entities/project'

module TickTick
  module API
    module Entities
      class Project < ::TickTick::API::Entities::Base
        attribute :id, Types::Strict::String
        attribute :name, Types::Strict::String
      end
    end
  end
end

# frozen_string_literal: true

require 'tick_tick/api/entities/base'
require 'tick_tick/api/entities/project'

module TickTick
  module API
    module Entities
      class Tag < ::TickTick::API::Entities::Base
        attribute :name, Types::Strict::String
        attribute :sort_order, Types::Strict::Integer
        attribute :sort_type, Types::Strict::String
        attribute :color, Types::Strict::String
        attribute :etag, Types::Strict::String
      end
    end
  end
end

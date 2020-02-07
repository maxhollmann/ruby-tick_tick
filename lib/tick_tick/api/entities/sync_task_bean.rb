# frozen_string_literal: true

require 'tick_tick/api/entities/base'

module TickTick
  module API
    module Entities
      class Task < ::TickTick::API::Entities::Base
        attribute :id, Types::Strict::String
        attribute :project_id, Types::Strict::String
        attribute :title, Types::Strict::String
        attribute :content, Types::String
      end
    end
  end
end

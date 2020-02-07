# frozen_string_literal: true

require 'tick_tick/api/entities/base'

module TickTick
  module API
    module Entities
      class Task < ::TickTick::API::Entities::Base
        class Reminder < ::TickTick::API::Entities::Base
          attribute :id, Types::Strict::String
          attribute :trigger, Types::Strict::String
        end

        class Item < ::TickTick::API::Entities::Base
          attribute :id, Types::Strict::String
          attribute :status, Types::Strict::Integer
          attribute :title, Types::Strict::String
          attribute :sort_order, Types::Strict::Integer
          attribute :start_date, Types::String.optional
          attribute :is_all_day, Types::Strict::Bool
          attribute :time_zone, Types::Strict::String
          attribute :snooze_reminder_time, Types::String.optional
          attribute :completed_time, Types::String.optional
        end

        attribute :id, Types::Strict::String
        attribute :project_id, Types::Strict::String
        attribute :title, Types::Strict::String
        attribute :content, Types::String

        attribute :sort_order, Types::Strict::Integer
        attribute :time_zone, Types::Strict::String
        attribute :is_floating, Types::Strict::Bool
        # attribute :reminder, Types::String
        attribute :reminders, Types::Array.of(Reminder)
        # attribute :ex_date, Types::Strict::String
        attribute :priority, Types::Strict::Integer
        attribute :status, Types::Strict::Integer
        attribute :items, Types::Array.of(Item)
        attribute :progress, Types::Strict::Integer
        attribute :modified_time, Types::Strict::String
        attribute :etag, Types::Strict::String.optional
        attribute :deleted, Types::Strict::Integer
        attribute :created_time, Types::Strict::String
        attribute :creator, Types::Strict::Integer
        attribute :tags, Types::Array.of(Types::Strict::String)
        attribute :kind, Types::Strict::String
      end
    end
  end
end

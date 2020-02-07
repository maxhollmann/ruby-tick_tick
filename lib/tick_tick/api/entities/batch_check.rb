# frozen_string_literal: true

require 'tick_tick/api/entities/base'
require 'tick_tick/api/entities/project'
require 'tick_tick/api/entities/tag'

module TickTick
  module API
    module Entities
      class BatchCheck < ::TickTick::API::Entities::Base
        class SyncTaskBean < ::TickTick::API::Entities::Base
          attribute :add,    Types::Array.of(Task)
          attribute :update, Types::Array.of(Task)
          attribute :delete, Types::Array.of(Task)

          def all
            add + update
          end
        end

        attribute :check_point, Types::Integer
        attribute :sync_task_bean, SyncTaskBean
        attribute :project_profiles, Types::Array.of(Project)
        attribute :tags, Types::Array.of(Tag)
        attribute :inbox_id, Types::Strict::String

        def tasks
          sync_task_bean.all
        end

        alias projects project_profiles
      end
    end
  end
end

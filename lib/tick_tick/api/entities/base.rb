# frozen_string_literal: true

require 'dry/struct'
require 'tick_tick/api/entities/types'

module TickTick
  module API
    module Entities
      class Base < Dry::Struct
        transform_keys do |key|
          key
            .to_s
            .gsub(/[A-Z]/) { |match| '_' + match.downcase }
            .to_sym
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'hashie/mash'

module TickTick
  module API
    class Response < ::Hashie::Mash
      def convert_key(key)
        key.to_s.gsub(/_([a-z])/) do |match|
          match[1].upcase
        end
      end
    end
  end
end

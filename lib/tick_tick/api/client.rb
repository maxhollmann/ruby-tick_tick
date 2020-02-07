# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'tick_tick/api/response'

module TickTick
  module API
    class Client
      attr_reader :endpoint
      attr_accessor :token

      def initialize(endpoint: 'https://api.ticktick.com/api/v2/', token: nil, logger: nil)
        @endpoint = endpoint
        @token = token
        @logger = logger
      end

      def sign_in(username:, password:)
        post('user/signon') do |req|
          req.body = {
            username: username,
            password: password,
          }
        end.tap do |r|
          @token = r.token if r.token && r.token != ''
        end
      end

      def limits
        get('configs/limits')
      end

      def profile
        get('user/profile')
      end

      def status
        get('user/status')
      end

      def completed_in_all(from: nil, to: nil, limit: nil)
        get('project/all/completedInAll')
      end

      def batch_check(checkpoint = 0)
        get("batch/check/#{checkpoint}")
      end

      def add_task(task)
        batch_request('task', add: [task.to_h])
      end

      def delete_task(task)
        batch_request('task', delete: [{
          taskId: task.id,
          projectId: task.project_id,
        }])
      end

      def empty_trash
        delete('trash/empty')
      end

      private

      def get(path, &block)
        request :get, path, &block
      end

      def post(path, &block)
        request :post, path, &block
      end

      def delete(path, &block)
        request :delete, path, &block
      end

      def request(method, path, &block)
        response = connection.send(method, path) do |req|
          req.headers['Cookie'] = "t=#{@token}" if @token
          block&.call(req)
        end
        raise "Status #{response.status}" unless response.status.to_s =~ /2\d\d/

        response.body
      end

      def batch_request(path, add: [], update: [], delete: [])
        post("batch/#{path}") do |req|
          req.body = {
            add: add,
            update: update,
            delete: delete,
          }
        end
      end

      def connection
        @connection ||= Faraday::Connection.new(url: @endpoint) do |conn|
          conn.request :json

          conn.response :mashify, mash_class: Response
          conn.response :json, content_type: /\bjson$/

          if @logger
            conn.response :logger, @logger, bodies: false
          end

          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end

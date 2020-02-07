# frozen_string_literal: true

require 'tick_tick/api/client'

RSpec.describe TickTick::API::Client do
  subject(:client) { described_class.new }

  describe '.new' do
    it 'sets the token' do
      expect(described_class.new(token: 'abc').token).to eq('abc')
    end

    it 'sets the endpoint' do
      expect(described_class.new(endpoint: 'abc').endpoint).to eq('abc')
    end

    it 'sets the correct endpoint by default' do
      expect(described_class.new.endpoint).to eq('https://api.ticktick.com/api/v2/')
    end
  end

  describe '#sign_in' do
    context 'with the wrong credentials' do
      around do |example|
        VCR.use_cassette('sign_in/wrong_credentials') { example.run }
      end

      it 'sets the token on the client' do
        expect { client.sign_in(username: 'user@example.com', password: 'wrongpassword') }
          .to raise_error(/Status 500/)
      end
    end

    context 'with the right credentials' do
      around do |example|
        VCR.use_cassette('sign_in/right_credentials') { example.run }
      end

      it 'sets the token on the client' do
        expect { client.sign_in(username: 'user@example.com', password: 'rightpassword') }
          .to change(client, :token).to('THETOKEN')
      end
    end
  end
end

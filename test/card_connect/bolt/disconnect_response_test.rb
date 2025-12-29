require 'test_helper'

describe CardConnect::Bolt::DisconnectResponse do
  before do
    @response = CardConnect::Bolt::DisconnectResponse.new(valid_bolt_disconnect_response)
  end

  after do
    @response = nil
  end

  describe 'attributes' do
    it 'should have status from response' do
      _(@response.status).must_equal 200
    end
  end

  describe '#success?' do
    it 'should be true' do
      _(@response.success?).must_equal true
    end
  end

  describe '#body' do
    it 'should return hash with status' do
      body = @response.body
      _(body[:status]).must_equal 200
    end
  end
end

require 'test_helper'

describe CardConnect::Bolt::PingResponse do
  before do
    @response = CardConnect::Bolt::PingResponse.new(valid_bolt_ping_response)
  end

  after do
    @response = nil
  end

  describe 'attributes' do
    it 'should have connected status from response body' do
      _(@response.connected).must_equal true
    end
  end

  describe '#success?' do
    it 'should be true' do
      _(@response.success?).must_equal true
    end
  end

  describe '#body' do
    it 'should return hash with status and connected' do
      body = @response.body
      _(body[:status]).must_equal 200
      _(body[:connected]).must_equal true
    end
  end
end

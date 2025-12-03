require 'test_helper'

describe CardConnect::Bolt::ConnectResponse do
  before do
    @response = CardConnect::Bolt::ConnectResponse.new(valid_bolt_connect_response)
  end

  after do
    @response = nil
  end

  describe 'attributes' do
    it 'should parse session key from header' do
      _(@response.session_key).must_equal 'abc123sessionkey'
    end

    it 'should parse expires from header' do
      _(@response.expires).must_equal '3600'
    end
  end

  describe '#success?' do
    it 'should be true when connected' do
      _(@response.success?).must_equal true
    end
  end

  describe '#body' do
    it 'should return hash with session_key and expires' do
      body = @response.body
      _(body[:session_key]).must_equal 'abc123sessionkey'
      _(body[:expires]).must_equal '3600'
    end
  end

  describe '#get_session_key' do
    it 'should extract session key from header string' do
      _(@response.get_session_key('mykey;expires=100')).must_equal 'mykey'
    end

    it 'should handle nil' do
      _(@response.get_session_key(nil)).must_be_nil
    end
  end

  describe '#get_expires' do
    it 'should extract expires from header string' do
      _(@response.get_expires('mykey;expires=100')).must_equal '100'
    end

    it 'should handle nil' do
      _(@response.get_expires(nil)).must_be_nil
    end
  end
end

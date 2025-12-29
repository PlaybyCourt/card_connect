require 'test_helper'

describe CardConnect::CardPointe::VoidResponse do
  before do
    @response = CardConnect::CardPointe::VoidResponse.new(valid_void_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      _(@response.merchid).must_equal '000000927996'
    end

    it 'should have the amount' do
      _(@response.amount).must_equal '1.01'
    end

    it 'should have the currency' do
      _(@response.currency).must_equal 'USD'
    end

    it 'should have the retref' do
      _(@response.retref).must_equal '288013185633'
    end

    it 'should have the authcode' do
      _(@response.authcode).must_equal 'REVERS'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '00'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'FNOR'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Approval'
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      _(@response.success?).must_equal true
    end

    it 'should be false when there are errors' do
      void_response = valid_void_response.merge('respstat' => 'C', 'resptext' => 'Declined')
      response = CardConnect::CardPointe::VoidResponse.new(void_response)
      _(response.success?).must_equal false
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      _(@response.body).must_equal symbolize_keys(valid_void_response)
    end
  end
end

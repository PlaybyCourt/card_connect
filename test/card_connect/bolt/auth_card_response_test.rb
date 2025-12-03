require 'test_helper'

describe CardConnect::Bolt::AuthCardResponse do
  before do
    @response = CardConnect::Bolt::AuthCardResponse.new(valid_bolt_auth_card_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the token' do
      _(@response.token).must_equal '9419786452781111'
    end

    it 'should have the expiry' do
      _(@response.expiry).must_equal '1225'
    end

    it 'should have the name' do
      _(@response.name).must_equal 'TOM JONES'
    end

    it 'should have the batch id' do
      _(@response.batchid).must_equal '71742042'
    end

    it 'should have the retref' do
      _(@response.retref).must_equal '343005123105'
    end

    it 'should have the avsresp' do
      _(@response.avsresp).must_equal '9'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'FNOR'
    end

    it 'should have the amount' do
      _(@response.amount).must_equal '100'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Approved'
    end

    it 'should have the authcode' do
      _(@response.authcode).must_equal '046221'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '00'
    end

    it 'should have the merchant id' do
      _(@response.merchid).must_equal '000000927996'
    end

    it 'should have the cvvresp' do
      _(@response.cvvresp).must_equal 'M'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end
  end

  describe '#success?' do
    it 'should be true when response status is A' do
      _(@response.success?).must_equal true
    end

    it 'should be false when response status is not A' do
      mock_response = MockFaradayResponse.new(
        body: valid_bolt_auth_card_response.body.merge('respstat' => 'C', 'resptext' => 'Declined')
      )
      response = CardConnect::Bolt::AuthCardResponse.new(mock_response)
      _(response.success?).must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      _(@response.errors).must_be_empty
    end

    it 'should contain error message when response status is not A' do
      mock_response = MockFaradayResponse.new(
        body: valid_bolt_auth_card_response.body.merge('respstat' => 'C', 'resptext' => 'Declined')
      )
      response = CardConnect::Bolt::AuthCardResponse.new(mock_response)
      _(response.errors).must_equal ['Declined']
    end
  end

  describe '#body' do
    it 'should return hash with all fields' do
      body = @response.body
      _(body[:token]).must_equal '9419786452781111'
      _(body[:respstat]).must_equal 'A'
      _(body[:merchid]).must_equal '000000927996'
    end
  end
end

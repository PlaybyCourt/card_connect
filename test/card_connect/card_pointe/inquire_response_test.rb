require 'test_helper'

describe CardConnect::CardPointe::InquireResponse do
  before do
    @response = CardConnect::CardPointe::InquireResponse.new(valid_inquire_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the amount' do
      _(@response.amount).must_equal '596.00'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Approval'
    end

    it 'should have the settlement status' do
      _(@response.setlstat).must_equal 'NOTCAPTURED'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '00'
    end

    it 'should have the retref' do
      _(@response.retref).must_equal '288015190411'
    end

    it 'should have the merchant id' do
      _(@response.merchid).must_equal '000000927996'
    end

    it 'should have the account' do
      _(@response.account).must_equal '41XXXXXXXXXX4113'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'FNOR'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the currency' do
      _(@response.currency).must_equal 'USD'
    end

    it 'should have the capture date' do
      _(@response.capturedate).must_equal '20230510'
    end

    it 'should have the batch id' do
      _(@response.batchid).must_equal '71742042'
    end

    it 'should have the token' do
      _(@response.token).must_equal '9419786452781111'
    end

    it 'should have the auth date' do
      _(@response.authdate).must_equal '20230510'
    end

    it 'should have the last four' do
      _(@response.lastfour).must_equal '4113'
    end

    it 'should have the name' do
      _(@response.name).must_equal 'TOM JONES'
    end

    it 'should have the settle date' do
      _(@response.settledate).must_equal '20230511'
    end

    it 'should have the expiry' do
      _(@response.expiry).must_equal '04/32'
    end
  end

  describe '#success?' do
    it 'should be true when there are no errors' do
      _(@response.success?).must_equal true
    end
  end

  describe '#errors' do
    it 'should be empty when there are no errors' do
      _(@response.errors).must_be_empty
    end
  end

  describe '#body' do
    it 'should generate hash with key fields' do
      body = @response.body
      _(body[:amount]).must_equal '596.00'
      _(body[:merchid]).must_equal '000000927996'
      _(body[:token]).must_equal '9419786452781111'
    end
  end
end

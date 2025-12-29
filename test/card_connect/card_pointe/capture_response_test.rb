require 'test_helper'

describe CardConnect::CardPointe::CaptureResponse do
  before do
    @response = CardConnect::CardPointe::CaptureResponse.new(valid_capture_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the merchant id' do
      _(@response.merchid).must_equal '000000927996'
    end

    it 'should have the account' do
      _(@response.account).must_equal '41XXXXXXXXXX4113'
    end

    it 'should have the amount' do
      _(@response.amount).must_equal '596.00'
    end

    it 'should have the retref' do
      _(@response.retref).must_equal '288002073633'
    end

    it 'should have the settlement status' do
      _(@response.setlstat).must_equal 'Pending'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'FNOR'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Approval'
    end

    it 'should have the commercial card flag' do
      _(@response.commcard).must_equal 'N'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '00'
    end

    it 'should have the batch id' do
      _(@response.batchid).must_equal '71742042'
    end

    it 'should have the token' do
      _(@response.token).must_equal '9419786452781111'
    end
  end

  describe '#body' do
    it 'should generate hash with all the right values' do
      _(@response.body).must_equal symbolize_keys(valid_capture_response)
    end
  end
end

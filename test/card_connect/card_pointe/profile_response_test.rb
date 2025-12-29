require 'test_helper'

describe CardConnect::CardPointe::ProfileGetResponse do
  before do
    @response = CardConnect::CardPointe::ProfileGetResponse.new(valid_profile_get_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the profile id' do
      _(@response.profileid).must_equal '12345678901234567890'
    end

    it 'should have the account id' do
      _(@response.acctid).must_equal '1'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'B'
    end

    it 'should have the account' do
      _(@response.account).must_equal '41XXXXXXXXXX1111'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal 'A'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Profile found'
    end

    it 'should have the account type' do
      _(@response.accttype).must_equal 'VISA'
    end

    it 'should have the expiry' do
      _(@response.expiry).must_equal '0214'
    end

    it 'should have the name' do
      _(@response.name).must_equal 'TOM JONES'
    end

    it 'should have the address' do
      _(@response.address).must_equal '123 MAIN STREET'
    end

    it 'should have the city' do
      _(@response.city).must_equal 'ANYTOWN'
    end

    it 'should have the region' do
      _(@response.region).must_equal 'AK'
    end

    it 'should have the country' do
      _(@response.country).must_equal 'US'
    end

    it 'should have the postal' do
      _(@response.postal).must_equal '19090'
    end

    it 'should have the phone' do
      _(@response.phone).must_equal '7778789999'
    end

    it 'should have the email' do
      _(@response.email).must_equal 'test@test.com'
    end

    it 'should have the token' do
      _(@response.token).must_equal '9440670166031111'
    end
  end

  describe '#success?' do
    it 'should be true when profile is found' do
      _(@response.success?).must_equal true
    end

    it 'should be false when profile is not found' do
      not_found_response = valid_profile_get_response.merge('respstat' => 'C', 'resptext' => 'Profile not found')
      response = CardConnect::CardPointe::ProfileGetResponse.new(not_found_response)
      _(response.success?).must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when profile is found' do
      _(@response.errors).must_be_empty
    end

    it 'should contain error message when profile not found' do
      not_found_response = valid_profile_get_response.merge('respstat' => 'C', 'resptext' => 'Profile not found')
      response = CardConnect::CardPointe::ProfileGetResponse.new(not_found_response)
      _(response.errors).must_equal ['Profile not found']
    end
  end
end

describe CardConnect::CardPointe::ProfileDeleteResponse do
  before do
    @response = CardConnect::CardPointe::ProfileDeleteResponse.new(valid_profile_delete_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the profile id' do
      _(@response.profileid).must_equal '12345678901234567890'
    end

    it 'should have the account id' do
      _(@response.acctid).must_equal '1'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '08'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Profile Deleted'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'PPS'
    end
  end

  describe '#success?' do
    it 'should be true when deletion is successful' do
      _(@response.success?).must_equal true
    end
  end
end

describe CardConnect::CardPointe::ProfilePutResponse do
  before do
    @response = CardConnect::CardPointe::ProfilePutResponse.new(valid_profile_put_response)
  end

  after do
    @response = nil
  end

  describe 'FIELDS' do
    it 'should have the profile id' do
      _(@response.profileid).must_equal '12345678901234567890'
    end

    it 'should have the account id' do
      _(@response.acctid).must_equal '1'
    end

    it 'should have the response status' do
      _(@response.respstat).must_equal 'A'
    end

    it 'should have the response code' do
      _(@response.respcode).must_equal '09'
    end

    it 'should have the response text' do
      _(@response.resptext).must_equal 'Profile Saved'
    end

    it 'should have the response processor' do
      _(@response.respproc).must_equal 'PPS'
    end

    it 'should have the name' do
      _(@response.name).must_equal 'TOM JONES'
    end

    it 'should have the address' do
      _(@response.address).must_equal '123 MAIN STREET'
    end

    it 'should have the city' do
      _(@response.city).must_equal 'ANYTOWN'
    end

    it 'should have the expiry' do
      _(@response.expiry).must_equal '0214'
    end
  end

  describe '#success?' do
    it 'should be true when profile is saved' do
      _(@response.success?).must_equal true
    end

    it 'should be false when there is an error' do
      error_response = valid_profile_put_response.merge('respstat' => 'C', 'resptext' => 'Error saving')
      response = CardConnect::CardPointe::ProfilePutResponse.new(error_response)
      _(response.success?).must_equal false
    end
  end

  describe '#errors' do
    it 'should be empty when successful' do
      _(@response.errors).must_be_empty
    end

    it 'should contain error when declined' do
      error_response = valid_profile_put_response.merge('respstat' => 'C', 'resptext' => 'Error saving')
      response = CardConnect::CardPointe::ProfilePutResponse.new(error_response)
      _(response.errors).must_equal ['Error saving']
    end
  end
end

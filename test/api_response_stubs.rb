def valid_auth_response
  {
    'respstat' => 'A',
    'account' => '41XXXXXXXXXX1111',
    'expiry' => '04/32',
    'token' => '9419786452781111',
    'retref' => '343005123105',
    'amount' => '111',
    'merchid' => '020594000000',
    'respcode' => '00',
    'resptext' => 'Approved',
    'avsresp' => '9',
    'cvvresp' => 'M',
    'authcode' => '046221',
    'respproc' => 'FNOR',
    'commcard' => 'N',
    'profileid' => '12345678',
    'acctid' => nil
  }
end

def valid_capture_response
  {
    'amount' => '596.00',
    'setlstat' => 'Pending',
    'retref' => '288002073633',
    'merchid' => '000000927996',
    'account' => '41XXXXXXXXXX4113',
    'respproc' => 'FNOR',
    'resptext' => 'Approval',
    'commcard' => 'N',
    'respstat' => 'A',
    'respcode' => '00',
    'batchid' => '71742042',
    'token' => '9419786452781111'
  }
end

def valid_inquire_response
  {
    'amount' => '596.00',
    'resptext' => 'Approval',
    'setlstat' => 'NOTCAPTURED',
    'respcode' => '00',
    'retref' => '288015190411',
    'merchid' => '000000927996',
    'account' => '41XXXXXXXXXX4113',
    'respproc' => 'FNOR',
    'respstat' => 'A',
    'currency' => 'USD',
    'capturedate' => '20230510',
    'batchid' => '71742042',
    'token' => '9419786452781111',
    'authdate' => '20230510',
    'lastfour' => '4113',
    'name' => 'TOM JONES',
    'settledate' => '20230511',
    'expiry' => '04/32'
  }
end

def valid_refund_response
  {
    'amount' => '59.60',
    'resptext' => 'Approval',
    'authcode' => 'REFUND',
    'respcode' => '00',
    'retref' => '288010185242',
    'merchid' => '000000927996',
    'respproc' => 'PPS',
    'respstat' => 'A'
  }
end

def valid_void_response
  {
    'amount' => '1.01',
    'resptext' => 'Approval',
    'authcode' => 'REVERS',
    'respcode' => '00',
    'retref' => '288013185633',
    'merchid' => '000000927996',
    'respproc' => 'FNOR',
    'respstat' => 'A',
    'currency' => 'USD'
  }
end

def valid_profile_get_response
  {
    'resptext' => 'Profile found',
    'respcode' => 'A',
    'respstat' => 'B',
    'respproc' => 'PPS',
    'account' => '41XXXXXXXXXX1111',
    'defaultacct' => '12345',
    'ssnl4' => '1234',
    'email' => 'test@test.com',
    'phone' => '7778789999',
    'region' => 'AK',
    'postal' => '19090',
    'address' => '123 MAIN STREET',
    'accttype' => 'VISA',
    'token' => '9440670166031111',
    'name' => 'TOM JONES',
    'license' => '123451254',
    'country' => 'US',
    'city' => 'ANYTOWN',
    'expiry' => '0214',
    'profileid' => '12345678901234567890',
    'acctid' => '1'
  }
end

def valid_profile_delete_response
  {
    'resptext' => 'Profile Deleted',
    'respcode' => '08',
    'profileid' => '12345678901234567890',
    'acctid' => '1',
    'respproc' => 'PPS',
    'respstat' => 'A'
  }
end

def valid_profile_put_response
  {
    'region' => 'AK',
    'phone' => '7778789999',
    'accttype' => 'VISA',
    'postal' => '19090',
    'ssnl4' => '3655',
    'respproc' => 'PPS',
    'expiry' => '0214',
    'city' => 'ANYTOWN',
    'country' => 'US',
    'resptext' => 'Profile Saved',
    'token' => '9440670166031111',
    'respcode' => '09',
    'address' => '123 MAIN STREET',
    'name' => 'TOM JONES',
    'license' => '123451254',
    'respstat' => 'A',
    'profileid' => '12345678901234567890',
    'acctid' => '1'
  }
end

# Bolt Response Stubs
# Bolt responses receive the full Faraday response object

# Mock Faraday Response for Bolt tests
class MockFaradayResponse
  attr_accessor :status, :body, :headers

  def initialize(status: 200, body: {}, headers: {})
    @status = status
    @body = body
    @headers = headers
  end
end

def valid_bolt_auth_card_response
  MockFaradayResponse.new(
    status: 200,
    body: {
      'token' => '9419786452781111',
      'expiry' => '1225',
      'signature' => nil,
      'name' => 'TOM JONES',
      'batchid' => '71742042',
      'retref' => '343005123105',
      'avsresp' => '9',
      'respproc' => 'FNOR',
      'amount' => '100',
      'resptext' => 'Approved',
      'authcode' => '046221',
      'respcode' => '00',
      'merchid' => '000000927996',
      'cvvresp' => 'M',
      'respstat' => 'A'
    }
  )
end

def valid_bolt_connect_response
  MockFaradayResponse.new(
    status: 200,
    body: {},
    headers: {
      'x-cardconnect-sessionkey' => 'abc123sessionkey;expires=3600'
    }
  )
end

def valid_bolt_disconnect_response
  MockFaradayResponse.new(status: 200, body: {})
end

def valid_bolt_ping_response
  MockFaradayResponse.new(
    status: 200,
    body: { 'connected' => true }
  )
end

def valid_bolt_read_card_response
  MockFaradayResponse.new(
    status: 200,
    body: {
      'token' => '9419786452781111',
      'expiry' => '1225',
      'name' => 'TOM JONES'
    }
  )
end

def valid_bolt_display_response
  MockFaradayResponse.new(status: 200, body: {})
end

def valid_bolt_cancel_response
  MockFaradayResponse.new(status: 200, body: {})
end

def valid_bolt_tip_response
  MockFaradayResponse.new(
    status: 200,
    body: { 'tip' => '5.00' }
  )
end

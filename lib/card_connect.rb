require 'card_connect/version'

require 'card_connect/utils'
require 'card_connect/error'
require 'card_connect/configuration'
require 'card_connect/connection'
require 'card_connect/endpoint'

require 'card_connect/card_pointe/authorization/authorization_request'
require 'card_connect/card_pointe/authorization/authorization_response'
require 'card_connect/card_pointe/capture/capture_request'
require 'card_connect/card_pointe/capture/capture_response'
require 'card_connect/card_pointe/refund/refund_request'
require 'card_connect/card_pointe/refund/refund_response'
require 'card_connect/card_pointe/authorization/authorization_response'
require 'card_connect/card_pointe/profile/profile_get_request'
require 'card_connect/card_pointe/profile/profile_get_response'
require 'card_connect/card_pointe/profile/profile_put_request'
require 'card_connect/card_pointe/profile/profile_put_response'
require 'card_connect/card_pointe/profile/profile_delete_request'
require 'card_connect/card_pointe/profile/profile_delete_response'


require 'card_connect/card_pointe/card_pointe_endpoint'
require 'card_connect/card_pointe/authorization/authorization'
require 'card_connect/card_pointe/profile/profile'

module CardConnect
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def connection
      @connection ||= Connection.new.connection
    end
  end
end
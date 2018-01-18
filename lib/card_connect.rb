require 'card_connect/version'

require 'card_connect/utils'
require 'card_connect/error'
require 'card_connect/configuration'

# CardPointe Endpoint

require 'card_connect/card_pointe/connection'
require 'card_connect/card_pointe/card_pointe_endpoint'

require 'card_connect/card_pointe/authorization/authorization_request'
require 'card_connect/card_pointe/authorization/authorization_response'
require 'card_connect/card_pointe/capture/capture_request'
require 'card_connect/card_pointe/capture/capture_response'
require 'card_connect/card_pointe/void/void_request'
require 'card_connect/card_pointe/void/void_response'
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
require 'card_connect/card_pointe/capture/capture'
require 'card_connect/card_pointe/void/void'
require 'card_connect/card_pointe/refund/refund'

# Bolt Endpoint

require 'card_connect/bolt/connection'
require 'card_connect/bolt/bolt_endpoint'

require 'card_connect/bolt/connect/connect_request'
require 'card_connect/bolt/connect/connect_response'

require 'card_connect/bolt/connect/connect'

module CardConnect
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end
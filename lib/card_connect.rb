require 'card_connect/version'

require 'card_connect/utils'
require 'card_connect/error'
require 'card_connect/configuration'
require 'card_connect/connection'

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
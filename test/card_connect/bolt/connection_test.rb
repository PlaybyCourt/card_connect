require 'test_helper'

describe CardConnect::Bolt::Connection do
  before do
    @connection = CardConnect::Bolt::Connection.new.connection
  end

  after do
    @connection = nil
  end

  describe '#connection' do
    it 'must have authorization header' do
      _(@connection.headers['Authorization']).must_equal CardConnect.configuration.bolt_authorization
    end

    it 'must have session key header' do
      _(@connection.headers['X-CardConnect-SessionKey']).must_equal CardConnect.configuration.bolt_session_key
    end

    it 'must have content type header' do
      _(@connection.headers['Content-Type']).must_equal 'application/json'
    end

    it 'must have a URL that matches the configured bolt endpoint' do
      _(@connection.url_prefix.host).must_equal URI.parse(CardConnect.configuration.bolt_endpoint).host
      _(@connection.url_prefix.scheme).must_equal 'https'
    end

    it 'must have a 100 second timeout' do
      _(@connection.options.timeout).must_equal 100
    end

    describe 'Faraday handlers' do
      it 'must have a handler for encoding the request as json first' do
        _(@connection.builder.handlers.first).must_be :===, Faraday::Request::Json
      end

      it 'must have a handler for parsing the json response second' do
        _(@connection.builder.handlers[1]).must_be :===, Faraday::Response::Json
      end

      it 'has ssl verification on by default' do
        assert(@connection.ssl.verify?)
      end

      it 'has the ability to accept ssl options' do
        config = CardConnect.configuration.dup
        config.connection_options = { ssl: { verify: false } }
        connection = CardConnect::Bolt::Connection.new(config).connection
        refute(connection.ssl.verify)
      end
    end
  end
end

module CardConnect
  module CardPointe
    class BinRequest
      include Utils

      REQUIRED_FIELDS = %i[merchid token].freeze

      FIELDS = REQUIRED_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new Bin Request.
      # The :token field accepts either a CardSecure token or a raw account
      # number — both are valid for the /bin endpoint.
      #
      # @param attrs [Hash]
      # @return CardConnect::CardPointe::BinRequest
      def initialize(attrs = {})
        @errors = []
        set_attributes(attrs, FIELDS)
        validate_required_fields
      end

      def valid?
        errors.empty?
      end

      # Builds the URL segment appended after the resource path.
      # Final URL: /cardconnect/rest/bin/{merchid}/{token}
      def payload
        "/#{merchid}/#{token}"
      end

      private

      def validate_required_fields
        REQUIRED_FIELDS.each do |field|
          value = send(field)
          value.nil? || value.to_s.empty? ? errors.push("#{field.capitalize} is missing") : next
        end
      end
    end
  end
end

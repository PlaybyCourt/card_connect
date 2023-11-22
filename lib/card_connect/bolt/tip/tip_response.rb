module CardConnect
  module Bolt
    class TipResponse
      include Utils

      FIELDS = [:amount, :tip, :total].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)
        set_attributes(response.body, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end

      private

      def process_errors
        @errors << total if total.nil?
      end
    end
  end
end
module CardConnect
  module Utils
    def set_attributes(attributes, fields)
      return if attributes.empty?
      attributes = attributes[0] if attributes.is_a? Array
      attributes = symbolize_keys(attributes)
      fields.each do |attr|
        next unless attributes[attr]
        send("#{attr}=", attributes[attr])
      end
    end

    def symbolize_keys(hash)
      symbolized_hash = {}
      hash.each do |k, v|
        symbolized_hash[k.to_sym] = v
      end
      symbolized_hash
    end

    # protected

    def base_api_path
      '/cardconnect/rest'
    end

    def get
      response_class.new(connection.get(path + request.payload).body)
    rescue Faraday::ResourceNotFound => e
      puts e.message
    end

    def delete
      response_class.new(connection.delete(path + request.payload).body)
    rescue Faraday::ResourceNotFound => e
      puts e.message
    end

    def put
      response_class.new(connection.put(path, request.payload).body)
    rescue Faraday::ResourceNotFound => e
      puts e.message
    end

    def string_to_class(str)
      str.split('::').inject(Object) { |a, e| a.const_get(e) }
    end

  end

end
  
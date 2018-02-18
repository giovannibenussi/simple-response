module SimpleResponse
  # SimpleStruct class is an OpenStruct-like class that allows
  # to assign and read arbitrary values.
  class SimpleStruct
    include SimpleResponse::QueryMethods

    def initialize(**args)
      @attributes = args.dup
    end

    def method_missing(name, *args, &block)
      if existing_query_method?(name)
        query_method(name)
      elsif write_method?(name)
        @attributes[name[0...-1].to_sym] = args.first
      elsif existing_attribute?(name)
        @attributes[name.to_sym]
      end
    end

    def existing_attribute?(name)
      @attributes.key?(name.to_sym)
    end

    def respond_to_missing?(name, include_private = false)
      existing_attribute?(name) || existing_query_method?(name)
    end

    def write_method?(name)
      name[-1] == '='
    end

    def keys
      @attributes.keys
    end
  end
end

module SimpleResponse
  class SimpleStruct < OpenStruct
    include SimpleResponse::QueryMethods

    def method_missing(name, *args, &block)
      if existing_query_method?(name)
        query_method(name)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      existing_query_method?(name)
    end
  end
end

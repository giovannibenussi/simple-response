module SimpleResponse
  require 'ostruct'
  require 'simple_response/query_methods'

  class Response < OpenStruct
    include SimpleResponse::QueryMethods

    def initialize(success:)
      super
      self.success = success
    end

    def success?
      success
    end

    def failure?
      !success?
    end

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

module SimpleResponse
  require 'ostruct'

  class Response < OpenStruct
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
        send(name[0...-1])
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      existing_query_method?(name)
    end

    private

    def existing_query_method?(name)
      return false unless query_method?(name)
      return false unless respond_to?(name[0...-1])

      attribute_class = send(name[0...-1]).class
      attribute_class == TrueClass || attribute_class == FalseClass
    end

    def query_method?(name)
      name[-1] == '?'
    end
  end
end

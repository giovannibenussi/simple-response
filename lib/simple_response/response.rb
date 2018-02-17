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
      if query_method?(name)
        self.send(name[0...-1])
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      query_method?(name)
    end

    private

    def query_method?(name)
      name[-1] == '?'
    end
  end
end

module SimpleResponse
  require 'simple_response/query_methods'
  require 'simple_response/simple_struct'

  class Response < SimpleStruct
    def initialize(success:, **attributes)
      super(attributes)
      @success = success
    end

    def success?
      @success
    end

    def failure?
      !success?
    end
  end
end

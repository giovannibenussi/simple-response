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
  end
end

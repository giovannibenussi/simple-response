require "simple_response/version"
require "simple_response/response"

module SimpleResponse
  def self.new(success: true)
    SimpleResponse::Response.new(success: success)
  end

  def self.success
    new(success: true)
  end

  def self.failure
    new(success: false)
  end
end

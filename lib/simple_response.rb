require "simple_response/version"
require "simple_response/response"

module SimpleResponse
  def self.success
    SimpleResponse::Response.new(success: true)
  end
end

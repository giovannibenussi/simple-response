require "simple_response/version"
require "simple_response/response"

module SimpleResponse
  def self.new(success: true, **attributes)
    SimpleResponse::Response.new(success: success, **attributes)
  end

  def self.success(attributes = {})
    new(success: true, **attributes)
  end

  def self.failure(attributes = {})
    new(success: false, **attributes)
  end
end

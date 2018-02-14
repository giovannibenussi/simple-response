require "simple_response/version"
require "simple_response/response"

module SimpleResponse
  def self.new(success: true, **attributes)
    SimpleResponse::Response.new(success: success).tap do |response|
      attributes.each { |k, v| response[k] = v }
    end
  end

  def self.success(attributes)
    new(success: true, **attributes)
  end

  def self.failure
    new(success: false)
  end
end

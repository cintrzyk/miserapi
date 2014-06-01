module APIControllerSupport
  def json_response
    @json_response ||= JSON.parse response.body
  end

  def obj_response
    @obj_response ||= Hashie::Mash.new json_response
  end

  %w(get post put delete).each do |method|
    define_method "api_#{method}" do |user, action, params = {}, request_headers = {}|
      request.env['HTTP_AUTHORIZATION'] = "Token miser=#{user.auth_token}"
      self.send method, action, params, request_headers
    end
  end
end

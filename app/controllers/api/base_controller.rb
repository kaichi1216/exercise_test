class Api::BaseController < ApplicationController
  skip_forgery_protection
  before_action :raise_limit_request

  #raise limit 60 requests per minute
  def raise_limit_request
    ip = request.remote_ip
    value = RedisService.get_value(ip)

    unless value
      RedisService.init_value(ip)
      return
    end

    if RedisService.check_raise_limit(ip)
      RedisService.set_count(ip)
    else
      render json: { message: "You have fired too many requests. Please wait for a couple of minutes."}, status: 429
    end
  end

end

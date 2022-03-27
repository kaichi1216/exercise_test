$redis = if Rails.env.test?
  MockRedis.new
else
  Redis.new(host: Rails.configuration.redis['host'], port: Rails.configuration.redis['port'])
end
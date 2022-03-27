class RedisService
  EXP_TIME = 60
  REQUEST_LIMIT = 60

  def self.get_value(key)
    return $redis.get(key)
  end

  def self.init_value(key)
    $redis.set(key, 1, ex: EXP_TIME)
  end

  def self.check_raise_limit(key)
    $redis.get(key).to_i < REQUEST_LIMIT ? true : false
  end

  def self.set_count(key)
    $redis.incr(key)
  end
end
class RedisService
  EXP_TIME = 60
  REQUEST_LIMIT = 60
  WUHAN_CORONAVIRUS = "wuhan_vote"
  NO = 0
  YES = 1

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
  #get vote result
  def self.get_wuhan_vote_result
    hash = $redis.hgetall(WUHAN_CORONAVIRUS)

    unless hash.present?
      $redis.hset(WUHAN_CORONAVIRUS, {"yes": 0, "no": 0})
    end

    $redis.hgetall(WUHAN_CORONAVIRUS)
  end

  def self.cast_a_vote(value)
    res = case value
          when NO
            "no"
          when YES
            "yes"
          else
            return
          end

    $redis.hincrby(WUHAN_CORONAVIRUS, res, 1)
  end
end
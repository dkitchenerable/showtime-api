class Stores::Redis
  def self.insert(key, value)
    $redis.set(key, value)
  end

  def self.fetch(key)
    $redis.get(key)
  end
end

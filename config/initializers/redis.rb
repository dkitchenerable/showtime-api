#$redis = Redis::Namespace.new("showtimes", redis: Redis.new)
uri = URI.parse(ENV["REDISTOGO_URL"])
$redis = Redis.new(:url => uri)

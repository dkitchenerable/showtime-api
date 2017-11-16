SHOWTIME_CONFIG = YAML.load(File.read(File.expand_path('../../showtimes_api.yml', __FILE__)))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, ENV['TUMBLRANDOM_CONSUMER_KEY'], ENV['TUMBLRANDOM_CONSUMER_SECRET']
end

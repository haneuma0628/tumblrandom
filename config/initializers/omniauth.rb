Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :tumblr, ENV['TUMBLRANDOM_CONSUMER_KEY'], ENV['TUMBLRANDOM_CONSUMER_SECRET']
  provider :tumblr, "zoWkDZWobzLMZpOfb7zsVwqUbk8FwUjcAHV71ukjjInz7lVPXw", "fVMm1m51OdSMx2zbAA3BFjLmqOQHwBp19a4ZTnri1dUHLwf66U"
end

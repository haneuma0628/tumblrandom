class CertificationsController < ApplicationController
  CALLBACK_URL    = "http://www.tumblr.com/oauth/request_token"
  CONSUMER_KEY    = "zoWkDZWobzLMZpOfb7zsVwqUbk8FwUjcAHV71ukjjInz7lVPXw"
  CONSUMER_SECRET = "fVMm1m51OdSMx2zbAA3BFjLmqOQHwBp19a4ZTnri1dUHLwf66U"

  layout "entrance"

  # Tumblr.configure do |config|
  #   config.consumer_key = CONSUMER_KEY
  #   config.consumer_secret = CONSUMER_SECRET
  #   config.oauth_token = @oauth_token.token
  #   config.oauth_token_secret = @oauth_token.secret
  # end

  def index
  end

  def oauth
    $consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, {:site => "http://www.tumblr.com"})
    $request_token = $consumer.get_request_token(:exclude_callback => true)

    redirect_to $request_token.authorize_url
  end

  def callback
    # @access_token = @require_token.get_access_toke(:oauth_verifier => );
    @oauth_token    = params[:oauth_token]
    @oauth_verifier = params[:oauth_verifier]

    @access_token = $request_token.get_access_token(:oauth_verifier => @oauth_verifier)
    $hold_access_token = OAuth::AccessToken.new($consumer, @access_token.token, @access_token.secret);
  end

  def retry
  end

end

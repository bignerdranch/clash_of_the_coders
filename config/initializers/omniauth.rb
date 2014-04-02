Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stable, ENV['STABLE_KEY'], ENV['STABLE_SECRET']
end

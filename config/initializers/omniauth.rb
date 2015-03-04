Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stable, ENV.fetch('STABLE_KEY'), ENV.fetch('STABLE_SECRET')
end

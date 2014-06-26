OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  require Rails.root.join('lib', 'omniauth', 'strategies', 'crystal_commerce')

  provider OmniAuth::Strategies::CrystalCommerce,
    Rails.application.secrets.sinewave_app_id,
    Rails.application.secrets.sinewave_secret
end

OmniAuth.config.allowed_request_methods = [:post, :get]

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, 'Ov23limJQaVDkYCWaRuP', '50d5d81792966f0532a1b5401d179c74ae569c75', callback_path: '/auth/github/callback'
  else
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end

  OmniAuth.config.allowed_request_methods = [:post]
end


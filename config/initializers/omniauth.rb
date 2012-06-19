Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :vkontakte, '2879917', 'sJMsaa7EYkcsh75iKPMe', :scope => 'friends,wall', :display => 'popup'
  #provider :vkontakte, '2877279', 'Opy78Aqv9BtRkMXGbGJU', :scope => 'friends,wall', :display => 'popup'
  # If you want to also configure for additional login services, they would be configured here.
end

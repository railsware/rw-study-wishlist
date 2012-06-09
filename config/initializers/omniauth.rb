Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  provider :vkontakte, '2967272', 'fzPizsARTp1gY8t5ArwX', :scope => 'friends,wall', :display => 'popup'



  # If you want to also configure for additional login services, they would be configured here.
end
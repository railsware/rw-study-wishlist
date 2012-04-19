# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

VK.init apiId: 2877279
authInfo = (response) ->
  if response.session
    alert "user: " + response.session.mid
  else
    alert "not auth"
VK.Auth.getLoginStatus authInfo
VK.UI.button "login_button"

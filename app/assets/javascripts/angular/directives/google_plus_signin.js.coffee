# Inspired by
# angular-google-plus-directive v0.0.1
# ♡ CopyHeart 2013 by Jerad Bitner http://jeradbitner.com
# Copying is an act of love. Please copy.
#
# Edited by
# Yury Kaliada fut.wrk@gmail.com
#

window.App.directive 'googlePlusSignin', ->
  restrict: 'E'
  templateUrl: '/assets/common/google_buttons.html'
  replace: true
  link: (scope, element, attrs) ->
    attrs.$set 'data-clientid', attrs.clientid

    defaults =
      callback: 'signinCallback'
      cookiepolicy: 'single_host_origin'
      requestvisibleactions: 'http://schemas.google.com/AddActivity'
      scope: attrs.scopes
      width: 'wide'

    angular.forEach Object.getOwnPropertyNames(defaults), (propName) ->
      if (!attrs.hasOwnProperty(propName))
        attrs.$set('data-' + propName, defaults[propName])

    # Default language
    # Supported languages: https://developers.google.com/+/web/api/supported-languages
    attrs.$observe 'language', (value) ->
      window.___gcfg = lang: value ? value : 'en'

    do ->
      po = document.createElement('script'); po.type = 'text/javascript'; po.async = true
      po.src = 'https://apis.google.com/js/client:plusone.js'
      s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s)

window.App.run ($window, $rootScope) ->
  $window.signinCallback = (authResult) ->
    if authResult && authResult.access_token
      $rootScope.$broadcast('event:google-plus-signin-success', authResult)
    else
      $rootScope.$broadcast('event:google-plus-signin-failure', authResult)

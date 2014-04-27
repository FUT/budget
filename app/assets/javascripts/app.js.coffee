window.App = angular.module 'OpenBalance', ['rails', 'ngRoute', 'ui.bootstrap', 'ui.select2'], ->
  # $translateProvider.preferredLanguage 'en'

window.App.run ($route, GoogleFile) ->
  $route.reload()

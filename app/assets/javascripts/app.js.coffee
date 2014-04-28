window.App = angular.module 'OpenBalance', ['ngRoute', 'ui.bootstrap', 'ui.select2'], ->
  # $translateProvider.preferredLanguage 'en'

window.App.run ($route) ->
  $route.reload()

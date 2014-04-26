window.App.controller 'HTMLController', ($scope, $rootScope, $location) ->
  $location.path('/') if !gapi.auth

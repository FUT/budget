window.App.controller 'GoogleButtonsController', ($scope, $rootScope, $location) ->
  $scope.$on 'event:google-plus-signin-success', (event, authResult) ->
    debugger
    console.log 'Sign in success!'
    console.log event
    console.log authResult
    $rootScope.auth = authResult
    gapi.auth = authResult
    $location.path '/dashboard'
    $scope.$apply()

  $scope.$on 'event:google-plus-signin-failure', (event, authResult) ->
    console.log 'Oh nooo! Sign in failure!'

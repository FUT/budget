window.App.controller 'GoogleButtonsController', ($scope, $rootScope, $location) ->
  $scope.$on 'event:google-plus-signin-success', (event, authResult) ->
    $rootScope.auth = authResult
    gapi.client.setApiKey 'AIzaSyD7BFdY33hYiIqziLLehvIlG1Os_rJNgtY'
    $location.path '/dashboard'
    $scope.$apply()

  $scope.$on 'event:google-plus-signin-failure', (event, authResult) ->
    console.log 'Oh nooo! Sign in failure!'

window.App.controller 'GoogleButtonsController', ($scope, $rootScope, $location, dump, GoogleFile) ->
  $scope.$on 'event:google-plus-signin-success', (event, authResult) ->
    $rootScope.authorized = true
    gapi.client.setApiKey 'AIzaSyD7BFdY33hYiIqziLLehvIlG1Os_rJNgtY'
    $location.path '/dashboard'
    $scope.$apply()
    dump.loadDump()

  $scope.$on 'event:google-plus-signin-failure', (event, authResult) ->
    console.log 'Oh nooo! Sign in failure!'

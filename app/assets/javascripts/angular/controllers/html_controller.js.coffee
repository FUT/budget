window.App.controller 'HTMLController', ($scope, $rootScope) ->
  $scope.signOut = -> gapi.auth.signOut()

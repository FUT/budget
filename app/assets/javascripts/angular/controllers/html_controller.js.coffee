window.App.controller 'HTMLController', ($scope, $rootScope, $location) ->
  $location.path('/') if !gapi.auth

  $scope.humanizeDate = (timestamp) ->
    date = new Date(timestamp)
    date.toLocaleString()

window.App.controller 'HTMLController', ($scope, $rootScope, $location) ->
  $location.path('/') if !gapi.auth

  $scope.humanizeDate = (timestamp) ->
    moment(timestamp).format('DD/MM/YYYY HH:mm')

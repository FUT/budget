window.App.controller 'HTMLController', ($scope, $rootScope, $location, dump) ->
  $location.path('/') if !gapi.auth

  $scope.dump = dump
  $scope.humanizeDate = (timestamp) ->
    moment(timestamp).format('DD/MM/YYYY HH:mm')

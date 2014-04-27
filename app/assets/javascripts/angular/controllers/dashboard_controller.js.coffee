window.App.controller 'DashboardController', ($scope, $rootScope, $location, gDrive) ->
  gDrive.uploadFile 'qweqwe1123qweqwe', -> console.log 'success'

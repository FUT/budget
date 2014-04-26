window.App.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/', controller: 'HomeController', templateUrl: 'assets/home/index.html'

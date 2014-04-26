window.App.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/', controller: 'SignInController', templateUrl: 'assets/sign_in/index.html'
  $routeProvider.when '/home', controller: 'HomeController', templateUrl: 'assets/home/index.html'

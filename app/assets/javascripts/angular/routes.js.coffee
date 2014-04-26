window.App.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/', controller: 'SignInController', templateUrl: 'assets/sign_in/index.html'
  $routeProvider.when '/dashboard', controller: 'DashboardController', templateUrl: 'assets/dashboard/index.html'

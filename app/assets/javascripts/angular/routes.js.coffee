window.App.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/', controller: 'SignInController', templateUrl: 'assets/sign_in/index.html'
  $routeProvider.when '/dashboard', controller: 'DashboardController', templateUrl: 'assets/dashboard/index.html'
  $routeProvider.when '/charts', controller: 'ChartsController', templateUrl: 'assets/charts/index.html'
  $routeProvider.when '/deposits', controller: 'DepositsController', templateUrl: 'assets/deposits/index.html'
  $routeProvider.otherwise redirectTo: '/'

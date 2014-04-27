window.App.controller 'DashboardController', ($scope, $rootScope, $timeout, Transaction, GoogleFile, dump) ->
  $rootScope.nav = 'dashboard'

  $scope.newTransaction = new Transaction()
  $scope.dump = dump

  $scope.$watch 'dump.loaded', (loaded) ->
    if loaded
      Transaction.all (err, transactions) ->
        $scope.$apply ->
          $scope.transactions = transactions

  $scope.delete = (transaction) ->
    transaction.delete ->
      $scope.$apply ->
        $scope.transactions = _.without $scope.transactions, transaction

  $scope.save = (options) ->
    $scope.newTransaction.type = options.type
    $scope.newTransaction.createdAt = Date.now()
    Transaction.create $scope.newTransaction, (err, transaction) ->
      $scope.$apply ->
        $scope.transactions ||= []
        $scope.transactions.unshift transaction
        $scope.newTransaction = new Transaction()

  do tick = ->
    $scope.time = Date.now()
    $timeout tick, 1000

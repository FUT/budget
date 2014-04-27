window.App.controller 'DashboardController', ($scope, $timeout, gDrive, Transaction) ->
  $scope.newTransaction = new Transaction()

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
        $scope.transactions.unshift transaction

  do tick = ->
    $scope.time = Date.now()
    $timeout tick, 1000

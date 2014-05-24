window.App.controller 'ChartsOpenBalanceController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Date', 'Income', 'Expenses'],
    ['2014/1',  1000,      400],
    ['2014/2',  2170,      1460],
    ['2014/3',  3660,      2120],
    ['2014/4',  4030,      2540]
  ])

  options = {
    title: 'Overall budget income and expenses',
    hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0}
  }

  chart = new google.visualization.AreaChart(document.getElementById('open-balance-chart'))
  chart.draw(data, options)

##EXAMPLE

  # Transaction.all (transactions) ->
  #   points = [['Date', 'Income', 'Expenses']]
  #   income = 0
  #   expenses = 0

  #   for transaction in transactions
  #     if transaction.amount > 0
  #       income += transaction.amount
  #     else
  #       expenses -= transaction.amount
  #     points.push [transaction.timestamp, income, expenses]

  #   data = google.visualization.arrayToDataTable(points)

  #   options = {
  #     title: 'Personal Income and Expenses',
  #     hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
  #     vAxis: {minValue: 0}
  #   }

  #   tag = document.getElementById 'open-balance-chart'
  #   chart = new google.visualization.AreaChart(tag)
  #   chart.draw(data, options)

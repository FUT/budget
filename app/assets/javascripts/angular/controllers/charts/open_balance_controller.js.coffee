window.App.controller 'ChartsOpenBalanceController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Year', 'Sales', 'Expenses'],
    ['2013',  1000,      400],
    ['2014',  1170,      460],
    ['2015',  660,       1120],
    ['2016',  1030,      540]
  ])

  options = {
    title: 'Company Performance',
    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
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

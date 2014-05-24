window.App.controller 'ScatterExpensesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Month', 'Price'],
    [ 0.90,      5],
    [ 1,      42],
    [ 1.02,      5.5],
    [ 1.05,     44],
    [ 1.53,      6.5],
    [ 1.63,      5.5],
    [ 1.68,      6.7],
    [ 2.1,      45.2],
    [ 3.5,      6.5],
    [ 3.7,      45.0],
    [ 4.0,      45.9],
    [ 4.1,    7]
  ])

  options = {
    title: 'Expenses by time',
    hAxis: {title: 'Month', minValue: 1, maxValue: 4},
    vAxis: {title: 'Price', minValue: 0, maxValue: 50},
    legend: 'none'
  }

  chart = new google.visualization.ScatterChart(document.getElementById('scatter-expenses'))
  chart.draw(data, options)

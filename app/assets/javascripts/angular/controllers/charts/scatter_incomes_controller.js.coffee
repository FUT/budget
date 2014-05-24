window.App.controller 'ScatterIncomesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Month', 'Price'],
    [ 0.95,      50],
    [ 1,      420],
    [ 1.12,      50.5],
    [ 1.35,     450],
    [ 1.53,      60.5],
    [ 1.65,      70.5],
    [ 1.68,      60.7],
    [ 2.12,      450.2],
    [ 3.6,      80.5],
    [ 3.71,      420.0],
    [ 4.09,      490.9],
    [ 4.2,    7]
  ])

  options = {
    title: 'Income by time',
    hAxis: {title: 'Month', minValue: 0, maxValue: 4},
    vAxis: {title: 'Price', minValue: 0, maxValue: 550},
    legend: 'none'
  }

  chart = new google.visualization.ScatterChart(document.getElementById('scatter-incomes'))
  chart.draw(data, options)

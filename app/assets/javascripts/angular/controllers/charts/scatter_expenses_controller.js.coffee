window.App.controller 'ScatterExpensesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Age', 'Weight'],
    [ 8,      12],
    [ 4,      5.5],
    [ 11,     14],
    [ 4,      5],
    [ 3,      3.5],
    [ 6.5,    7]
  ])

  options = {
    title: 'Age vs. Weight comparison',
    hAxis: {title: 'Age', minValue: 0, maxValue: 15},
    vAxis: {title: 'Weight', minValue: 0, maxValue: 15},
    legend: 'none'
  }

  chart = new google.visualization.ScatterChart(document.getElementById('scatter-expenses'))
  chart.draw(data, options)

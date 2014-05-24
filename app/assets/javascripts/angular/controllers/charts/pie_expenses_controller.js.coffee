window.App.controller 'PieExpensesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Tag', ''],
    ['Transport',     121],
    ['Food',      83],
    ['Flat',  255],
    ['Fun', 123],
    ['Hobby',    17]
  ])

  options = title: 'Expenses by tag'

  chart = new google.visualization.PieChart(document.getElementById('pie-expenses'))
  chart.draw(data, options)

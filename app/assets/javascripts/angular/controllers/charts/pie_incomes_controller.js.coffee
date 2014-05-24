window.App.controller 'PieIncomesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Tag', ''],
    ['Work',     1121],
    ['Deposit',  255],
    ['Hobby',    17]
  ])

  options = title: 'Income by tag'

  chart = new google.visualization.PieChart(document.getElementById('pie-incomes'))
  chart.draw(data, options)

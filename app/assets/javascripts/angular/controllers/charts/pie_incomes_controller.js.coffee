window.App.controller 'PieIncomesController', ($scope, $rootScope, $timeout) ->
  data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Work',     11],
    ['Eat',      2],
    ['Commute',  2],
    ['Watch TV', 2],
    ['Sleep',    7]
  ])

  options = title: 'My Daily Activities'

  chart = new google.visualization.PieChart(document.getElementById('pie-incomes'))
  chart.draw(data, options)

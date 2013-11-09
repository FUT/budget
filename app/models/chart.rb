class Chart
  def self.basic_line(transfers)
    LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'line',
                marginRight: 130,
                marginBottom: 25 })
      f.title({  text: 'My Budget',
                 x: -20
      })
      f.xAxis({
        title: {
          text: 'Date'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      })
      f.yAxis({
        title: {
          text: '$'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }]
      })
      f.tooltip({
        valueSuffix: '°C'
      })
      f.legend({
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -10,
        y: 100,
        borderWidth: 0
      })
      f.subtitle({
        text: 'Source: WorldClimate.com',
        x: -20
      })
      f.series({
        name: 'Income',
        ldata: transfers.map{|t| t.amount > 0 ? t.amount : 0 }
      })
      f.series(
        name: 'Expenses',
        data: transfers.map{|t| t.amount < 0 ? -t.amount : 0 }
      )
      f.series({
        name: 'Total',
        data: transfers.map(&:total)
      })
    end
  end
end

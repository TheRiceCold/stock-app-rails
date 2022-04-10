import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["menu"]

  initialize() {
    this.config = {responsive: true}
    this.barChartInit()
    this.scientificChartInit()
  }

  barChartInit() {
    const barChartTrace1 = {
      x: ["Jan", "Feb", "Mar"],
      y: [20, 14, 23],
      name: "SF Zoo",
      type: "bar",
      marker: { 
        color: "#ea335d"
      },
    }

    const barChartTrace2 = {
      x: ["Jan", "Feb", "Mar"],
      y: [20, 14, 23],
      name: "LA Zoo",
      type: "bar",
      marker: { 
        color: "#ea335d",
        opacity: 0.6
      },
    }

    const barChartData = [barChartTrace1, barChartTrace2]

    const layout = {
      barmode: "stack",
      paper_bgcolor: "#172042",
      plot_bgcolor: "#172042",
      showlegend: false,
      margin: {
        l: 30, r: 30, b: 30, t: 30, pad: 1,
      },
      font: { color: "#6b6f8a" },
    }

    Plotly.newPlot("barChart", barChartData, layout, this.config)
  }

  scientificChartInit() {
    d3.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv",
      (err, rows) => {
        const unpack = (rows, key) => rows.map(row => row[key])

        let trace1 = {
          type: "scatter",
          mode: "lines",
          name: "AAPL High",
          x: unpack(rows, "Date"),
          y: unpack(rows, "AAPL.High"),
          line: { color: "#ea335d" }
        }

        let trace2 = {
          type: "scatter",
          mode: "lines",
          name: "AAPL Low",
          x: unpack(rows, "Date"),
          y: unpack(rows, "AAPL.Low"),
          line: { color: "#03dcee" }
        }

        let data = [trace1, trace2]
        const layout = {
          paper_bgcolor: "#172042",
          plot_bgcolor: "#172042",
          showlegend: false,
          margin: { l: 30, r: 30, b: 30, t: 30, pad: 1 },
          font: { color: "#6b6f8a" },
          xaxis: { 
            range: ["2016-07-01", "2017-02-01"],
            type: "date"
          },
          yaxis: {
            autorange: true,
            type: "linear"
          }
        }

        Plotly.newPlot("scientificChart", data, layout, this.config)
      }
    )

    const pieChartData = [{
      values: [19, 26, 55],
      labels: ["March", "April", "June"],
      type: "pie"
    }]

    const pieChartLayout = {
      paper_bgcolor: "#172042"
    }
  }

  navClick() {
    this.menuTarget.classList.toggle("nav-toggle")
  }
}

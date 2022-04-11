import { Controller } from "@hotwired/stimulus"
import Plotly from 'plotly.js-dist'

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
      marker: { color: "#00c8f2" }
    }

    const barChartTrace2 = {
      x: ["Jan", "Feb", "Mar"],
      y: [20, 14, 23],
      name: "LA Zoo",
      type: "bar",
      marker: { opacity: 0 }
    }

    const barChartData = [barChartTrace1, barChartTrace2]

    const layout = {
      barmode: "stack",
      paper_bgcolor: "#1c1c1c",
      plot_bgcolor: "#1c1c1c",
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
          line: { color: "#00c8f2" }
        }

        let trace2 = {
          type: "scatter",
          mode: "lines",
          name: "AAPL Low",
          x: unpack(rows, "Date"),
          y: unpack(rows, "AAPL.Low"),
          line: { color: "#f9004e" }
        }

        let data = [trace1, trace2]
        const layout = {
          paper_bgcolor: "#1c1c1c",
          plot_bgcolor: "#1c1c1c",
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
      paper_bgcolor: "#1c1c1c",
      plot_bgcolor: "#1c1c1c",
      piecolorway: ["#ea335d", "#03dcee", "#178add"],
      showlegend: false,
      margin: {
        l: 10, r: 10, b: 10, t: 10, pad: 1
      },
      height: 300, width: 300
    }

    Plotly.newPlot("pieChart", pieChartData, pieChartLayout)

    const donutChartData = [{
      values: [10, 40, 50],
      labels: ["Sep", "Oct", "Nov"],
      hole: 0.4, type: "pie"
    }]

    Plotly.newPlot("donutChart", donutChartData, pieChartLayout)

    let carpetChartData = {
      type: "carpet",
      a: [4, 4, 4, 4.5, 4.5, 4.5, 5, 5, 5, 6, 6, 6],
      b: [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
      y: [2, 3.5, 4, 3, 4.5, 5, 5.5, 6.5, 7.5, 8, 8.5, 10],
      aaxis: {
        tickprefix: "a = ",
        ticksuffix: "m",
        smoothing: 1,
        minorgridcount: 9,
        minorgridcolor: "#ea335d",
        gridcolor: "#ea335d",
        color: "#03dcee"
      },
      baxis: {
        tickprefix: "b = ",
        ticksuffix: "Pa",
        smoothing: 1,
        minorgridcount: 9,
        minorgridcolor: "#ea335d",
        gridcolor: "#ea335d",
        color: "#03dcee"
      }
    }

    const carpetChartLayout = {
      paper_bgcolor: "#1c1c1c",
      plot_bgcolor: "#1c1c1c",
      showlegend: false,
      margin: {
        l: 10, r: 10, b: 10, t: 10, pad: 1
      },
      font: { color: "#6b6f8a" },
      height: 300, width: 300
    }

    Plotly.newPlot(
      "carpetChart", [carpetChartData], carpetChartLayout
    )
  }

  navClick() {
    this.menuTarget.classList.toggle("nav-toggle")
  }
}

import { Controller } from "@hotwired/stimulus"
import Plotly from 'plotly.js-dist'

// Connects to data-controller="company-show"
export default class extends Controller {
  static targets = ["total", "price", "stocks"]

  initialize() { 
    this.scientificChartInit()
    const {data: price} = this.priceTarget.lastChild
    this.totalTarget.value = price.trim()
  }

  computeTotal() {
    const {data: price} = this.priceTarget.lastChild
    const qty = this.stocksTarget.value
    const total = price.replace("$", "") * qty
    this.totalTarget.value = "$"+total.toFixed(2)
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
  }
}

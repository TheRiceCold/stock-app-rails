import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="transaction"
export default class extends Controller {
  static targets = ["total", "stocks", "submit"]

  connect() { 
    this.stocksTarget.value = ""
    this.submitTarget.disabled = true
    this.type = this.stocksTarget.dataset.type
    this.stocks = this.stocksTarget.dataset.stocks
    this.balance = this.stocksTarget.dataset.balance
    this.price = this.totalTarget.dataset.price.toLocaleString('en-US')
  }

  update() {
    const qty = this.stocksTarget.value.trim()
    const total = this.price.replace("$", "") * qty

    if (!qty) {
      this.validate()
      this.totalTarget.innerText = ""
    }
    else if (qty < 1) {
      this.validate()
      this.totalTarget.innerText = "Negative values are not allowed"
    }
    else if (total > this.balance && this.type === "buy") {
      this.validate()
      this.totalTarget.innerText = "Insufficient balance"
    }
    else if (qty > this.stocks && this.type === "sell") {
      this.validate()
      this.totalTarget.innerText = `You only have ${this.stocks} stocks`
    }
    else {
      const costOrEarned = this.type === "buy" ? "Total Cost: $ " : "Total Earnings $: "
      this.submitTarget.disabled = false
      this.totalTarget.classList.remove("validate")
      this.totalTarget.innerText = costOrEarned + total.toLocaleString("en-US")
    }
  }

  validate() {
    this.submitTarget.disabled = true
    this.totalTarget.classList.add("validate")
  }
}

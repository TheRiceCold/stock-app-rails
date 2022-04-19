import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="compute-total"
export default class extends Controller {
  static targets = ["total", "stocks", "submit"]

  connect() { 
    this.stocksTarget.value = ''
    this.submitTarget.disabled = true
    this.price = this.totalTarget.dataset.value.toLocaleString('en-US')
    this.balance = Number(this.stocksTarget.dataset.value)
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
    else if (total > this.balance) {
      this.validate()
      this.totalTarget.innerText = "Sufficient Balance"
    }
    else {
      this.submitTarget.disabled = false
      this.totalTarget.classList.remove("validate")
      this.totalTarget.innerText = "Total Cost: $"+total.toLocaleString('en-US')
    }
  }

  validate() {
    this.submitTarget.disabled = true
    this.totalTarget.classList.add("validate")
  }
}

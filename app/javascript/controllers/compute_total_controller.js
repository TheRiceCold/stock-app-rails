import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="compute-total"
export default class extends Controller {
  static targets = ["total", "stocks", "submit"]

  connect() { 
    // this.submitTarget.disabled = true
    this.price = this.totalTarget.dataset.value.toLocaleString('en-US')
    this.totalTarget.innerText = "Total Cost: $" + this.price
  }

  update() {
    const qty = this.stocksTarget.value.trim()

    if (qty < 1 || !qty) {
      // this.submitTarget.disabled = true
      this.totalTarget.innerText = "Total Cost: $"+this.price
    }
    else {
      this.submitTarget.disabled = false
      const total = this.price.replace("$", "") * qty
      this.totalTarget.innerText = "Total Cost: $"+total.toLocaleString('en-US')
    }
  }
}

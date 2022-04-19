import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="compute-total"
export default class extends Controller {
  static targets = ["total", "stocks", "submit"]

  connect() { 
    this.stocksTarget.value = ''
    this.submitTarget.disabled = true
    this.price = this.totalTarget.dataset.value.toLocaleString('en-US')
    this.totalQty = Number(this.stocksTarget.dataset.value)

    this.totalTarget.innerText = "Total Cost: $" + this.price
  }

  update() {
    const qty = this.stocksTarget.value.trim()

    if (qty < 1 || !qty) {
      this.submitTarget.disabled = true
      this.totalTarget.innerText = "Total Cost: $"+this.price
    }
    else if (qty > this.totalQty){
      this.submitTarget.disabled = true
      this.totalTarget.innerText = "Quantity Limit: " + this.totalQty
    }
    else {
      this.submitTarget.disabled = false
      const total = this.price.replace("$", "") * qty
      this.totalTarget.innerText = "Total Cost: $"+total.toLocaleString('en-US')
    }
  }
}

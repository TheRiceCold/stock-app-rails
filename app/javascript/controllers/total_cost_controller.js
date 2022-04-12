import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-cost"
export default class extends Controller {
  static targets = ["total", "price", "quantity"]

  initialize() {
    const {data: price} = this.priceTarget.lastChild
    this.totalTarget.value = price.trim()
    console.log(this.totalTarget)
  }

  update() {
    const {data: price} = this.priceTarget.lastChild
    const qty = this.quantityTarget.value
    const total = price.replace("$", "") * qty
    this.totalTarget.value = "$"+total.toFixed(2)
  }
}

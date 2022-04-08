import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-cost"
export default class extends Controller {
  static targets = ["total", "price", "quantity"]

  connect() {
    console.log("total-cost-controller connected") 
    const {data: price} = this.priceTarget.lastChild
    this.totalTarget.value = price
  }
  update() {
    const {data: price} = this.priceTarget.lastChild
    const qty = this.quantityTarget.value
    const total = (price.replace("$", "") * qty).toFixed(2)
    this.totalTarget.value = "$"+total
  }
}

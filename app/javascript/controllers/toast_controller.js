import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  static targets = ["item"]
  connect() {
    const items = this.itemTargets
    setTimeout(() => 
      items.forEach(item => item.classList.add("hide")), 100)
  }
}

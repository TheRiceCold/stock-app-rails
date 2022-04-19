import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    this.close()
  }

  close = () => 
    this.element.lastChild
      .onclick = () => this.element.remove()
}

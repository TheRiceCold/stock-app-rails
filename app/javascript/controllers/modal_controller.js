// import inputAnim from "../input_anim"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    const inputs = this.inputTargets

    // this.closeModalBg()
    inputAnim(inputs)
    this.show()
  }

  hide() {
    this.element.classList.remove("show")
    this.removeModal(this.element)
  }

  // Private
  show = () => setTimeout(
    () => this.element.classList.add("show"), 100)
    
  removeModal = modal => setTimeout(() => modal.remove(), 300)
}

import inputAnim from "../input_anim"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    const inputs = this.inputTargets

    setTimeout(() => this.element.classList.add("show"), 100)
    this.closeModalBg()
    inputAnim(inputs)
  }

  closeModal() {
    this.element.classList.remove("show")
  }

  // Private
  closeModalBg = () => 
    this.element.onclick = e => 
      e.target.classList.remove("show")
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    const inputs = this.inputTargets

    // this.closeModalBg()
    this.inputAnim(inputs)
    this.show()
  }

  hide() {
    this.element.classList.remove("show")
    this.removeModal(this.element)
  }

  // Private
  // closeModalBg = () => {
  //   this.element.onclick = e => {
  //     e.stopPropagation()
  //     e.target.classList.remove("show")
  //     this.removeModal(e.target)
  //   }
  // }

  show = () => setTimeout(
    () => this.element.classList.add("show"), 100)
    
  removeModal = modal => setTimeout(() => modal.remove(), 300)


  inputAnim(inputs) {
    inputs.forEach(input => {
      const parent = input.parentNode.parentNode 

      input.onfocus = () =>
        parent.classList.add("focus")

      input.onblur = () => {
        if (!input.value) 
        parent.classList.remove("focus")
      }
    })
  }
}

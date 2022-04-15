import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auth"
export default class extends Controller {
  static targets = ["input"]
  
  initialize() {
    const inputs = this.inputTargets
    const pwdInputs = inputs.filter(i => i.type === "password")

    this.inputAnim(inputs)
    this.togglePwd(pwdInputs)
  }

  // Private
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

  togglePwd(inputs) {
    inputs.forEach(input => {
      const icon = input.parentNode.nextSibling.firstChild

      icon.onclick = () => {
        if (icon.classList.contains("fa-eye")) {
          input.setAttribute("type", "text")
          icon.classList.replace("fa-eye", "fa-eye-slash")
        } else {
          input.setAttribute("type", "password")
          icon.classList.replace("fa-eye-slash", "fa-eye")
        }
      }
    })
  } 
}

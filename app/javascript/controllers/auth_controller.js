import inputAnim from "../input_anim"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auth"
export default class extends Controller {
  static targets = ["input", "btnSubmit"]
  
  initialize() {
    const inputs = this.inputTargets
    const pwdInputs = inputs.filter(i => i.type === "password")

    inputAnim(inputs)
    this.passwordInput(pwdInputs)
  }

  // Private
  passwordInput(inputs) {
    inputs.forEach(input => {
      const icon = input.parentNode.nextSibling.firstChild

      input.onkeyup = () => {
        if (input.value.trim())
          icon.classList.add("show")
        else 
          icon.classList.remove("show")
      }

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

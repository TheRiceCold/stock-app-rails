import Rails from "@rails/ujs"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auth"
export default class extends Controller {
  static targets = [
    "input", "modal", "close", 
    "resetEmailForm"
  ]
  
  initialize() {
    const inputs = this.inputTargets
    const pwdInputs = inputs.filter(i => i.type === "password")

    this.inputAnim(inputs)
    this.togglePwd(pwdInputs)
    this.modalBgClose()
  }

  openModal() {
    this.modalTarget.classList.add("active")
  }

  closeModal() {
    this.modalTarget.classList.remove("active")
  }

  modalBgClose() {
    this.modalTarget.onclick = e => {
      e.target.classList.remove("active")
    }
  }
  
  resetPassword() {
    const form = this.resetEmailFormTarget
    const email = form.email.value.trim()

    if (!email) return

    Rails.ajax({
      url: "/users/password",
      type: "POST",
      dataType: "json",
      data: { user: { email }},
      success: (data, status, xhr) => {
        console.log(data, status, xhr)
      },
      error: (a, b) => {
        console.log(a, b)
      }
    })

    // fetch("/users/password", options)
    // .then(res => {
    //   if (res.ok) alert("Email has been sent")
    // }).catch(err => console.log(err))
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

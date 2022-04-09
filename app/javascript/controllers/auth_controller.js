import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auth"
export default class extends Controller {
  static targets = ["input"]
  
  initialize() {
    this.inputTargets.forEach(input => {
      const parent = input.parentNode.parentNode 

      input.addEventListener('focus', () => 
        parent.classList.add('focus'))

      input.addEventListener('blur', () => 
        parent.classList.remove('focus'))
    })
  }

  connect() { }
}

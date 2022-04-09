import axios from "axios"
import Rails from "@rails/ujs"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list", "path"]

  connect() {
    console.log("search-controller connected")
  }

  debounce(cb, wait = 300) {
    let timer
    return (...args) => {
      clearTimeout(timer)
      timer = setTimeout(() => cb.apply(this, args), wait)
    }
  }

  getItems() {
    const query = this.inputTarget.value
    // const token = DOM.getAllName('csrf-token')[0].content

    try {
      const options = {
        params: {query},
        headers: {
          'Accept': 'application/javascript',
          'X-CSRF-token': token,
          'X-Requested-with': 'XMLHTTPRequest'
        }
      }
      const {data} = await axios('/'+this.pathTarget, options)
      this.listTarget.innerHTML = data
    } catch (err) { console.log(err) }
  }

  update() {

  }
}

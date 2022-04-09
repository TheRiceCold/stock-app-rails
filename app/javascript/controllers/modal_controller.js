import axios from 'axios'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.element.setAttribute("data-action", "click->tubro#click")
  }

  async click(e) {
    e.preventDefault()
    this.url = this.element.getAttribute("href")

    try {
      const {html} = await axios(this.url, {
        headers: {
          Accept: "text/vnd.turbo-stream.html",
        }
      })
      Turbo.renderStreamMessage(html)
    } catch (err) { console.log(err.message) }
  }
}

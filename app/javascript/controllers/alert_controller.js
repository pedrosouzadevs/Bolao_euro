import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["button_alert", "button_notice"]

  connect() {
  }

  close() {
    this.element.remove()
  }
}

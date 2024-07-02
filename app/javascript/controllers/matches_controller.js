import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts"
export default class extends Controller {
  static values = {
    url: String
  }
  connect() {
    this.element.style.cursor = "default"
  }

  redirect() {
    window.location.href = this.urlValue
    console.log("Redirecting to", this.urlValue)
  }

  setCursorPointer() {
    this.element.style.cursor = "pointer";
  }

  setCursorDefault() {
    this.element.style.cursor = "default";
  }
}

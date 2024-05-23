import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["modal"]
  connect() {
  }

  open() {
    // this.modalTarget.show();
    this.modalTarget.showModal();
    document.body.classList.add("overflow-hidden")
  }

  clickOutside(event) {
    if (event.target === this.modalTarget) {
      this.modalTarget.close();
    }
  }

  showBdo(event) {
    document.getElementById(`bdo-form-${event.target.dataset.productId}`).classList.toggle('hidden')
    document.getElementById(`gcash-form-${event.target.dataset.productId}`).classList.add('hidden')
    document.getElementById(`submit-button-${event.target.dataset.productId}`).disabled = false
    document.getElementById(`submit-button-${event.target.dataset.productId}`).classList.toggle('cursor-not-allowed')
  }

  showGcash(event) {
    document.getElementById(`gcash-form-${event.target.dataset.productId}`).classList.toggle('hidden')
    document.getElementById(`bdo-form-${event.target.dataset.productId}`).classList.add('hidden')
    document.getElementById(`submit-button-${event.target.dataset.productId}`).disabled = false
    document.getElementById(`submit-button-${event.target.dataset.productId}`).classList.toggle('cursor-not-allowed')
  }

  closeForm(event) {
    this.modalTarget.close();
    document.getElementById('payment-success-modal').showModal();
  }
}

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
  }

  showGcash(event) {
    document.getElementById(`gcash-form-${event.target.dataset.productId}`).classList.toggle('hidden')
    document.getElementById(`bdo-form-${event.target.dataset.productId}`).classList.add('hidden')
  }

  closeForm(event) {
    this.modalTarget.close();
    document.getElementById('payment-success-modal').showModal();
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'ownerName', 'ownerDescription'];

  displayNameField() {
    this.ownerNameTarget.classList.remove('not-focused');
    this.ownerDescriptionTarget.classList.add('not-focused');
  }

  displayDescriptionField() {
    this.ownerDescriptionTarget.classList.remove('not-focused');
    this.ownerNameTarget.classList.add('not-focused');
  }

  update(event) {
    event.preventDefault();
    const url = this.formTarget.action
    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain' },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.formTarget.outerHTML = data;
      })
  }

}

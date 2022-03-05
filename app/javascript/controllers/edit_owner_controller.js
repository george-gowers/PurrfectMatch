import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'ownerName', 'location', 'photos', 'ownerDescription', 'token', 'carousel'];

  displayNameField() {
    this.ownerNameTarget.classList.remove('not-focused');
    this.ownerDescriptionTarget.classList.add('not-focused');
  }

  displayLocationField() {
    this.ownerDescriptionTarget.classList.remove('not-focused');
    this.ownerLocationTarget.classList.add('not-focused');
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
  uploadPhotos() {
    console.log('uploadPhotos');
    let input = this.photosTarget.files;
    let photoFile = new FormData();
    for (let i = 0; i < input.length; i++) {
      photoFile.append("user[photos][]", input[i]);
    }
    photoFile.append("authenticity_token", this.tokenTarget.value);
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { 'Accept': 'text/plain' },
      body: photoFile
    })
      .then(response => response.text())
      .then((data) => {
        document.getElementById('carousel').outerHTML = data;
      });
  }
}

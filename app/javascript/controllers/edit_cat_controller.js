import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'name', 'gender', 'breed', 'description'];

  displayNameField() {
    this.nameTarget.classList.remove('d-none');
  }

  displayGenderField() {
    this.genderTarget.classList.remove('d-none');
  }

  displayBreedField() {
    this.breedTarget.classList.remove('d-none');
  }

  displayDescriptionField() {
    this.descriptionTarget.classList.remove('d-none');
  }

}

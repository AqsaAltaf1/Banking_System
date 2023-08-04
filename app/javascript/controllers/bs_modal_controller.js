import { Controller } from "@hotwired/stimulus";
import { Modal } from "bootstrap";

// Connects to data-controller="bs-modal"
export default class extends Controller {
  connect() {
    console.log('hii')
    this.modal=new Modal(this.element)
    this.modal.show()
  }

  show(event){
    if (this.open(event)){
      event.preventDefault()
      this.element.addEventListener("hidden.bs.modal", event.detail.resume)
      this.modal.hide()
    }
  }
 
  disconnect(){
    this.modal.hide()
  }
  submitEnd(){
    this.modal.hide()
  }

  open(){
    return this.element.classList.contains('show')
  }

}

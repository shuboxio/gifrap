import { Controller } from '@hotwired/stimulus'
import Shubox  from 'shubox'

export default class extends Controller {
    static targets = ['image_form']

    connect() {
      const shuboxKey = this.element.dataset.shuboxKey

      new Shubox(
        '#container',
        {
          key: shuboxKey,
          previewsContainer: false,
          clickable: 'button',
          success: this.uploadSuccess.bind(this)
        }
      )
    }

    uploadSuccess(file) {
      debugger;
    }
}

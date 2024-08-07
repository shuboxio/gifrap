import { Controller } from '@hotwired/stimulus'
import Shubox  from 'shubox'

export default class extends Controller {
    shubox;

    connect() {
      const shuboxKey = this.element.dataset.shuboxKey

      this.shubox = new Shubox(
        '#container',
        {
          key: shuboxKey,
          previewsContainer: false,
          clickable: '.shubox-clickable',
          success: this.uploadSuccess.bind(this)
        }
      )
    }

    uploadSuccess(file) {
      const path = "/images/new?url=" + encodeURI(file.s3url)
      const uploaderFrame = document.querySelector('turbo-frame#uploader')

      uploaderFrame.src = path
      uploaderFrame.classList.replace('hidden', 'flex')
      history.pushState({}, '', path)
    }

    close() {
      Turbo.visit('/')
    }
}

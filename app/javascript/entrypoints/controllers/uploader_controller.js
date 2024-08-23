import { Controller } from '@hotwired/stimulus'
import Shubox  from 'shubox'

export default class extends Controller {
    shubox;

    connect() {
      const shuboxKey = this.element.dataset.shuboxKey
      const shuboxBaseUrl = this.element.dataset.shuboxBaseUrl

      this.shubox = new Shubox(
        '#container',
        {
          key: shuboxKey,
          baseUrl: shuboxBaseUrl,
          previewsContainer: false,
          success: this.uploadSuccess.bind(this)
        }
      )
    }

    uploadSuccess(file) {
      const path = "/images/new?url=" + encodeURI(file.s3url)
      const uploaderFrame = document.querySelector('turbo-frame#uploader')

      uploaderFrame.src = path
      uploaderFrame.classList.replace('hidden', 'fixed')
      history.pushState({}, '', path)
    }

    close() {
      Turbo.visit('/')
    }
}

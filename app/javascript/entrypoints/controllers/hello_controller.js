import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() { // => «connect» method is similar to initialize method in a ruby-class
        console.log("Hello, Stimulus!")
    }

    static targets = [ "name" ]

    greet() { // => doesnt matter for now, but later for the view
        const element = this.nameTarget
        const name = element.value
        console.log(`Hello, ${name}!`)
    }
}

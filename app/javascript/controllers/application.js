import { Application } from "@hotwired/stimulus"
import Chart from 'stimulus-chartjs'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register('chart', Chart)

export { application }

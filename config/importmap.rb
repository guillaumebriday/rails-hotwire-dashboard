# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'bootstrap', to: 'bootstrap/dist/js/bootstrap.bundle.js'
pin 'chart.js/auto', to: 'https://ga.jspm.io/npm:chart.js@3.9.1/auto/auto.mjs'
pin 'stimulus-chartjs', to: 'stimulus-chartjs/dist/stimulus-chartjs.es.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'lodash.debounce', to: 'https://ga.jspm.io/npm:lodash.debounce@4.0.8/index.js'

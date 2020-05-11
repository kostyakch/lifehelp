// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

/* eslint no-console:0 */
// import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue'

// Import all the macro components of the application
import * as instances from './instances'
import store from '../store'

// Vue.use(TurbolinksAdapter)

document.addEventListener('DOMContentLoaded', () => {
  // Initialize available instances
  
  Object.keys(instances).forEach((instanceName) => {
    const instance = instances[instanceName]
    const elements = document.querySelectorAll(instance.el)

    elements.forEach((element) => {
      const props = JSON.parse(element.getAttribute('data-props'))

      new Vue({
        el: element,
        store,
        render: h => h(instance.component, { props })
      })
    })
  })
})

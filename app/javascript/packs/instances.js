// Import layout components
import Header from '../components/header.vue'
import Footer from '../components/footer.vue'
export const HeaderInstance = {
  el: '.vue-header',
  component: Header
}
export const FooterInstance = {
  el: '.vue-footer',
  component: Footer
}

// Import client components
import ClientList from '../components/client/index.vue'
import ClientForm from '../components/client/form.vue'

export const ClientListInstance = {
  el: '.vue-clients',
  component: ClientList
}
export const ClientFormInstance = {
  el: '.vue-client-form',
  component: ClientForm
}

// Import service components
import ServiceList from '../components/service/index.vue'
import ServiceForm from '../components/service/form.vue'

export const ServiceListInstance = {
  el: '.vue-services',
  component: ServiceList
}
export const ServiceFormInstance = {
  el: '.vue-service-form',
  component: ServiceForm
}

// Import client_service components
import ClientServiceList from '../components/client_service/index.vue'
import ClientServiceForm from '../components/client_service/form.vue'

export const ClientServiceListInstance = {
  el: '.vue-client-services',
  component: ClientServiceList
}
export const ClientServiceFormInstance = {
  el: '.vue-client-service-form',
  component: ClientServiceForm
}

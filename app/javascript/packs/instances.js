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

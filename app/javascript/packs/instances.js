// Import components
import ClientList from '../components/client/index.vue'
import ClientShow from '../components/client/show.vue'
import ClientForm from '../components/client/form.vue'

export const ClientListInstance = {
  el: '.vue-clients',
  component: ClientList
}
export const ClientShowInstance = {
  el: '.vue-client',
  component: ClientShow
}
export const ClientFormInstance = {
  el: '.vue-client-form',
  component: ClientForm
}
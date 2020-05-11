import api from '../../api'

const defaultState = {
  clients: []
}

export const actions = {
  fillClients({ commit }, clients) {
    commit('fillClients', clients)
  },
  destroyClient({ commit }, clientId) {
    api.client.destroy(clientId)
      .then(() => {
        commit('clientDestroyed', clientId)
      })
  }
}

export const mutations = {
  fillClients(state, clients) {
    state.clients = clients
  },
  clientDestroyed(state, clientId) {
    location.reload()
    // state.clients = state.clients.filter(client => clientId === client.id)
  }
}

export default {
  state: defaultState,
  actions,
  mutations
}

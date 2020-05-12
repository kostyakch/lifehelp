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
  },
  addClient({ commit }, { clientParams }) {
    api.client.create(clientParams)
      .then((client) => {
        commit('clientAdded', client)
      })
  }
}

export const mutations = {
  fillClients(state, clients) {
    state.clients = clients
  },
  clientDestroyed(state, clientId) {
    // location.reload()
    state.clients = state.clients.filter(client => clientId !== client.id)
  },
  clientAdded(state, client) {
    state.clients.push(client)
    location.replace('/')
  }
}

export default {
  state: defaultState,
  actions,
  mutations,
}

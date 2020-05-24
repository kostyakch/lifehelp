import api from './instance'

const index = function (params) {
  var lastQuery = localStorage.lastQuery ? JSON.parse(localStorage.lastQuery) : {}
  return api.get(Routes.clients_path({ ...params, ...lastQuery, ...{ format: "json" } }))
    .then(response => response.data)
}

const create = (params) =>
  api
    .post(Routes.clients_path(), params)
    .then(response => response.data)

const update = (params) =>
  api
    .put(Routes.client_path(params.id), params)
    .then(response => response.data)

const destroy = id =>
  api
    .delete(Routes.client_path(id))
    .then(response => response.data);

const search = (query) =>
  api
    .get(Routes.search_clients_path({ q: query, format: 'json' }))
    .then(response => response.data);

export default {
  index,
  create,
  update,
  destroy,
  search,
}

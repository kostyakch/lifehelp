import api from './instance'

const index = (params) =>
  api
    .get(Routes.client_services_path({ page: params.page, format: "json" }))
    .then(response => response.data)

const create = (params) =>
  api
    .post(Routes.client_services_path(), params)
    .then(response => response.data)

const update = (params) =>
  api
    .put(Routes.client_service_path(params.id), params)
    .then(response => response.data)

const destroy = id =>
  api
    .delete(Routes.client_service_path(id))
    .then(response => response.data);

const search = (query) =>
  api
    .get(Routes.search_client_services_path({ q: query, format: 'json' }))
    .then(response => response.data);

export default {
  index,
  create,
  update,
  destroy,
  search
}

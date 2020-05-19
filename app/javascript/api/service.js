import api from './instance'

const index = (params) =>
  api
    .get(Routes.services_path({ page: params.page, format: "json" }))
    .then(response => response.data)

const create = (params) =>
  api
    .post(Routes.services_path(), params)
    .then(response => response.data)

const update = (params) =>
  api
    .put(Routes.service_path(params.id), params)
    .then(response => response.data)

const destroy = id =>
  api
    .delete(Routes.service_path(id))
    .then(response => response.data);

const search = (query) =>
  api
    .get(Routes.search_services_path({ q: query, format: 'json' }))
    .then(response => response.data);

export default {
  index,
  create,
  update,
  destroy,
  search
}

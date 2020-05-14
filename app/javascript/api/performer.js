import api from './instance'

const create = (params) =>
  api
    .post(Routes.performers_path(), params)
    .then(response => response.data)

const update = (params) =>
  api
    .put(Routes.performer_path(params.id), params)
    .then(response => response.data)

const destroy = id =>
  api
    .delete(Routes.performer_path(id))
    .then(response => response.data);

const search = (query) =>
  api
    .get(Routes.search_performers_path({ q: query, format: 'json' }))
    .then(response => response.data);

export default {
  create,
  update,
  destroy,
  search
}

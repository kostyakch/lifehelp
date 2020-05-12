import api from './instance'

const create = (clientParams) =>
  api
    .post(Routes.clients_path(), clientParams)
    .then(response => response.data)

const update = (clientParams) =>
  api
    .put(Routes.client_path(clientParams.id), clientParams)
    .then(response => response.data)

const destroy = clientId =>
  api
    .delete(Routes.client_path(clientId))
    .then(response => response.data);

export default {
  create,
  update,
  destroy
}

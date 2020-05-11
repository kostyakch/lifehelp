import api from './instance'

const create = (clientId, clientParams) =>
  api
    .post(Routes.client_path(clientId), clientParams)
    .then(response => response.data);

const destroy = clientId =>
  api.delete(Routes.client_path(clientId)).then(response => response.data);

export default {
  create,
  destroy
}

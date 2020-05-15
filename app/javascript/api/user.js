import api from './instance'

const signIn = (params) =>
  api
    .post(Routes.user_session_path(), params)
    .then(response => response.data)

const signOut = () =>
  api
    .delete(Routes.destroy_user_session_path())
    .then(response => response.data)

export default {
  signIn,
  signOut
}

<template>
  <el-row :gutter="20">
    <el-col :span="12" :offset="4">
      <el-form :model="form" :rules="rules" ref="userAuthForm" label-width="180px">
        <center>
          <h2>Авторизация</h2>
        </center>

        <el-form-item label>
          <el-alert
            v-if="formError"
            title="Ошибка при авторизации пользователя"
            type="error"
            :closable="false"
          ></el-alert>
        </el-form-item>

        <el-form-item label="E-mail" prop="email">
          <el-input v-model="form.email" type="email"></el-input>
        </el-form-item>
        <el-form-item label="Пароль" prop="password">
          <el-input v-model="form.password" type="password"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm">Войти</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </el-row>
</template>

<script>
export default {
  props: {
    user: Object
  },
  data() {
    return {
      formError: false,
      form: this.user,
      rules: {
        email: [
          {
            required: true,
            message: "Заполните поле",
            trigger: "blur"
          },
          {
            type: "email",
            message: "Введите валидный E-mail",
            trigger: "blur"
          }
        ],
        password: [
          {
            required: true,
            message: "Заполните поле",
            trigger: "blur"
          },
          {
            min: 6,
            message: "Пароль должен быть не меньше 6-и символов",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submitForm() {
      const frm = this.$refs["userAuthForm"];
      frm.validate(valid => {
        if (valid) {
          this.auth(frm.model);
        }
      });
    },
    auth(model) {
      this.$api.user
        .signIn(model)
        .then(resp => location.replace(Routes.root_path()))
        .catch(error => (this.formError = true));
    }
  }
};
</script>

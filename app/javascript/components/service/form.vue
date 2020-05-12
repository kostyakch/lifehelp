<template>
  <el-row :gutter="20">
    <el-col :span="16" :offset="2">
      <el-form :model="form" :rules="rules" ref="serviceForm" label-width="180px">
        <center>
          <h2 v-if="form.id === null">Добавление услуги</h2>
          <h2 v-else>Редактирование {{ form.title }}</h2>
        </center>

        <el-form-item label>
          <el-alert
            v-if="formError"
            title="Ошибка при сохранении данных"
            type="error"
            :closable="false"
          ></el-alert>
        </el-form-item>
        <el-form-item label="Наименование услуги" prop="title">
          <el-input v-model="form.title"></el-input>
        </el-form-item>
        <el-form-item label="Количество" prop="quantity">
          <el-input v-model="form.quantity" type="number"></el-input>
        </el-form-item>
        <el-form-item label="Описание услуги" prop="description">
          <el-input type="textarea" v-model="form.description"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm">Сохранить</el-button>
          <el-button @click="resetForm">Отмена</el-button>
        </el-form-item>
      </el-form>
    </el-col>
  </el-row>
</template>

<script>
import api from "../../api";

export default {
  props: {
    service: Object
  },
  data() {
    return {
      formError: false,
      form: this.service,
      rules: {
        title: [
          {
            required: true,
            message: "Заполните поле",
            trigger: "blur"
          },
          {
            min: 2,
            message: "Значение должно быть больше 2х символов",
            trigger: "blur"
          }
        ],
      }
    };
  },
  methods: {
    submitForm() {
      const frm = this.$refs["serviceForm"];
      frm.validate(valid => {
        if (valid) {
          if (this.service.id === null) {
            this.create(frm.model);
          } else {
            this.update(frm.model);
          }
        }
      });
    },
    resetForm() {
      location.replace(Routes.services_path());
    },
    create(model) {
      api.service
        .create(model)
        .then(service => location.replace(Routes.services_path()))
        .catch(error => (this.formError = true));
    },
    update(model) {
      api.service
        .update(model)
        .then(service => location.replace(Routes.services_path()))
        .catch(error => (this.formError = true));
    }
  }
};
</script>

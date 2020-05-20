<template>
  <el-row :gutter="20">
    <el-col :span="16" :offset="4">
      <h2>
        <span v-if="form.id === null">Добавление исполнителя</span>
        <span v-else>Редактирование</span>
        {{ form.last_name }} {{ form.first_name }} {{ form.middle_name }}
      </h2>

      <el-alert
        v-if="formError"
        title="Ошибка при сохранении данных"
        type="error"
        :description="errorDescr"
        :closable="false"
      ></el-alert>
      <br />
    </el-col>

    <el-col :span="16" :offset="2">
      <el-form :model="form" :rules="rules" ref="performerForm" label-width="180px">
        <el-form-item label="Фамилия" prop="last_name">
          <el-input v-model.trim="form.last_name"></el-input>
        </el-form-item>
        <el-form-item label="Имя" prop="first_name">
          <el-input v-model.trim="form.first_name"></el-input>
        </el-form-item>
        <el-form-item label="Отчество" prop="middle_name">
          <el-input v-model.trim="form.middle_name"></el-input>
        </el-form-item>

        <el-form-item label="Контактные данные">
          <el-col :span="10">
            <el-form-item prop="phone">
              <el-input
                v-model="form.phone"
                placeholder="+7 (###) ###-####"
                v-mask="'+# (###) ###-####'"
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item prop="email">
              <el-input v-model.trim="form.email" placeholder="E-Mail"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>

        <el-form-item label="Тип исполнителя" prop="performer_type">
          <el-radio-group v-model="form.performer_type" size="mini">
            <el-radio-button label="person">Частное лицо</el-radio-button>
            <el-radio-button label="volontier">Волонтер</el-radio-button>
            <el-radio-button label="organization">Организация</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Адрес" prop="address">
          <el-input type="textarea" v-model="form.address"></el-input>
        </el-form-item>
        <el-form-item label="Примечание" prop="description">
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
import Inputmask from "inputmask";

export default {
  name: "performerForm",
  props: {
    performer: Object
  },
  directives: {
    mask: {
      bind: function(el, binding) {
        Inputmask(binding.value).mask(el.getElementsByTagName("INPUT")[0]);
      }
    }
  },
  data() {
    return {
      formError: false,
      errorDescr: "",
      form: this.performer,
      rules: {
        first_name: [
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
        last_name: [
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
        email: [
          {
            type: "email",
            message: "Введите корректный E-mail",
            trigger: "blur"
          }
        ],
        phone: [
          {
            required: true,
            message: "Заполните поле",
            trigger: "blur"
          },
          {
            min: 11,
            message: "Введите корректный номер",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submitForm() {
      const frm = this.$refs["performerForm"];
      frm.validate(valid => {
        if (valid) {
          if (this.performer.id === null) {
            this.create(frm.model);
          } else {
            this.update(frm.model);
          }
        }
      });
    },
    resetForm() {
      location.replace(Routes.performers_path());
    },
    create(model) {
      this.$api.performer
        .create(model)
        .then(service => location.replace(Routes.performers_path()))
        .catch(error => {
          this.errorDescr = error.response.data;
          this.formError = true;
        });
    },
    update(model) {
      this.$api.performer
        .update(model)
        .then(service => location.replace(Routes.performers_path()))
        .catch(error => {
          this.errorDescr = error.response.data;
          this.formError = true;
        });
    }
  }
};
</script>

<template>
  <el-row :gutter="20">
    <el-col :span="16" :offset="2">
      <el-form :model="form" :rules="rules" ref="clientForm" label-width="180px">
        <center>
          <h2 v-if="form.id === null">Добавление клиента</h2>
          <h2
            v-else
          >Редактирование {{ form.last_name }} {{ form.first_name }} {{ form.middle_name }}</h2>
        </center>

        <el-form-item label>
          <el-alert
            v-if="formError"
            title="Ошибка при сохранении данных"
            type="error"
            :closable="false"
          ></el-alert>
        </el-form-item>
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
          <el-col :span="8">
            <el-form-item prop="phone">
              <el-input v-model.trim="form.phone" type="number" placeholder="Телефон"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item prop="email">
              <el-input v-model.trim="form.email" placeholder="E-Mail"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item prop="dob">
              <el-date-picker
                v-model.trim="form.dob"
                type="date"
                format="dd.MM.yyyy"
                placeholder="Рождение"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-form-item>

        <el-form-item label="Источник данных" prop="source">
          <el-radio-group v-model="form.source" size="mini">
            <el-radio-button label="no_source">Не определен</el-radio-button>
            <el-radio-button label="direct_call">Прямой звонок</el-radio-button>
            <el-radio-button label="call_center">Кол-центр</el-radio-button>
            <el-radio-button label="volunteers">Волонтеры</el-radio-button>
            <el-radio-button label="no_commercial_org">Некоммерческая организация</el-radio-button>
            <el-radio-button label="commercial_org">Организация</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Параметры" prop="client_type">
          <el-radio-group v-model="form.client_type" size="mini">
            <el-radio-button label="person">Частное лицо</el-radio-button>
            <el-radio-button label="organization">Организация</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Коды" prop="code">
          <el-radio-group v-model="form.code" size="mini">
            <el-radio-button label="A"></el-radio-button>
            <el-radio-button label="B"></el-radio-button>
            <el-radio-button label="C"></el-radio-button>
            <el-radio-button label="D"></el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Объективность" prop="objectivity">
          <el-radio-group v-model="form.objectivity" size="mini">
            <el-radio-button label="is_not_clear">Не ясно</el-radio-button>
            <el-radio-button label="objectively">Объективно</el-radio-button>
            <el-radio-button label="subjectively">Не объективно</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Материальный статус" prop="marital_status">
          <el-radio-group v-model="form.marital_status" size="mini">
            <el-radio-button label="single_mother">Мать одиночка</el-radio-button>
            <el-radio-button label="large">Многодетная семья</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Социальный статус" prop="social_status">
          <el-radio-group v-model="form.social_status" size="mini">
            <el-radio-button label="disabled">Инвалид</el-radio-button>
            <el-radio-button label="unemployed">Безработный</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Город" prop="city">
          <el-input v-model="form.city"></el-input>
        </el-form-item>
        <el-form-item label="Район" prop="area">
          <el-input v-model="form.area"></el-input>
        </el-form-item>
        <el-form-item label="Адрес" prop="address">
          <el-input type="textarea" v-model="form.address"></el-input>
        </el-form-item>

        <el-form-item label="Информация" prop="description">
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
export default {
  props: {
    client: Object
  },
  data() {
    return {
      formError: false,
      form: this.client,
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
            message: "Введите валидный E-mail",
            trigger: "blur"
          }
        ],
        phone: [
          {
            min: 5,
            max: 11,
            message: "Введите валидный телефон",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submitForm() {
      const frm = this.$refs["clientForm"];
      frm.validate(valid => {
        if (valid) {
          if (this.client.id === null) {
            this.create(frm.model);
          } else {
            this.update(frm.model);
          }
        }
      });
    },
    resetForm() {
      location.replace(Routes.clients_path());
    },
    create(model) {
      this.$api.client
        .create(model)
        .then(client => location.replace(Routes.clients_path()))
        .catch(error => (this.formError = true));
    },
    update(model) {
      this.$api.client
        .update(model)
        .then(client => location.replace(Routes.clients_path()))
        .catch(error => (this.formError = true));
    }
  }
};
</script>

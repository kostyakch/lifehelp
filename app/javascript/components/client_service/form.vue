<template>
  <el-row :gutter="20">
    <el-col :span="16" :offset="4">
      <h2 v-if="form.id === null">Добавление услуги для: {{ form.client.fio }}</h2>
      <h2 v-else>Редактирование {{ form.title }}</h2>

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
      <el-form :model="form" :rules="rules" ref="clientServiceForm" label-width="180px">
        <el-input type="hidden" v-model="form.client_id"></el-input>

        <el-form-item label="Наименование услуги" prop="service_id">
          <el-select
            v-model="form.service_id"
            filterable
            remote
            reserve-keyword
            placeholder="Введите наименование услуги"
            :remote-method="searchServices"
            :loading="loading"
          >
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="Исполнитель" prop="performer_id">
          <el-select
            v-model="form.performer_id"
            filterable
            remote
            reserve-keyword
            placeholder="Введите исполнителя"
            :remote-method="searchPerformers"
            :loading="loading"
          >
            <el-option
              v-for="item in perfornerOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="Статус" prop="status">
          <el-radio-group v-model="form.status" size="mini">
            <el-radio-button
              v-for="(item, index) in statuses"
              :key="index"
              :label="index"
            >{{ item }}</el-radio-button>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="Период">
          <el-col :span="9">
            <el-form-item prop="started_at">
              <el-date-picker
                v-model.trim="form.started_at"
                type="date"
                format="dd.MM.yyyy"
                placeholder="Дата начала"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="9">
            <el-form-item prop="finished_at">
              <el-date-picker
                v-model.trim="form.finished_at"
                type="date"
                format="dd.MM.yyyy"
                placeholder="Дата завершения"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="Отзыв" prop="review">
          <el-input type="textarea" v-model="form.review"></el-input>
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
    client_service: Object,
    pagination: Object
  },
  data() {
    return {
      formError: false,
      errorDescr: "",
      loading: false,
      form: this.client_service,
      statuses: I18n.t("enums.client_service.status"),
      rules: {
        service_id: [
          { required: true, message: "Заполните поле", trigger: "blur" }
        ],
        started_at: [
          { required: true, message: "Заполните поле", trigger: "blur" }
        ]
      },
      options: [
        {
          value: this.client_service.service_id,
          label: this.client_service.service.title
        }
      ],
      perfornerOptions: [
        {
          value: this.client_service.performer_id,
          label: this.client_service.performer.fio
        }
      ],
      value: [],
      list: []
    };
  },
  methods: {
    submitForm() {
      const frm = this.$refs["clientServiceForm"];
      frm.validate(valid => {
        if (valid) {
          if (this.client_service.id === null) {
            this.create(frm.model);
          } else {
            this.update(frm.model);
          }
        }
      });
    },
    resetForm() {
      location.replace(Routes.client_services_path());
    },
    create(model) {
      this.$api.client_service
        .create(model)
        .then(service => location.replace(Routes.client_services_path()))
        .catch(error => {
          this.errorDescr = error.response.data;
          this.formError = true;
        });
    },
    update(model) {
      this.$api.client_service
        .update(model)
        .then(service => location.replace(Routes.client_services_path()))
        .catch(error => {
          this.errorDescr = error.response.data;
          this.formError = true;
        });
    },
    searchServices(query) {
      if (query !== "") {
        this.loading = true;
        this.$api.service.search(query).then(data => {
          this.list = data.map(item => {
            return { value: item.id, label: item.title };
          });
        });

        setTimeout(() => {
          this.loading = false;
          this.options = this.list.filter(item => {
            return item.label.toLowerCase().indexOf(query.toLowerCase()) > -1;
          });
        }, 200);
      } else {
        this.options = [];
      }
    },
    searchPerformers(query) {
      if (query !== "") {
        this.loading = true;
        this.$api.performer.search(query).then(data => {
          this.list = data.map(item => {
            return { value: item.id, label: item.fio };
          });
        });

        setTimeout(() => {
          this.loading = false;
          this.perfornerOptions = this.list.filter(item => {
            return item.label.toLowerCase().indexOf(query.toLowerCase()) > -1;
          });
        }, 200);
      } else {
        this.perfornerOptions = [];
      }
    }
  }
};
</script>

<style>
.el-select {
  display: block;
}
</style>
<template>
  <el-row :gutter="20">
    <el-table :data="tableData" stripe style="width: 100%" @sort-change="sortChange">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-row :gutter="20">
            <el-col :span="10">
              <p>
                <b>E-mail:</b>
                {{ props.row.email }}
              </p>
              <p>
                <b>Город:</b>
                {{ props.row.city }}
              </p>
              <p>
                <b>Район:</b>
                {{ props.row.area }}
              </p>
              <p>
                <b>Адрес:</b>
                {{ props.row.address }}
              </p>
              <p>
                <b>Информация:</b>
                {{ props.row.description }}
              </p>
            </el-col>
            <el-col :span="10">
              <p>
                <b>Источник данных:</b>
                {{ i18n.t("enums.client.source."+props.row.source) }}
              </p>
              <p>
                <b>Параметры:</b>
                {{ i18n.t("enums.client.client_type."+props.row.client_type) }}
              </p>
              <p>
                <b>Код:</b>
                {{ i18n.t("enums.client.code."+props.row.code) }}
              </p>
              <p>
                <b>Объективность:</b>
                {{ i18n.t("enums.client.objectivity."+props.row.objectivity) }}
              </p>
              <p>
                <b>Материальный статус:</b>
                {{ i18n.t("enums.client.marital_status."+props.row.marital_status) }}
              </p>
              <p>
                <b>Социальный статус:</b>
                {{ i18n.t("enums.client.social_status."+props.row.social_status) }}
              </p>
            </el-col>
          </el-row>
        </template>
      </el-table-column>
      <el-table-column prop="fio" sortable="custom" label="ФИО"></el-table-column>
      <el-table-column prop="dob" sortable="custom" label="Дата рождения" :formatter="dobFormatter"></el-table-column>
      <el-table-column prop="phone" label="Телефон"></el-table-column>
      <el-table-column prop="updated_at" sortable="custom" label="Дата изменения">
        <template slot-scope="props">{{ props.row.updated_at | moment("DD.MM.YYYY") }}</template>
      </el-table-column>
      <el-table-column prop="area" sortable="custom" label="Район"></el-table-column>
      <el-table-column prop="city" sortable="custom" label="Город"></el-table-column>
      <el-table-column fixed="right" label="Действия" width="180">
        <template slot-scope="scope">
          <el-button
            type="success"
            icon="el-icon-truck"
            circle
            @click="newClientService(scope.row.id)"
          ></el-button>
          <el-button type="primary" icon="el-icon-edit" circle @click="editClient(scope.row.id)"></el-button>
          <el-button
            type="danger"
            icon="el-icon-delete"
            circle
            @click.native.prevent="deleteRow(scope.$index, tableData, scope.row.id)"
          ></el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-row>
</template>

<script>
export default {
  name: "ClientTable",
  props: {
    clients: Array
  },
  data() {
    return {
      i18n: I18n,
      sorted: false,
      tmpData: this.clients
    };
  },
  computed: {
    tableData: {
      get: function() {
        if (this.sorted) {
          this.sorted = false;
          this.tableData = this.clients;
          return this.tmpData;
        } else {
          return this.clients;
        }
      },
      set: function(data) {
        return this.clients;
      }
    }
  },
  methods: {
    deleteRow(index, rows, id) {
      this.$confirm("Вы действительно хотите удалить запись?").then(_ => {
        this.$api.client.destroy(id).then(() => {
          rows.splice(index, 1);
        });
      });
    },
    editClient(id) {
      location.replace(Routes.edit_client_path(id));
    },
    newClientService(id) {
      location.replace(Routes.new_client_service_path({ client_id: id }));
    },
    years(date) {
      if (date === "") return;
      var now = new Date();
      return parseInt(now.toISOString()) - parseInt(date);
    },
    dobFormatter(row, column) {
      if (row.dob === null) return "--";

      return `${this.$moment(row.dob).format("DD.MM.YYYY")} (${this.years(
        row.dob
      )})`;
    },
    sortChange(row) {
      var sortQuery = { sort: { column: row.prop, order: row.order } };
      if (row.order) localStorage.lastQuery = JSON.stringify(sortQuery);
      else localStorage.lastQuery = "{}";

      this.$api.client.index(sortQuery).then(resp => {
        this.sorted = true;
        this.tmpData = resp;
      });
    }
  }
};
</script>

<style>
.el-pagination {
  margin-top: 20px;
}
</style>


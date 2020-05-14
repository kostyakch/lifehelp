<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <el-table-column prop="client.fio" label="ФИО" min-width="200"></el-table-column>
    <el-table-column prop="service.title" label="Наименование" min-width="250"></el-table-column>

    <el-table-column label="Статус">
      <template slot-scope="props">{{ i18n.t("enums.client_service.status."+props.row.status) }}</template>
    </el-table-column>
    <el-table-column prop="started_at" label="Начало">
      <template slot-scope="props">{{ props.row.started_at | moment("DD.MM.YYYY HH:mm") }}</template>
    </el-table-column>
    <el-table-column prop="finished_at" label="Завершение">
      <template slot-scope="props">{{ props.row.finished_at | moment("DD.MM.YYYY HH:mm") }}</template>
    </el-table-column>

    <el-table-column fixed="right" label="Действия" width="280">
      <template slot-scope="scope">
        <el-button type="primary" icon="el-icon-edit" circle @click="editRecord(scope.row.id)"></el-button>
        <el-button
          type="danger"
          icon="el-icon-delete"
          circle
          @click.native.prevent="deleteRow(scope.$index, tableData, scope.row.id)"
        ></el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import api from "../../api";

export default {
  props: {
    client_services: Array
  },
  data() {
    return {
      tableData: this.client_services,
      i18n: I18n
    };
  },
  methods: {
    editRecord(id) {
      location.replace(Routes.edit_client_service_path(id));
    },
    deleteRow(index, rows, id) {
      this.$confirm("Вы действительно хотите удалить запись?").then(_ => {
        api.client_service
          .destroy(id)
          .then(client => rows.splice(index, 1))
          .catch(error => (this.formError = true));
      });
    }
  }
};
</script>

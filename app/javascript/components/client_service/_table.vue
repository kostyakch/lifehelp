<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <el-table-column type="expand" :v-if="false">
      <template slot-scope="props">
        <el-row :gutter="20">
          <el-col :span="10">
            <p>
              <b>Исполнитель:</b>
              {{ props.row.performer.fio }}
            </p>
            <p>
              <b>Отзыв:</b>
              {{ props.row.review }}
            </p>
          </el-col>
          <el-col :span="10"></el-col>
        </el-row>
      </template>
    </el-table-column>

    <el-table-column prop="client.fio" sortable label="ФИО" min-width="160"></el-table-column>
    <el-table-column prop="service.title" sortable label="Наименование" min-width="160"></el-table-column>

    <el-table-column sortable label="Статус">
      <template slot-scope="props">{{ i18n.t("enums.client_service.status."+props.row.status) }}</template>
    </el-table-column>
    <el-table-column prop="started_at" sortable label="Начало">
      <template slot-scope="props">{{ props.row.started_at | moment("DD.MM.YYYY HH:mm") }}</template>
    </el-table-column>
    <el-table-column prop="finished_at" sortable label="Завершение">
      <template slot-scope="props">{{ props.row.finished_at | moment("DD.MM.YYYY HH:mm") }}</template>
    </el-table-column>

    <el-table-column fixed="right" label="Действия" width="120">
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
        this.$api.client_service
          .destroy(id)
          .then(client => rows.splice(index, 1))
          .catch(error => (this.formError = true));
      });
    }
  }
};
</script>

<template>
  <el-row :gutter="20">
    <el-table :data="tableData" stripe style="width: 100%">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-row :gutter="20" v-if="props.row.review !== null">
            <el-col :span="10">
              <p>
                <b>Отзыв:</b>
                {{ props.row.review }}
              </p>
            </el-col>
            <el-col :span="10"></el-col>
          </el-row>
        </template>
      </el-table-column>

      <el-table-column prop="client.fio" sortable label="Клиент" min-width="140"></el-table-column>
      <el-table-column prop="performer.fio" sortable label="Исполнитель" min-width="140"></el-table-column>
      <el-table-column prop="service.title" sortable label="Услуга" min-width="140"></el-table-column>

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
          <el-button
            type="primary"
            icon="el-icon-edit"
            circle
            @click="editRecord(scope.row.id)"
            v-if="!scope.row.deleted"
          ></el-button>
          <el-button
            type="danger"
            icon="el-icon-delete"
            circle
            @click.native.prevent="deleteRow(scope.$index, tableData, scope.row.id)"
            v-if="!scope.row.deleted"
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
    tableData: Array
  },
  data() {
    return {
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

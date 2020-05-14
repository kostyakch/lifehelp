<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <el-table-column prop="title" sortable label="Заголовок"></el-table-column>
    <el-table-column prop="quantity" label="Количество"></el-table-column>
    <el-table-column prop="description" label="Описание услуги"></el-table-column>

    <el-table-column fixed="right" label="Действия" width="120">
      <template slot-scope="scope">
        <el-button type="primary" icon="el-icon-edit" circle @click="editService(scope.row.id)"></el-button>
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
  name: "ServiceTable",
  props: {
    services: Array
  },
  data() {
    return {
      tableData: this.services
    };
  },
  methods: {
    deleteRow(index, rows, id) {
      this.$confirm("Вы действительно хотите удалить запись?").then(_ => {
        this.$api.service
          .destroy(id)
          .then(client => rows.splice(index, 1))
          .catch(error => (this.formError = true));
      });
    },
    editService(id) {
      location.replace(Routes.edit_service_path(id));
    }
  }
};
</script>

<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <el-table-column prop="title" label="Заголовок"></el-table-column>
    <el-table-column prop="quantity" label="Количество"></el-table-column>
    <el-table-column prop="description" label="Описание услуги"></el-table-column>

    <el-table-column fixed="right" label="Действия" width="180">
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
import api from "../../api";

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
      api.service
        .destroy(id)
        .then(client => rows.splice(index, 1))
        .catch(error => (this.formError = true));
    },
    editService(id) {
      location.replace(Routes.edit_service_path(id));
    }
  }
};
</script>
<style>
.client-table {
  width: 90%;
}
</style>
<template>
  <el-row :gutter="20">
    <SearchBox @callback="searchCallback" :query="this.$api.service" :collection="tableData" />

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
  </el-row>
</template>

<script>
import SearchBox from "../common/searchBox";

export default {
  name: "ServiceTable",
  components: { SearchBox },
  props: {
    services: Array
  },
  data() {
    return {
      tableData: this.services,
      showPagination: true
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
    },
    searchCallback(resp) {
      this.tableData = resp;
      this.showPagination = resp.length === this.services.length;
    }
  }
};
</script>

<template>
  <el-row :gutter="20">
    <SearchBox @callback="searchCallback" :query="this.$api.performer" :collection="tableData" />

    <el-table :data="tableData" stripe style="width: 100%">
      <el-table-column prop="fio" sortable label="ФИО" :min-width="160"></el-table-column>
      <el-table-column prop="phone" label="Телефон"></el-table-column>
      <el-table-column prop="email" label="E-mail"></el-table-column>
      <el-table-column prop="address" label="Адрес" :min-width="160"></el-table-column>
      <el-table-column prop="performer_type" label="Тип исполнителя">
        <template
          slot-scope="props"
        >{{ i18n.t("enums.performer.performer_type."+props.row.performer_type) }}</template>
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

    <Pagination
      @callback="paginationCallback"
      :query="this.$api.performer"
      :paginationObj="this.pagination"
    />
  </el-row>
</template>

<script>
import SearchBox from "../common/searchBox";
import Pagination from "../common/pagination";

export default {
  name: "PerformerTable",
  components: { SearchBox, Pagination },
  props: {
    performers: Array,
    pagination: Object
  },
  data() {
    return {
      tableData: this.performers,
      showPagination: this.pagination.total > this.pagination.per_page,
      i18n: I18n
    };
  },
  methods: {
    deleteRow(index, rows, id) {
      this.$confirm("Вы действительно хотите удалить запись?").then(_ => {
        this.$api.performer
          .destroy(id)
          .then(client => rows.splice(index, 1))
          .catch(error => (this.formError = true));
      });
    },
    editRecord(id) {
      location.replace(Routes.edit_performer_path(id));
    },
    searchCallback(resp) {
      this.tableData = resp;
      this.showPagination = resp.length === this.performers.length;
    },
    paginationCallback(resp) {
      this.tableData = resp;
    }
  }
};
</script>

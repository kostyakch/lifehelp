<template>
  <el-row>
    <h2>Исполнители</h2>
    <el-button type="primary" plain @click="newRecord()" class="bt-add">Добавить</el-button>

    <SearchBox @callback="searchCallback" :query="this.$api.performer" :collection="tableData" />
    <PerformerTable :tableData="tableData" />
    <Pagination
      @callback="paginationCallback"
      :query="this.$api.performer"
      :paginationObj="this.pagination"
      v-if="showPagination"
    />
  </el-row>
</template>

<script>
import PerformerTable from "./table.vue";
import SearchBox from "../common/searchBox";
import Pagination from "../common/pagination";

export default {
  name: "PerformerList",
  components: { PerformerTable, SearchBox, Pagination },
  props: {
    performers: Array,
    pagination: Object
  },
  data() {
    return {
      tableData: this.performers,
      showPagination: true
    };
  },
  methods: {
    newRecord() {
      location.replace(Routes.new_performer_path());
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

<style>
h2 {
  display: inline-block;
}
.bt-add {
  margin-left: 20px;
}
</style>


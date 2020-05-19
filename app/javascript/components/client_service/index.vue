<template>
  <el-row>
    <h2>Оказанные услуги</h2>

    <SearchBox
      @callback="searchCallback"
      :query="this.$api.client_service"
      :collection="tableData"
    />
    <ClientTable :tableData="tableData" />
    <Pagination
      @callback="paginationCallback"
      :query="this.$api.client_service"
      :paginationObj="this.pagination"
      v-if="showPagination"
    />
  </el-row>
</template>

<script>
import ClientTable from "./table.vue";
import SearchBox from "../common/searchBox";
import Pagination from "../common/pagination";

export default {
  components: { ClientTable, SearchBox, Pagination },
  props: {
    client_services: Array,
    pagination: Object
  },
    data() {
    return {
      tableData: this.client_services,
      showPagination: true
    };
  },
  methods: {
    searchCallback(resp) {
      this.tableData = resp;
      this.showPagination = resp.length === this.client_services.length;
    },
    paginationCallback(resp) {
      this.tableData = resp;
    }
  }
};
</script>

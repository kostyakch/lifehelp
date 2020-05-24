<template>
  <el-row>
    <h2>Оказанные услуги</h2>

    <el-row :gutter="20">
      <el-col :span="6">
        <SearchBox
          @callback="searchCallback"
          :query="this.$api.client_service"
          :collection="tableData"
        />
      </el-col>
      <el-col :span="10">
        <FilterStartFinish
          @callback="fdateCallback"
          :query="this.$api.client_service"
          :collection="tableData"
        />
      </el-col>
    </el-row>

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
import FilterStartFinish from "../common/filterStartFinish";

export default {
  components: { ClientTable, SearchBox, Pagination, FilterStartFinish },
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
    },
    fdateCallback(resp) {
      this.tableData = resp;
    }
  }
};
</script>

<template>
  <el-row>
    <h2>Справочник услуг</h2>
    <el-button type="primary" plain @click="newService()" class="bt-add">Добавить</el-button>

    <el-row>
      <el-col :span="5">
        <SearchBox @callback="searchCallback" :query="this.$api.service" :collection="tableData" />
      </el-col>
    </el-row>
    <ServiceTable :tableData="tableData" />
    <Pagination
      @callback="paginationCallback"
      :query="this.$api.service"
      :paginationObj="this.pagination"
      v-if="showPagination"
    />
  </el-row>
</template>

<script>
import ServiceTable from "./table.vue";
import SearchBox from "../common/searchBox";
import Pagination from "../common/pagination";

export default {
  name: "ServiceList",
  components: { ServiceTable, SearchBox, Pagination },
  props: {
    services: Array,
    pagination: Object
  },
  data() {
    return {
      tableData: this.services,
      showPagination: true
    };
  },
  methods: {
    newService() {
      location.replace(Routes.new_service_path());
    },
    searchCallback(resp) {
      this.tableData = resp;
      this.showPagination = resp.length === this.services.length;
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


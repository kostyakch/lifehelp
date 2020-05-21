<template>
  <el-row>
    <h2>Список клиентов</h2>
    <el-button type="primary" plain @click="newClient()" class="bt-add">Добавить</el-button>

    <SearchBox @callback="searchCallback" :query="this.$api.client" :collection="tableData" />
    <ClientTable :clients="tableData" />
    <Pagination
      @callback="paginationCallback"
      :query="this.$api.client"
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
  template: ClientTable,
  props: {
    clients: Array,
    pagination: Object
  },
  data() {
    return {
      tableData: this.clients,
      showPagination: true
    };
  },
  methods: {
    newClient() {
      location.replace(Routes.new_client_path());
    },
    searchCallback(resp) {
      this.tableData = resp;
      this.showPagination = resp.length === this.clients.length;
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


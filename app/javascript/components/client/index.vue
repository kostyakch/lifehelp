<template>
  <el-row>
    <h2>Список клиентов</h2>
    <el-button type="primary" plain @click="newClient()" class="bt-add">Добавить</el-button>

    <ClientTable :clients="cliensData" :pagination="this.pagination" />
  </el-row>
</template>

<script>
import ClientTable from "./table.vue";

export default {
  components: { ClientTable },
  template: ClientTable,
  props: {
    clients: Array,
    pagination: Object
  },
  data() {
    return {
      cliensData: this.clients
    };
  },
  methods: {
    newClient() {
      location.replace(Routes.new_client_path());
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


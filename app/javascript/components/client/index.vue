<template>
  <el-row>
    <h2>Список клиентов</h2>
    <el-button type="primary" plain @click="newClient()" class="bt-add">Добавить</el-button>
    <ClientTable :clients="this.clients" />
  </el-row>
</template>

<script>
import ClientTable from "./table.vue";

export default {
  components: { ClientTable },
  props: {
    clients: Array
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


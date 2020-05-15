<template>
  <el-row>
    <h2>Оказанные услуги</h2>
    <ClientTable :client_services="this.client_services" />
  </el-row>
</template>

<script>
import ClientTable from "./table.vue";

export default {
  components: { ClientTable },
  props: {
    client_services: Array
  }
};
</script>

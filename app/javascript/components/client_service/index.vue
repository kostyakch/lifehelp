<template>
  <div>
    <el-row>
      <h2>Оказанные услуги</h2>
    </el-row>

    <ClientTable :client_services="this.client_services" />
  </div>
</template>

<script>
import ClientTable from "./_table.vue";

export default {
  name: "ClientList",
  components: { ClientTable },
  props: {
    client_services: Array
  }
};
</script>

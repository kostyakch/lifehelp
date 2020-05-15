<template>
  <el-row>
    <h2>Справочник услуг</h2>
    <el-button type="primary" plain @click="newService()" class="bt-add">Добавить</el-button>

    <ServiceTable :services="this.services" />
  </el-row>
</template>

<script>
import ServiceTable from "./table.vue";

export default {
  name: "ServiceList",
  components: { ServiceTable },
  props: {
    services: Array
  },
  methods: {
    newService() {
      location.replace(Routes.new_service_path());
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


<template>
  <div>
    <el-row>
      <h2>Список услуг</h2>
      <el-button type="primary" plain @click="newService()" class="bt-add">Добавить</el-button>
    </el-row>

    <ServiceTable :services="this.services" />
  </div>
</template>

<script>
import ServiceTable from "./_table.vue";

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


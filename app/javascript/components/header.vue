<template>
  <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
    <el-menu-item index="cliens">
      <a :href="cliensPath()">Клиенты</a>
    </el-menu-item>
    <el-menu-item index="client_services">
      <a :href="clientServicesPath()">Оказанные услуги</a>
    </el-menu-item>
    <el-menu-item index="services">
      <a :href="servicesPath()">Справочник услуг</a>
    </el-menu-item>
    <el-menu-item index="performers">
      <a :href="performersPath()">Исполнители</a>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: ""
    };
  },
  methods: {
    cliensPath() {
      return Routes.clients_path();
    },
    servicesPath() {
      return Routes.services_path();
    },
    clientServicesPath() {
      return Routes.client_services_path();
    },
    performersPath() {
      return Routes.performers_path();
    }
  }
};
</script>

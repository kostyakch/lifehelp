<template>
  <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
    <el-menu-item index="cliens">
      <a :href="rts.clients_path()">Клиенты</a>
    </el-menu-item>
    <el-menu-item index="client_services">
      <a :href="rts.client_services_path()">Оказанные услуги</a>
    </el-menu-item>
    <el-menu-item index="services">
      <a :href="rts.services_path()">Справочник услуг</a>
    </el-menu-item>
    <el-menu-item index="performers">
      <a :href="rts.performers_path()">Исполнители</a>
    </el-menu-item>
    <el-menu-item index="sign-out" @click="signOut()" class="right">
      <a href="#" @click="signOut()">Выход</a>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: "",
      rts: Routes
    };
  },
  methods: {
    signOut() {
      this.$api.user
        .signOut()
        .then(resp => location.replace(Routes.root_path()));
    }
  }
};
</script>

<style>
.el-menu--horizontal > .el-menu-item.right {
  float: right;
}
</style>
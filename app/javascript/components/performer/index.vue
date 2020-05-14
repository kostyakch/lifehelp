<template>
  <el-row>
    <h2>Исполнители</h2>
    <el-button type="primary" plain @click="newRecord()" class="bt-add">Добавить</el-button>

    <PerformerTable :performers="this.performers" />
  </el-row>
</template>

<script>
import PerformerTable from "./_table.vue";

export default {
  name: "PerformerList",
  components: { PerformerTable },
  props: {
    performers: Array
  },
  methods: {
    newRecord() {
      location.replace(Routes.new_performer_path());
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


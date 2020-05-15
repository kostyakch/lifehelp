<template>
  <el-col :span="5">
    <el-input size="mini" placeholder="Поиск" v-model="search" @change="querySearch">
      <el-button slot="append" icon="el-icon-search" v-if="searchBtn"></el-button>
      <el-button slot="append" icon="el-icon-close" @click="clearSearsh" v-else></el-button>
    </el-input>
  </el-col>
</template>

<script>
export default {
  name: "SearchBox",
  props: {
    callback: Function,
    api: Object,
    collection: Array
  },
  data() {
    return {
      search: "",
      searchBtn: true,
      tableData: this.collection
    };
  },
  methods: {
    clearSearsh() {
      this.$emit("callback", this.tableData);
      this.searchBtn = true;
      this.search = "";
    },
    querySearch(query) {
      if (query !== "") {
        return this.api.search(query).then(resp => {
          this.$emit("callback", resp);
          this.searchBtn = false;
        });
      }
    }
  }
};
</script>

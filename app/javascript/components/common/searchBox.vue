<template>
  <el-row>
    <el-col :span="5">
      <el-input size="mini" placeholder="Поиск" v-model="search" @change="querySearch">
        <el-button slot="append" icon="el-icon-search" v-if="searchBtn"></el-button>
        <el-button slot="append" icon="el-icon-close" @click="clearSearsh" v-else></el-button>
      </el-input>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: "SearchBox",
  props: {
    callback: Function,
    query: Object,
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
    querySearch(queryStr) {
      if (queryStr !== "") {
        return this.query.search(queryStr).then(resp => {
          this.$emit("callback", resp);
          this.searchBtn = false;
        });
      }
    }
  }
};
</script>

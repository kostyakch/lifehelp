<template>
  <el-input
    size="mini"
    placeholder="Поиск"
    v-model="search"
    @change="querySearch"
    @clear="clearSearsh"
    clearable
  >
    <el-button slot="append" icon="el-icon-search"></el-button>
  </el-input>
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
      tableData: this.collection
    };
  },
  methods: {
    clearSearsh() {
      this.$emit("callback", this.tableData);
      this.search = "";
    },
    querySearch(queryStr) {
      if (queryStr !== "") {
        return this.query.search(queryStr).then(resp => {
          this.$emit("callback", resp);
        });
      }
    }
  }
};
</script>

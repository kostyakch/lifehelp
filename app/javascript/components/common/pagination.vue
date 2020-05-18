<template>
  <el-pagination
    background
    @current-change="handleCurrentChange"
    layout="prev, pager, next"
    :total="this.paginationObj.total"
    :page-size="this.paginationObj.per_page"
    v-if="showPagination"
  ></el-pagination>
</template>

<script>
export default {
  name: "Pagination",
  props: {
    callback: Function,
    query: Object,
    paginationObj: Object
  },
  data() {
    return {
      showPagination: this.paginationObj.total > this.paginationObj.per_page
    };
  },
  methods: {
    handleCurrentChange(val) {
      this.query.index({ page: val }).then(resp => {
        this.$emit("callback", resp);
      });
    }
  }
};
</script>

<template>
  <div class="block">
    <el-date-picker
      is-range
      v-model="date"
      type="daterange"
      format="dd.MM.yyyy"
      size="mini"
      value-format="yyyy-MM-dd"
      range-separator="До"
      start-placeholder="Дата начала"
      end-placeholder="Дата завершения"
      @change="dateChange"
    ></el-date-picker>
  </div>
</template>

<script>
export default {
  name: "FilterStartFinish",
  props: {
    callback: Function,
    query: Object,
    collection: Array
  },
  data() {
    return {
      date: "",
      tableData: this.collection
    };
  },
  methods: {
    dateChange(range) {
      if (range) {
        this.query
          .index({ filter: { started_at: range[0], finished_at: range[1] } })
          .then(resp => {
            this.$emit("callback", resp);
          });
      } else {
        this.$emit("callback", this.tableData);
      }
    }
  }
};
</script>

<template>
  <div>
    <h1>Список клиентов</h1>

    <ClientTable :clients="this.clients" />
  </div>
</template>

<script>
import ClientTable from "./_table.vue";

export default {
  props: {
    clients: Array
  },
  components: { ClientTable }
};
</script>


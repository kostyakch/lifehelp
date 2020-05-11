<template>
  <!--div class="client-table">
    <vue-table-dynamic :params="params"></vue-table-dynamic>
  </div-->
  <table class="client-table">
    <thead>
      <th>ФИО</th>
      <th>Дата рождения</th>
      <th>Телефон</th>
      <th>Адрес проживания</th>
      <th>Инфо</th>
      <th>Действия</th>
    </thead>
    <tbody>
      <tr v-for="item in this.clients" :key="item.id">
        <td>{{ item.fio }}</td>
        <td>{{ item.dob }}</td>
        <td>{{ item.phone }}</td>
        <td>{{ `${item.city} ${item.address}` }}</td>
        <td>{{ item.description }}</td>
        <td>
          <a :href="item.url">посм.</a>
          <a :href="item.edit_url">ред.</a>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
// import VueTableDynamic from "vue-table-dynamic";

export default {
  props: {
    clients: Array
  }
  // data() {
  //   return {
  //     params: {
  //       data: [
  //         [
  //           "ФИО",
  //           "Дата рождения",
  //           "Телефон",
  //           "Адрес проживания",
  //           "Инфо",
  //           "Действия"
  //         ]
  //       ],
  //       header: "row",
  //       columnWidth: [
  //         { column: 0, width: "22%" },
  //         { column: 3, width: "28%" },
  //         { column: 4, width: "30%" }
  //       ],
  //       // whiteSpace: "normal",
  //       headerHeight: 35,
  //       rowHeight: 35
  //     }
  //   };
  // },
  // mounted() {
  //   this.clients.forEach(item => {
  //     this.params.data.push([
  //       `${item.last_name} ${item.first_name} ${item.middle_name}`,
  //       item.dob,
  //       item.phone,
  //       `${item.city} ${item.address}`,
  //       item.description,
  //       `<a href='#'>Ред.</a>`
  //     ]);
  //   });
  // },
  // components: { VueTableDynamic }
};
</script>
<style>
.client-table {
  width: 90%;
}
</style>
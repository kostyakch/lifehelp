<template>
  <div>
    <h1>Просмотр данных {{ this.client.fio }}</h1>

    <table class="client-table">
      <tbody>
        <tr>
          <td width="10%">Н/пп</td>
          <td>{{ this.client.id }}</td>
        </tr>
        <tr>
          <td>ФИО</td>
          <td>{{ this.client.fio }}</td>
        </tr>
        <tr>
          <td>Дата рождения</td>
          <td>{{ this.client.dob }}</td>
        </tr>
        <tr>
          <td>Телефон</td>
          <td>{{ this.client.phone }}</td>
        </tr>
        <tr>
          <td>Адрес</td>
          <td>{{ this.client.address }}</td>
        </tr>
        <tr>
          <td>Дополнительная информация</td>
          <td>{{ this.client.description }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    client: Object
  }
};
</script>

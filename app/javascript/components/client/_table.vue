<template>
  <el-table :data="tableData" stripe style="width: 100%">
    <el-table-column type="expand">
      <template slot-scope="props">
        <el-row :gutter="20">
          <el-col :span="10">
            <p>
              <b>E-mail:</b>
              {{ props.row.email }}
            </p>
            <p>
              <b>Город:</b>
              {{ props.row.city }}
            </p>
            <p>
              <b>Район:</b>
              {{ props.row.area }}
            </p>
            <p>
              <b>Адрес:</b>
              {{ props.row.address }}
            </p>
            <p>
              <b>Информация:</b>
              {{ props.row.description }}
            </p>
          </el-col>
          <el-col :span="10">
            <p>
              <b>Источник данных:</b>
              {{ props.row.source }}
            </p>
            <p>
              <b>Параметры:</b>
              {{ props.row.client_type }}
            </p>
            <p>
              <b>Код:</b>
              {{ props.row.code }}
            </p>
            <p>
              <b>Объективность:</b>
              {{ props.row.objectivity }}
            </p>
            <p>
              <b>Материальный статус:</b>
              {{ props.row.marital_status }}
            </p>
            <p>
              <b>Социальный статус:</b>
              {{ props.row.social_status }}
            </p>
          </el-col>
        </el-row>
      </template>
    </el-table-column>
    <el-table-column label="ФИО">
      <template
        slot-scope="props"
      >{{ props.row.last_name }} {{ props.row.first_name }} {{ props.row.middle_name }}</template>
    </el-table-column>
    <el-table-column prop="dob" label="Дата рождения"></el-table-column>
    <el-table-column prop="phone" label="Телефон"></el-table-column>
    <el-table-column prop="city" label="Город"></el-table-column>
    <el-table-column fixed="right" label="Действия" width="280">
      <template slot-scope="scope">
        <el-button type="primary" icon="el-icon-check" circle @click="showClient(scope.row.id)"></el-button>
        <el-button type="primary" icon="el-icon-edit" circle @click="editClient(scope.row.id)"></el-button>
        <el-button
          type="danger"
          icon="el-icon-delete"
          circle
          @click.native.prevent="deleteRow(scope.$index, tableData, scope.row.id)"
        ></el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import { mapActions } from "vuex";
import api from "../../api";

export default {
  props: {
    clients: Array
  },
  methods: {
    deleteRow(index, rows, id) {
      this.destroyClient(id);
      rows.splice(index, 1);
    },
    showClient(id) {
      location.replace(Routes.client_path(id));
    },
    editClient(id) {
      location.replace(Routes.edit_client_path(id));
    },
    ...mapActions({
      destroyClient: "destroyClient"
    })
  },
  data() {
    return {
      tableData: this.clients
    };
  }
};
</script>
<style>
.client-table {
  width: 90%;
}
</style>
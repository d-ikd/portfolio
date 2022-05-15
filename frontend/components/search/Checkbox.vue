<template>
  <div>
    <v-card elevation="1">
      <p class="ma-0 mt-12 py-2 text-center category">カテゴリ</p>
      <v-divider class="mb-1" />
      <div class="check-box ml-4">
        <v-checkbox
          v-model="categorySort.indoor"
          dense
          label="インドア"
          class="box"
        />
        <v-checkbox
          v-model="categorySort.outdoor"
          dense
          label="アウトドア"
          class="box"
        />
      </div>
    </v-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      categorySort: [{ indoor: false }, { outdoor: false }],
    }
  },
  mounted() {
    this.$emit('category', this.categorySort)
  },
}
</script>

<style scoped>
.box {
  height: 17px;
}
.check-box {
  overflow: scroll;
  max-height: 230px;
}
.category {
  color: rgba(0, 0, 0, 0.54);
  font-size: 14px;
  font-weight: 700;
}
</style>

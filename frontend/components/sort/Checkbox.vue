<template>
  <!-- https://qiita.com/5ou/items/33991607374645c3f799 -->
  <div class="check-box ml-4">
    <v-card elevation="1">
      <!--
      <p class="ma-0 mt-12 py-2 text-center category white--text">カテゴリ</p>
      <v-divider class="mb-1" />
      <div v-for="(poke, i) in pokes" :key="i" class="check-box ml-4">
        <input
          v-model="selectedPokes"
          dense
          :id="'poke' + i"
          type="checkbox"
          :value="poke"
          class="box"
        >
        <label :for="'poke' + i">{{poke}}</label>
      </div> -->
    </v-card>
  </div>

  <!--
    <v-card>
      <div class="check-box ml-4">
        <v-checkbox
          v-model="categorySort.onigiri"
          dense
          label="おにぎり"
          class="box"
        />
        <v-checkbox
          v-model="categorySort.bento"
          dense
          label="お弁当"
          class="box"
        />
      </div>
    </v-card> -->
</template>

<script>
export default {
  data() {
    return {
      pokes: [
        'フシギダネ',
        'フシギソウ',
        'フシギバナ',
        'ヒトカゲ',
        'リザード',
        'リザードン',
        'ゼニガメ',
        'カメール',
        'カメックス',
      ],
      selectedPokes: [],
      /*       categorySort: [
        { onigiri: false },
        { bento: false },
        { sandwich: false },
      ], */
    }
  },
  /*
  mounted() {
    this.$emit("category", this.categorySort)
    /* this.$emit("maker", this.makerSort)
  }, */
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

<template>
  <div class="">
    <hr />
    <p>{{ myComponentDoubleCount }}</p>
    <p>{{ Getters }}</p>
    <p>{{ doubleCount }}</p>
    <button @click="increment">+1</button>
    <button @click="decrement">-1</button>
    <hr />

    <p>({{ message }})</p>
    <input type="text" class="white--text" v-model="message" />
    <p>{{ counter }}</p>
    <button @click="counter += 1">+1</button>
    <p>{{ lessThanThree }}</p>
    <p v-if="ok">OK!</p>
    <p v-else-if="maybeOk">Maybe...</p>
    <p v-else>Not OK...</p>
    <button @click="ok = !ok">Button2</button>
    <p>{{ MyMes }}</p>
    <hr />

    <ul>
      <li v-for="n in 3" :key="n">{{ n }}</li>
    </ul>
    <hr />
    <ul>
      <li v-for="(fruit, index) in fruits" :key="fruit">
        ({{ index }}) {{ fruit }}
      </li>
    </ul>
    <hr />
    <ul>
      <li v-for="(value, key, index) in children" :key="value">
        {{ key }}-{{ value }}-{{ index }}
      </li>
    </ul>
  </div>
</template>

<script>
// import { mapActions, mapGetters } from "vuex"
import { mapGetters } from 'vuex'

export default {
  components: {},
  data() {
    return {
      /* count: state.count, */
      counter: 0 /*Vue.jsは初期値を扱う*/,
      fruits: ['apple', 'banana', 'grape'],
      children: {
        sister: 'Alice',
        brother: 'John',
      },
      ok: true,
      maybeOk: false,
      message: 'Hello2',
    }
  },
  computed: {
    ...mapGetters({
      myComponentDoubleCount: 'doubleCount',
    }),
    Getters() {
      return this.$store.getters
      /* return this.$store.state.count.Yuri; */
      /* return this.$store.getters.count; */
    },
    doubleCount() {
      return this.$store.getters
      /* return this.$store.state.count.Yuri; */
      /* return this.$store.getters.count; */
    },
    lessThanThree: function() {
      return this.counter > 3 ? '３より上' : '３以下'
    },
    MyMes: function() {
      return this.children
    },
  },
  methods: {
    /* ...mapActions({ getFoods: "food/getFoods" }), */
    increment() {
      this.$store.state.count.Yuri++
    },
    decrement() {
      this.$store.state.count.Yuri--
    },
  },
}
</script>

<template>
  <div>
    <postCardMenu />
  </div>
</template>

<script>
import postCardMenu from '~/components/infoPost/PostCardMenu.vue'
import { mapGetters } from 'vuex'
export default {
  data() {
    return {}
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
  },
  components: {
    /*     Checkbox, */
    postCardMenu,
    /*     SearchPost2, */
    /*     userMenuList, */
    /*     userMenu, */
  },
}
</script>

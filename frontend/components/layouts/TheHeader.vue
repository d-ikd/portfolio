<template>
  <v-app-bar :clipped-left="clipped" app dark>
    <TheHeaderSettingDialog />
    <TheHeaderLogo />
    <TheHeaderTabs />
    <TheHeaderSearch />
    <TheHeaderLogin />
  </v-app-bar>
</template>

<script>
import TheHeaderLogo from '~/components/layouts/TheHeaderLogo.vue'
import TheHeaderTabs from '~/components/layouts/TheHeaderTabs.vue'
import TheHeaderSearch from '~/components/layouts/TheHeaderSearch.vue'
import TheHeaderLogin from '~/components/layouts/TheHeaderLogin.vue'
import TheHeaderSettingDialog from '~/components/layouts/TheHeaderSettingDialog.vue'
import { mapGetters, mapActions } from 'vuex'
/* import headerAvatar from "~/components/HeaderAvatar.vue" */
/* import signUpModal from "~/components/SignUpModal.vue" */
// import searchForm from "~/components/SearchForm.vue"

export default {
  components: {
    TheHeaderLogo,
    TheHeaderTabs,
    TheHeaderSearch,
    TheHeaderLogin,
    TheHeaderSettingDialog,
    /* signUpModal, */
  },
  data() {
    return {
      drawer: null,
    }
  },
}
</script>

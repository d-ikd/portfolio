<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-account-box </v-icon>
    <span>アイコン画像</span>
    <!-- <v-avatar size="100">
      <template v-if="image.url !== null">
        <v-img v-if="input_image !== null" :src="input_image" />
        <v-img v-else :src="image.url" />
      </template>
      <template v-else>
        <v-img v-if="input_image" :src="input_image" />
      </template>
    </v-avatar> -->
    <v-row justify="center" class="pt-6">
      <v-avatar size="100">
        <template v-if="image.url !== null">
          <v-img v-if="input_image !== null" :src="input_image" />
          <v-img v-else :src="image.url" />
        </template>
        <template v-else>
          <v-img v-if="input_image" :src="input_image" />
        </template>
      </v-avatar>
    </v-row>

    <v-file-input
      v-model="editImage"
      accept="image/png, image/jpeg, image/bmp"
      prepend-icon="mdi-account-box"
      label="変更するアバター画像を選択してください"
      class="pt-14"
      @change="setImage"
    />
    <v-btn
      rounded
      color="#48A1EB"
      class="font-weight-bold"
      min-width="125px"
      @click="changeUserAvatar"
    >
      変更
    </v-btn>
  </v-form>
</template>

<script>
export default {
  // props: {
  //   image: {
  //     type: Object,
  //     required: true,
  //   },
  // },
  data() {
    return {
      image: this.$store.getters['auth/currentUser'].image,
      editImage: '',
      input_image: null,
    }
  },
  methods: {
    setImage(file) {
      this.editImage = file
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.input_image = fr.result
        })
      } else {
        this.input_image = null
      }
    },
    async changeUserAvatar() {
      const formData = new FormData()
      if (this.editImage !== '') {
        formData.append('image', this.editImage)
      }
      await this.$axios
        .put('api/v1/auth', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
          this.$store.commit('auth/setCurrentUser', res.data.data)
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'アバター画像を更新しました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch(() => {
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'アバター画像の更新に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
    },
  },
}
</script>

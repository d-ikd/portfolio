<template>
  <v-dialog v-model="editDialog" max-width="600">
    <template #activator="{ on, attrs }">
      <v-btn small v-bind="attrs" v-on="on"> 編集 </v-btn>
    </template>

    <v-card>
      <v-system-bar lights-out>
        <v-spacer></v-spacer>
        <v-btn icon class="mt-5" @click="editDialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-system-bar>
      <v-card-title class="headline justify-center">
        {{ post.name }}
      </v-card-title>
      <v-card-text>
        <v-form ref="form">
          <template v-if="post.image.url">
            <v-img
              v-if="input_image !== null"
              :src="input_image"
              contain
              max-width="200"
              max-height="100"
            />
            <v-img
              v-else
              :src="post.image.url"
              contain
              max-width="200"
              max-height="100"
            />
          </template>
          <template v-else>
            <v-img
              v-if="input_image"
              :src="input_image"
              contain
              max-width="200"
              max-height="100"
            />
          </template>
          <v-file-input
            accept="image/png, image/jpeg, image/bmp"
            outlined
            label="サムネイル"
            @change="setImage"
          />
          <v-text-field
            v-model="name"
            placeholder="例: ピクニック"
            label="タイトル"
          />
          <v-textarea
            v-model="details"
            placeholder="例: 隅田川で石投げ"
            label="詳細"
          />
          <v-text-field
            v-model.number="price"
            placeholder="例: 3000"
            label="価格"
          />
          <v-text-field
            v-model.number="start_time"
            placeholder=""
            label="開始時刻"
          />
          <v-text-field
            v-model.number="finish_time"
            placeholder=""
            label="終了時刻"
          />
          <v-text-field
            v-model.number="member"
            placeholder="例: 5"
            label="メンバー (人)"
          />
          <v-text-field
            v-model.number="place"
            placeholder="例: 代々木公園"
            label="場所"
          />
          <v-select
            v-model="category"
            :items="categoryList"
            label="カテゴリー"
          />
          <v-menu
            ref="menu"
            v-model="menu"
            :close-on-content-click="false"
            :return-value.sync="release"
            transition="scale-transition"
            offset-y
            min-width="auto"
          >
            <template #activator="{ on, attrs }">
              <v-text-field
                v-model="release"
                label="投稿日"
                readonly
                v-bind="attrs"
                v-on="on"
              />
            </template>
            <v-date-picker v-model="release" no-title scrollable>
              <v-spacer></v-spacer>
              <v-btn text color="primary" @click="menu = false"> Cancel </v-btn>
              <v-btn text color="primary" @click="$refs.menu.save(release)">
                OK
              </v-btn>
            </v-date-picker>
          </v-menu>
          <v-card-actions>
            <v-btn
              color="light-green darken-1"
              class="white--text"
              @click="postEdit"
            >
              保存する
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      editDialog: false,
      id: this.post.id,
      input_image: null,
      name: this.post.name,
      image: this.post.image,
      details: this.post.details,
      start_time: this.post.start_time,
      finish_time: this.post.finish_time,
      member: this.post.member,
      place: this.post.place,
      category: this.post.category,
      price: this.post.price,
      release: this.post.release,
      categoryList: ['インドア', 'アウトドア'],
      menu: false,
      today: '',
    }
  },
  computed: {},
  methods: {
    postEdit() {
      const formData = new FormData()
      formData.append('name', this.name)
      formData.append('image', this.image)
      formData.append('details', this.details)
      formData.append('start_time', this.start_time)
      formData.append('finish_time', this.finish_time)
      formData.append('member', this.member)
      formData.append('place', this.place)
      formData.append('category', this.category)
      formData.append('release', this.release)
      formData.append('price', this.price)
      const config = {
        headers: {
          'content-type': 'multipart/form-data',
        },
      }
      this.$axios
        .patch(`api/v1/posts/${this.id}`, formData, config)
        .then((res) => {
          console.log(res)
          console.log('投稿を更新しました')
          this.editDialog = false
        })
        .catch((err) => {
          console.log(err)
          console.log('投稿失敗')
        })
    },
    setImage(file) {
      this.image = file
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
  },
}
</script>

<style scoped></style>

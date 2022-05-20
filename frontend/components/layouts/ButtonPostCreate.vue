<template>
  <!-- <template v-if="loginUser && loginUser.id == user.id"> -->
  <v-dialog
    v-model="dialog"
    hide-overlay
    transition="dialog-bottom-transition"
    max-width="600"
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        color="#BDBDBD"
        dark
        x-large
        fixed
        fab
        bottom
        right
        v-bind="attrs"
        class="ma-10"
        v-on="on"
      >
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>
    <v-card-title class="transparent white--text">
      <span class="headline"></span>

      <v-spacer></v-spacer>

      <v-menu bottom left>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="#BDBDBD88"
            fab
            dark
            x-large
            v-bind="attrs"
            v-on="on"
            @click="dialog = false"
          >
            <v-icon color="white"> mdi-close-circle-outline</v-icon>
          </v-btn>
        </template>
      </v-menu>
    </v-card-title>

    <v-card width="400px" class="mx-auto pb-3 mb-10">
      <v-card-text>
        <v-form ref="form" lazy-validation class="pt-10">
          <v-file-input
            accept="image/png, image/jpeg, image/bmp"
            outlined
            label="トップ画像"
            @change="setImage"
          />
          <v-text-field
            v-model="name"
            placeholder="例: みんな集まれ憩いの川"
            label="タイトル"
          />
          <v-textarea
            v-model="details"
            placeholder="例: これから川遊びにいきましょう。"
            label="詳細"
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
                label="開催日"
                readonly
                v-bind="attrs"
                v-on="on"
              />
            </template>

            <v-date-picker v-model="release" scrollable elevation="15">
              <v-spacer></v-spacer>
              <v-flex justify-center>
                <v-btn text color="primary" @click="menu = false">
                  Cancel
                </v-btn>
                <v-btn text color="primary" @click="$refs.menu.save(release)">
                  OK
                </v-btn>
              </v-flex>
            </v-date-picker>
          </v-menu>
          <v-menu
            ref="starttimepicker"
            v-model="starttimepicker"
            :close-on-content-click="false"
            :return-value.sync="start_time"
            transition="scale-transition"
            offset-y
            min-width="auto"
          >
            <template #activator="{ on, attrs }">
              <v-text-field
                v-model="start_time"
                label="開始時刻"
                readonly
                v-bind="attrs"
                v-on="on"
              />
            </template>

            <v-time-picker
              v-model="start_time"
              elevation="15"
              color="green lighten-1"
              format="24hr"
            >
              <v-spacer></v-spacer>
              <v-flex justify-center>
                <v-btn text color="primary" @click="starttimepicker = false">
                  Cancel
                </v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.starttimepicker.save(start_time)"
                >
                  OK
                </v-btn>
              </v-flex>
            </v-time-picker>
          </v-menu>
          <v-menu
            ref="finishtimepicker"
            v-model="finishtimepicker"
            :close-on-content-click="false"
            :return-value.sync="finish_time"
            transition="scale-transition"
            offset-y
            min-width="auto"
          >
            <template #activator="{ on, attrs }">
              <v-text-field
                v-model="finish_time"
                label="終了時刻"
                readonly
                v-bind="attrs"
                v-on="on"
              />
            </template>

            <v-time-picker
              v-model="finish_time"
              elevation="15"
              color="green lighten-1"
              format="24hr"
            >
              <v-spacer></v-spacer>
              <v-flex justify-center>
                <v-btn text color="primary" @click="finishtimepicker = false">
                  Cancel
                </v-btn>
                <v-btn
                  text
                  color="primary"
                  @click="$refs.finishtimepicker.save(finish_time)"
                >
                  OK
                </v-btn>
              </v-flex>
            </v-time-picker>
          </v-menu>

          <v-text-field
            v-model.number="member"
            placeholder="例: 5"
            label="人数 ( 人 )"
          />

          <v-text-field
            v-model.number="price"
            placeholder="例: 2000"
            label="予算 ( 円 / 一人当たり )"
          />
          <v-text-field
            v-model.number="place"
            placeholder="例: 代々木公園"
            label="場所"
          />

          <v-text-field
            v-model="quickword"
            placeholder="例: 楽しみましょう！"
            label="声かけメッセージ"
          />
          <v-text-field
            v-model="catchcopy"
            placeholder="例: 春が始まりましたね"
            label="キャッチコピー"
          />

          <v-select
            v-model="category"
            :items="categoryList"
            label="カテゴリー"
            item-text="category"
          />
          <v-divider class="ma-2" />
          <!--
            <v-card-actions>
              <v-btn
                color="light-green darken-1"
                class="white--text"
                @click="postCreate"
                @click="dialog = false"
              >
                保存する
              </v-btn>
            </v-card-actions> -->

          <v-row
            class="green lighten-4"
            style="height: 50px;"
            justify="center"
            align-content="center"
          >
            <v-btn
              x-large
              block
              color="#48A1EB"
              class="font-weight-bold align-center"
              min-width="125px"
              icon
              dark
              @click="postCreate"
            >
              <v-icon>mdi-cube-send</v-icon>
              投稿する
            </v-btn>
          </v-row>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
  <!-- </template> -->
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
      name: '',
      image: '',
      details: '',
      start_time: '12:00',
      finish_time: '18:00',
      member: '5',
      place: '',
      price: '1000',
      release: '',
      quickword: '初めまして。よろしくお願いします！',
      catchcopy: 'キャッチコピーを入力します',
      category: { category: 'インドア' },
      categoryList: ['インドア', 'アウトドア'],
      menu: false,
      starttimepicker: false,
      finishtimepicker: false,
      today: '',
    }
  },
  created() {
    this.today = new Date()
    this.release =
      this.today.getFullYear() +
      '-' +
      Number(this.today.getMonth() + 1) +
      '-' +
      this.today.getDate()
  },
  methods: {
    setImage(e) {
      this.image = e
    },
    postCreate() {
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
      formData.append('quickword', this.quickword)
      formData.append('catchcopy', this.catchcopy)
      const config = {
        headers: {
          'content-type': 'multipart/form-data',
        },
      }
      this.$axios
        .post('api/v1/posts', formData, config)
        .then((res) => {
          console.log(res)
          console.log('Success')
          this.dialog = false
          this.$router.go({ path: '/', force: true })
          /*
          this.$store.commit('snackbarMessage/setMessage', ' 投稿しました', {
            root: true,
          })
          this.$store.commit('snackbarMessage/setType', 'success', {
            root: true,
          })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          */
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
        })
        .catch((err) => {
          console.log(err)
          console.log('Failure')
        })
    },
  },
}
</script>

<style></style>

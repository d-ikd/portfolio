<template>
  <v-sheet>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-2 shadow-text1 pink--text font-weight-bold no-wrap-text"
        >
          Stuctiveとは
        </div>
      </div>
    </v-card-text>
    <v-card class="ml-2 mr-2" tile rounded-card>
      <v-card-text>
        ここにアプリの説明を書く
      </v-card-text>
    </v-card>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          最初の手順
        </div>
      </div>
      <div class="bluecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      ページ右上の「ゲストログイン」を<br />
      クリックしてください。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          参加までの４クリック
        </div>
      </div>
      <div class="bluecolor">
        <div class="shadow-text2 pink--text font-weight-bold no-wrap-text">
          ページ遷移がないスムーズな参加手続
        </div>
      </div>
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ①１クリック目（<v-icon color="pink">mdi-heart-outline</v-icon>ボタン）
        </div>
      </div>

      <v-img
        contain
        :src="require('@/assets/images/default.png')"
        class="mr-5 ml-5"
      ></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>
      <v-img
        contain
        :src="require('@/assets/images/default.png')"
        class="mr-5 ml-5"
      ></v-img>

      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-5">
        気になる募集があったら、<v-icon color="pink">mdi-heart-outline</v-icon
        >を押していきましょう。<br />
        たくさん押しても大丈夫。あとで見返すことができます。<br /><br /><br />
      </div>

      <div class="bluecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ②２クリック目（<v-icon color="blue">mdi-dots-vertical</v-icon>ボタン）
        </div>
      </div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-10">
        右上の <v-icon>mdi-dots-vertical</v-icon> で見返してみましょう。<br />
        このストックはいつでも見返すことができます。<br /><br /><br />
      </div>

      <div class="bluecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ③３クリック目（<v-icon color="cyan">mdi-walk</v-icon>ボタン）
        </div>
      </div>

      <v-img
        contain
        :src="require('@/assets/images/default.png')"
        class="mr-5 ml-5"
      ></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      <div class="mb-10">
        次に、<v-icon color="cyan">mdi-walk</v-icon
        >を押して詳細を見てみましょう。<br /><br /><br />
      </div>

      <div class="bluecolor">
        <div class="pink--text font-weight-bold no-wrap-text">
          ④４クリック目（<v-icon color="red">mdi-run</v-icon>ボタン）
        </div>
      </div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>

      詳細ページです。<v-icon color="red">mdi-run</v-icon>
      を押して参加完了です。<br /><br /><br />

      <br /><br />

      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          メッセージページ
        </div>
      </div>
      <div class="bluecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ 図 ]<br /><br /><br /></div>

      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ gif解説 ]<br /><br /></div>
      <div class="caption">
        時間がある時には、
        <v-icon color="blue">mdi-email-variant</v-icon>
        を押してメッセージを送りにいきましょう。<br /><br />
      </div>
    </v-card-text>

    <v-card-text class="text-center align-self-center">
      <v-img contain :src="require('@/assets/images/default.png')"></v-img>
      <div class="caption">[ gif解説（補足）]<br /><br /></div>
      <div class="caption">
        「参加」は、メッセージを送るページからでも可能です<br /><br />
      </div>
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          メンバーリスト
        </div>
      </div>
      <div class="bluecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img contain :src="require('@/assets/images/default.png')"></v-img>
    <v-card-text class="text-center align-self-center">
      カード下部の <v-icon>mdi-run</v-icon> をクリック。フォローもできます。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          ポスト作成
        </div>
      </div>
      <div class="bluecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img
      contain
      class="mr-7"
      :src="require('@/assets/images/default.png')"
    ></v-img>
    <v-card-text class="text-center align-self-center">
      ページ右下の <v-icon color="indigo">mdi-pencil</v-icon> をクリック。<br />
      どこからでもポストすることができます。
    </v-card-text>
    <v-card-text class="text-center align-self-center">
      <div class="bluecolor">
        <div
          class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text mt-10"
        >
          ポスト編集/削除
        </div>
      </div>
      <div class="bluecolor">
        <div
          class="shadow-text2 pink--text font-weight-bold no-wrap-text"
        ></div>
      </div>
    </v-card-text>
    <v-img contain :src="require('@/assets/images/default.png')"></v-img>
    <v-card-text class="text-center align-self-center">
      <b>メッセージページ</b>右上の<br />
      <v-icon color="indigo">mdi-pencil</v-icon>で編集、<v-icon color="blue"
        >mdi-delete</v-icon
      >で削除することができます。<br />
    </v-card-text>
  </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'
// import buttonLike from '~/components/layouts/ButtonLike.vue'
// import userAvatar from '~/components/infoUser/UserAvatar.vue'
// import postMessage from '~/components/infoPost/PostMessage.vue'

export default {
  components: {
    // buttonLike,
    // userAvatar,
    // postMessage,
  },
  props: {
    // post: {
    //   type: Object,
    //   default: () => ({}),
    //   required: true,
    // },
  },
  data() {
    return {
      defaultImage: require(`@/assets/images/default.png`),
      /* reverse: true, */
      dialog: false,
    }
  },
  computed: {
    ...mapGetters({
      posts: 'post/posts',
      loginUser: 'auth/loginUser',
    }),
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
        }
      })
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.shadow-text1 {
  text-shadow: 1px 1px 2px #ffffff;
}
.shadow-text2 {
  text-shadow: 2px 2px 3px #ffffff;
  border-bottom: double;
}
.shadow-text3 {
  text-shadow: 2px 5px 50px;
}

.bluecolor {
  background: #ffffff; /*背景色*/
  padding: 0.5em; /*文字周りの余白*/
  color: white; /*文字を白に*/
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 0.5em; /*角の丸み*/
}
</style>

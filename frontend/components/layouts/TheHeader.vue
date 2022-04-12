<template>
  <v-app-bar color="sky blue" dark app clipped-left>
    <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
    <nuxt-link to="/" class="link">
      <v-toolbar-title class="header-title">Hello</v-toolbar-title>
    </nuxt-link>
    <v-toolbar-title>What's up?</v-toolbar-title>
    <v-spacer></v-spacer>

    <v-toolbar-items>
      <nuxt-link to="/users/edit" class="link">
        <v-btn text>Edit Profile</v-btn>
      </nuxt-link>
      <v-menu offset-y>
        <template v-slot:activator="{ on }">
          <v-btn v-on="on" text>日記<v-icon>mdi-menu-down</v-icon></v-btn>
        </template>

        <v-list>
          <v-subheader>フロント始めました！</v-subheader>
          <v-list-item v-for="support in supports" :key="support.name">
            <v-list-item-icon>
              <v-icon>{{ support.icon }}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>{{ support.name }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-toolbar-items>
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      drawer: null,
      supports: [
        {
          name: '今日の積み上げ',
          icon: 'mdi-checkbox-marked-circle',
        },
        { name: '明日も頑張ろう', icon: 'mdi-thumb-up' },
        { name: 'Github', icon: 'mdi-github' },
      ],
      subTitle: 'Hello Vue',
      multiLine: true,
      snackbar: false,
      text: `I'm a multi-line snackbar.`,
      nav_lists: [
        {
          name: 'Getting Started',
          icon: 'mdi-speedometer',
          lists: ['Quick Start', 'Pre-made layouts'],
        },
        {
          name: 'Customization',
          icon: 'mdi-cogs',
        },
        {
          name: 'Styles & animations',
          icon: 'mdi-palette',
          lists: ['Colors', 'Content', 'Display'],
        },
        {
          name: 'UI Components',
          icon: 'mdi-view-dashboard',
          lists: ['API explorer', 'Alerts'],
        },
        {
          name: 'Directives',
          icon: 'mdi-function',
        },
        {
          name: 'Preminum themes',
          icon: 'mdi-vuetify',
        },
      ],
    }
  },
}
</script>

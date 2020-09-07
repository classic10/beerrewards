<template>
  <div class="home vue-tempalte">
    <h3>This is home screen</h3>
    <h3 v-if="userType == 'guestUser' || userType == 'registeredUser'">
      This is guest content
    </h3>
    <h3 v-if="userType == 'registeredUser'">This is registered user content</h3>
    <button class="btn btn-dark continue" :onclick="logout">LOG OUT</button>
  </div>
</template>
<script>
export default {
  name: "Home",
  data() {
    return {
      userType: localStorage.getItem("accessType"),
    };
  },
  components: {},
  beforeRouteEnter(to, from, next) {
    //Redirects to the main page if the user is not logined either by guest or login.
    if (!localStorage.getItem("accessType")) {
      next("/");
    } else {
      next();
    }
  },
  methods: {
    logout() {
      localStorage.clear();
      window.location.href = "/";
    },
  },
};
</script>
<style scoped>
.home {
  color: white;
  font-size: xx-large;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
.continue {
  font-size: 15px;
  border-radius: 15px;
  padding: 4px 10px;
}
</style>

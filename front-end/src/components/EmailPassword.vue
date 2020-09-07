<template>
  <div>
    <form class="needs-validation" @submit="onContinue">
      <div class="form-group">
        <input
          type="email"
          class="form-control"
          placeholder="EMAIL"
          v-model="formValues.email"
          id="email"
          required
        />
      </div>
      <div class="input-group mb-3">
        <input
          :type="passwordButtonStatus ? 'text' : 'password'"
          class="form-control"
          placeholder="PASSWORD"
          v-model="formValues.password"
          id="password"
          required
        />
        <div class="input-group-append">
          <button
            class="btn btn-outline-link btn-sm"
            type="button"
            id="button-addon2"
            :onclick="toggleButtonStatus"
          >
            {{ passwordButtonStatus ? "Hide" : "Show" }}
          </button>
        </div>
      </div>
      <div class="footer-container">
        <a href="" class="forgot-password">
          Forgot password?
        </a>
        <button class="btn btn-dark btn-lg continue" type="submit">
          CONTINUE
        </button>
      </div>
      <router-link to="/register" class="register"
        >Register for a new account</router-link
      >
    </form>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "EmailPassword",
  data() {
    return {
      formValues: {
        email: null,
        password: null,
      },
      passwordButtonStatus: false,
    };
  },
  mounted() {},
  components: {},
  methods: {
    async onContinue(e) {
      e.preventDefault();
      try {
        // API calling for login
        const result = await axios({
          method: "POST",
          url: "http://beerrewardsadmin.demos.classicinformatics.com/api/login",
          headers: { Accept: "application/json" },
          data: this.formValues,
        });

        if (result.data.error === undefined) {
          localStorage.setItem("data", result.data.data);
          localStorage.setItem("accessToken", result.data.access_token);
          localStorage.setItem("accessType", "registeredUser");
          localStorage.setItem("tokenType", result.data.token_type);
          //reirects directly to home page if the user is registered successfully
          window.location.href = "/home";
        } else {
          alert(result.data.message);
        }
      } catch (error) {
        console.error(error);
      }
    },
    toggleButtonStatus() {
      // method to show/hide the password
      this.passwordButtonStatus = !this.passwordButtonStatus;
    },
  },
};
</script>
<style scoped>
.form-container {
  margin: 20px 5px;
}
.continue {
  font-size: 10px;
  border-radius: 15px;
  padding: 4px 10px;
}
.footer-container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
.button-center {
  justify-content: center;
}
.forgot-password {
  font-size: x-small;
  margin-right: 30px;
  font-weight: 600;
  text-decoration: none;
}
.register {
  color: #c7cbd0;
  font-size: x-small;
  text-decoration: none;
}
.btn-outline-link,
.btn-outline-link:focus {
  box-shadow: none !important;
  outline: 0 !important;
  border-width: 0 0 1px !important;
  border-color: #212529 !important;
  border-radius: 0px !important;
  font-weight: bold;
}
</style>

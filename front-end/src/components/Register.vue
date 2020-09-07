<template>
  <common-layout
    heading="Have an account?"
    :subHeading="subHeadingText"
    :showForgotPassword="true"
    :onContinue="onContinue"
  >
    <component :is="child_component" :onContinue="onContinue"></component>
  </common-layout>
</template>

<script>
import CommonLayout from "@/components/CommonLayout.vue";
import EmailPassword from "@/components/EmailPassword.vue";

export default {
  name: "Register",
  data() {
    return {
      subHeadingText: "LOGIN WITH YOUR \n BEER REWARDS ACCOUNT",
      child_component: "EmailPassword",
    };
  },

  components: {
    "common-layout": CommonLayout,
    EmailPassword,
  },
  methods: {},
};
</script>
<style scoped></style>

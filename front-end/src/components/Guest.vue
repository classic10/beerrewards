<template>
  <common-layout heading="Enter as guest" :subHeading="subHeadingText">
    <component :is="child_component"></component>
  </common-layout>
</template>

<script>
import CommonLayout from "@/components/CommonLayout.vue";
import Dob from "@/components/DOB.vue";

export default {
  name: "Guest",
  data() {
    return {
      subHeadingText: "WHAT YEAR \n WERE YOU BORN ?",
      child_component: "Dob",
    };
  },
  components: {
    "common-layout": CommonLayout,
    Dob,
  },
};
</script>
<style scoped></style>

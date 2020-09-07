<template>
<!-- Common layout component -->
  <div class="card text-center">
    <div class="card-header ">
      {{ heading }}
      <div class="sub-header">{{ subHeading }}</div>
    </div>
    <div class="card-body">
      <slot></slot>
    </div>
  </div>
</template>
<script>
export default {
  name: "CommonLayout",
  props: ["heading", "subHeading", "showForgotPassword", "onContinue"],
  components: {},
};
</script>
<style scoped>
.common-container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  background-color: grey;
  width: 45%;
  height: 100%;
  padding: 10px;
}
.card {
  height: 75% !important;
  width: 55%;
  border: none;
}
.card-header {
  background-color: white;
  border: none;
  font-size: 10px;
  padding: 3px;
  font-weight: lighter;
}
.sub-header {
  font-weight: 800;
  font-size: 14px !important;
  white-space: pre;
}
.card-body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 75%;
  padding: 0px;
  flex-direction: column;
}
.card-footer {
  background-color: white;
  border: none;
}
</style>

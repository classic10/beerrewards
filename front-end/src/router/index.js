import { createRouter, createWebHistory } from "vue-router";

const routes = [
  {
    path: "/",
    name: "Login",
    component: () => import("../views/login.vue"),
  },
  {
    path: "/home",
    name: "Home",
    beforeRouteEnter(to, from, next) {
      if (!localStorage.getItem("accessToken")) {
        // User not logged in
        next("/");
      } else {
        next();
      }
    },
    component: () => import("../views/Home.vue"),
  },
  {
    path: "/register",
    name: "NewRegister",
    component: () => import("../views/NewRegister.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;

<template>
  <div id="divOuter">
    <div id="divInner">
      <input
        id="partitioned"
        v-model="year"
        type="text"
        maxlength="4"
        placeholder="0000"
      />
    </div>
  </div>
  <div class="footer-container">
    <button class="btn btn-dark .btn-lg" :onClick="onContinue">CONTINUE</button>
  </div>
</template>

<script>
export default {
  name: "Dob",
  data() {
    return {
      year: null,
    };
  },
  components: {},
  methods: {
    onContinue() {
      //method to verify if the birth year entered by the user is 18 year or over
      const yearParsed = parseInt(this.year);
      if (!isNaN(yearParsed) && yearParsed.toString().length == 4) {
        const currentYear = new Date().getFullYear();
        if (yearParsed < 1900 || yearParsed > currentYear) {
          //verifies the year entered is b/w the 1900 -current year
          alert("Must enter a year between 1900 - 2020");
        } else if (currentYear - yearParsed < 18) {
          //Shows alert message if the age is smaller than 18.
          alert("Must be 18 years old or over");
        } else {
          //redirects to home page
          localStorage.setItem("accessType", "guestUser");
          window.location.href = "/home";
        }
      } else {
        alert("Please enter a valid year");
      }
    },
  },
};
</script>
<style scoped>
#partitioned {
  letter-spacing: 23px;
  border: 0;
  background-image: linear-gradient(
    to left,
    black 70%,
    rgba(255, 255, 255, 0) 0%
  );
  background-position: bottom;
  background-size: 50px 1px;
  background-repeat: repeat-x;
  background-position-x: 35px;
  width: 189px;
  min-width: 220px;
  font-size: xxx-large;
  font-weight: 700;
  outline: none;
  margin-bottom: 5px;
}

#divInner {
  left: 0;
  position: sticky;
}

#divOuter {
  width: 190px;
  overflow: hidden;
}

.btn {
  font-size: 10px;
  border-radius: 15px;
  padding: 4px 10px;
}
.footer-container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin: 10px;
  /* padding: 0px 65px; */
}
</style>

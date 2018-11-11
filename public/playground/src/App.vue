<template>
  <div id="app" class="container">
    <Landing @next-step="nextStep" v-if="step===1" />
    <StaticQuestions @next-step="nextStep" v-if="step===2" />
    <DynamicQuestions @next-step="nextStep" v-if="step===3" />
    <Outcome v-if="step===4" />
  </div>
</template>

<script>
// import bootstrap from "bootstrap";
import Landing from "./components/Landing.vue";
import StaticQuestions from "./components/StaticQuestions.vue";
import DynamicQuestions from "./components/DynamicQuestions.vue";
import Outcome from "./components/Outcome.vue";

export default {
  name: "app",
  components: {
    Landing,
    StaticQuestions,
    DynamicQuestions,
    Outcome
  },
  data() {
    return {
      step: 1
    }
  },
  methods: {
    nextStep() {
      this.step ++;
    }
  }
};
</script>

<style lang='scss'>
@font-face {
  font-family: 'Zpix';
  src: url('Zpix.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
@font-face {
  font-family: 'JF-Dot-Kappa-20-Bold';
  src: url('JF-Dot-Kappa-20-Bold.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

body {
  background-color: #f1f1f1;
}
.button {
  width: 120px;
  margin: 20px auto;
  position: relative;
  background-color: #fff;
  padding: 6px;
  font-size: 1.3em;
  font-family: "Zpix";
  display: block;
  border-radius: 4px;
  cursor: pointer;
  &:before {
    content: "";
    display: block;
    position: absolute;
    border-left: 2px solid #000;
    border-right: 2px solid #000;
    left: -2px;
    top: 4px;
    right: -2px;
    bottom: 4px;
  }
  &:after {
    content: "";
    display: block;
    position: absolute;
    border-top: 2px solid #000;
    border-bottom: 2px solid #000;
    left: 4px;
    top: -2px;
    right: 4px;
    bottom: -2px;
  }
  .dot {
    display: block;
    position: absolute;
    margin: 0;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    border: 3px solid;
    border-image: linear-gradient(#000, #000);
  }
}
</style>

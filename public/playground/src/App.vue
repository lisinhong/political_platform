<template>
  <div id="app" class="container">
    <transition mode="out-in">
      <Landing @next-step="nextStep" v-if="step===1" />
      <StaticQuestions 
      @next-step="nextStep"
      @get-dynamic-questions="getDynamicQuestions"
      v-if="step===2" />
      <DynamicQuestions 
      @next-step="nextStep"
      @get-result="getResult"
      :questions="dynamicQuestions" 
      v-if="step===3" />
      <Outcome :result="result" v-if="step===4" @play-again="playAgain" />
    </transition>
  </div>
</template>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
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
      step: 1,
      dynamicQuestions: [],
      result: []
    };
  },
  methods: {
    nextStep() {
      this.step++;
    },
    getDynamicQuestions(staticQuestions) {
      $.ajax({
        type: "POST",
        url: "/api/get_second_step_questions",
        data: staticQuestions,
        success: (result) => {
          // console.log(result);
          this.dynamicQuestions.push(result[0]); // 申論
          this.dynamicQuestions.push(result[4]); // 交叉詰問
          this.dynamicQuestions.push(result[7]); // 結論
        },
        error: (error) => {
          console.log(error);
        }
      });
    },
    getResult(dynamicQuestions) {
      console.log(dynamicQuestions)
      $.ajax({
        type: "POST",
        url: "/api/get_result",
        data: { data: dynamicQuestions },
        // data: { data: [1, 3, 4] },
        success: (result) => {
          console.log(result);
          this.result = result;
        },
        error: (error) => {
          console.log(error);
        }
      });
    },
    playAgain() {
      this.step = 1;
      this.dynamicQuestions = [];
    }
  }
};
</script>

<style lang='scss'>
@font-face {
  font-family: "Zpix";
  src: url("Zpix.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}
@font-face {
  font-family: "JF-Dot-Kappa-20-Bold";
  src: url("JF-Dot-Kappa-20-Bold.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}
@font-face {
  font-family: "JF-Dot-jiskan24h-2000";
  src: url("JF-Dot-jiskan24h-2000.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

* {
  box-sizing: border-box;
}
body {
  background-color: #f1f1f1;
  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, Geneva, "Heiti TC",
    "Microsoft JhengHei", sans-serif;
  font-size: 16px;
}
.button {
  width: 130px;
  margin: 20px auto;
  position: relative;
  background-color: #fff;
  padding: 6px;
  font-size: 1.2em;
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
.v-leave {
  opacity: 1;
}
.v-leave-active {
  transition: opacity 0.5s;
}
.v-leave-to {
  opacity: 0;
}
.v-enter {
  opacity: 0;
}
.v-enter-active {
  transition: opacity 0.5s;
}
.v-enter-to {
  opacity: 1;
}
</style>

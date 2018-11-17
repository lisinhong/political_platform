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
      :questions="dynamicQuestions" 
      v-if="step===3" />
      <Outcome v-if="step===4" @play-again="playAgain" />
    </transition>
  </div>
</template>

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
      //temporary
      dynamicQuestions: [
        {
          id: 13,
          p_type: 2,
          q_type: "申論",
          o_comment: "申論時間六分鐘，請候選人開始。",
          m_comment: "謝謝主持人，今天的辯論我想從_ _開始.....",
          option_a: "城市的願景",
          option_b: "地方人才外流的議題",
          option_c: "勞工應該要有的照護",
          option_d: "觀光發展",
          created_at: "2018-11-13T02:31:46.848Z",
          updated_at: "2018-11-13T02:31:46.848Z",
          option_a_key: 51,
          option_b_key: 52,
          option_c_key: 56,
          option_d_key: 64
        },
        {
          id: 5,
          p_type: 3,
          q_type: "交叉詰問",
          o_comment:
            "我想請教候選人，面臨國民競爭力下滑，請問在文教發展上有沒有什麼看法？",
          m_comment: "我覺得是這樣子啦！這個問題齁，要從_ _方面解決....",
          option_a: "國民義務教育",
          option_b: "地方體育發展",
          option_c: "地方文化保存",
          option_d: "完善文教相關法規",
          created_at: "2018-11-13T02:31:46.828Z",
          updated_at: "2018-11-13T02:31:46.828Z",
          option_a_key: 44,
          option_b_key: 45,
          option_c_key: 46,
          option_d_key: 57
        },
        {
          id: 9,
          p_type: 4,
          q_type: "結論",
          o_comment: "結論時間六分鐘，請候選人開始。",
          m_comment: "最後的結論，我想再次強調.....",
          option_a: "青壯年人口的失業率",
          option_b: "青年創新",
          option_c: "青年參政",
          option_d: "年輕人目前買房的困境",
          created_at: "2018-11-13T02:31:46.838Z",
          updated_at: "2018-11-13T02:31:46.838Z",
          option_a_key: 53,
          option_b_key: 54,
          option_c_key: 58,
          option_d_key: 61
        }
      ]
      //temporary
    };
  },
  methods: {
    nextStep() {
      this.step++;
    },
    getDynamicQuestions(staticQuestions) {
      console.log("getDynamicQuestions");
      // $.ajax({
      //   type: "POST",
      //   url: "/api/get_second_step_questions",
      //   data: staticQuestions,
      //   success: function(result) {
      //     console.log(JSON.stringify(result));
      // this.dynamicQuestions.push(result[0]); // 申論
      // this.dynamicQuestions.push(result[4]); // 交叉詰問
      // this.dynamicQuestions.push(result[8]); // 結論
      //   },
      //   error: function(error) {
      //     //handle the error
      //     console.log(error);
      //   }
      // });
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

* {
  box-sizing: border-box;
}
body {
  background-color: #f1f1f1;
  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, Geneva, "Heiti TC",
    "Microsoft JhengHei", sans-serif;
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

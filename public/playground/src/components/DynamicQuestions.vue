<template>
  <div id="dynamic-questions" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center row justify-content-center align-items-center">
        <div class="intro-text col-12">
          開始辯論！
        </div>
      </div>
    </div>
    <div class="question-wrapper col-12" v-if="showQuestion != null">
      <div class="question row justifyÍ-content-between align-items-center" 
        :class="`question-${question_index+1}`" 
        :key="question_index" 
        v-for="(question, question_index) in questions"
        v-if="showQuestion===(question_index+1)">
        <div class="title col-12">{{question_index+1}}. {{question.title}}</div>
        <div class="col-12 text-center">
          <img :src="require(`../../public/${question.img}`)" alt="image">
        </div>
        <div class="options col-12">
          <div class="row justify-content-between">
            <div class="col-12 col-md-6" :key="option_index" v-for="(option, option_index) in question.options">
              <input type="radio" :name="`question-${question_index+1}`" :id="`option-${option_index+1}`">
              <label class="option" :class="`option-${option_index+1}`" :for="`option-${option_index+1}`">
                {{option}}
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>  
  </div>
</template>

<script>
export default {
  name: "DynamicQuestions",
  data() {
    return {
      showIntro: true,
      showQuestion: null,
      questions: [
        {
          title: "題目",
          options: ["(A) 選項", "(B) 選項", "(C) 選項", "(D) 選項"],
          img: "debate.jpg"
        },
        {
          title: "題目",
          options: ["(A) 選項", "(B) 選項", "(C) 選項", "(D) 選項"],
          img: "debate.jpg"
        },
        {
          title: "題目",
          options: ["(A) 選項", "(B) 選項", "(C) 選項", "(D) 選項"],
          img: "debate.jpg"
        }
      ]
    };
  },
  mounted() {
    setTimeout(() => {
      this.showIntro = false;
      this.showQuestion = 1;
    }, 3000);
  }
};
</script>

<style lang='scss' scoped>
#dynamic-questions {
  min-height: 100vh;
}
.intro-wrapper,
.intro {
  height: 100vh;
}
.intro-text {
  font-style: italic;
  font-family: "JF-Dot-Kappa-20-Bold";
  font-size: 5em;
  color: #c2502a;
  letter-spacing: 0.2em;
  opacity: 0;
  animation: fadeOut 2s linear;
}
.question-wrapper {
  .question {
    min-height: 100vh;
  }
  .title {
    font-family: "Zpix";
    font-size: 1.2em;
  }
  .options {
    input[type="radio"] {
      display: none;
      &:checked + .option {
        border: 2px solid #ff0000;
        box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
      }
    }
  }
  .option {
    display: block;
    border: 2px solid;
    background-color: #fff;
    padding: 15px;
    margin: 10px 0;
    letter-spacing: 0.4px;
    cursor: pointer;
    font-family: "JF-Dot-Kappa-20-Bold";
  }
}

@keyframes fadeOut {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>

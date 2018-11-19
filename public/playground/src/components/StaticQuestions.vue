<template>
  <div id="static-questions" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center">
        <div class="intro-text col-12">
          <p>2018年8月</p>
          <p>某太平洋島國上</p>
          <p>受夠了兩大勢力的互相鬥爭</p>
          <p>受夠了充滿幹話的政治環境</p>
          <p>年輕世代群起奮起</p>
          <p>開啟了大政治時代</p>
          <p>也醞釀著一個議員的誕生</p>
          <p>......</p>
        </div>
      </div>
    </div>
    <transition mode="out-in">
      <div class="question-wrapper col-12" v-if="showQuestion != null">
        <transition mode="out-in">
          <div class="question row justifyÍ-content-between align-items-center" 
            :class="`question-${question_index+1}`" 
            :key="question_index" 
            v-for="(question, question_index) in questions"
            v-if="showQuestion===(question_index+1)">
            <div class="title col-12">{{question_index+1}}. {{question.title}}</div>
            <div class="middle col-12 text-center">
              <img :src="require(`../../public/${question.img}`)" alt="image">
              <div class="progress-line-pc">
                <div class="step-pc" :class="{'showed': showQuestion >= step}" :key="step" v-for="step in 6">{{step}}</div>
              </div>
            </div>
            <div class="options col-12">
              <div class="row justify-content-between">
                <div class="col-12 col-md-6" :key="option_index" v-for="(option, option_index) in question.options">
                  <input type="radio" :name="`question-${question_index+1}`" :id="`option-${option_index+1}`" :value="option.type" v-model="choosed[question_index]">
                  <label class="option" :class="`option-${option_index+1}`" :for="`option-${option_index+1}`">
                    {{option.text}}
                  </label>
                </div>
              </div>
            </div>
            <div class="progress-line-mobile col-12">
              <div class="step-mobile" :class="{'showed': showQuestion >= step}" :key="step" v-for="step in 6">{{step}}</div>
            </div>
          </div>
        </transition>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: "StaticQuestions",
  data() {
    return {
      showIntro: true,
      showQuestion: null,
      questions: [
        {
          title: "初來乍到！要去哪拜碼頭呢？",
          options: [
            {
              text: "(A) 北漂青年",
              type: 4
            },
            {
              text: "(B) 地方文史工作者",
              type: 3
            },
            {
              text: "(C) 縣市政府內的公務員",
              type: 0
            },
            {
              text: "(D) 菜農",
              type: 2
            }
          ],
          img: "q1.png"
        },
        {
          title: "收集完民意了！ 選一種方式宣傳政見吧！",
          options: [
            {
              text: "(A) 進入市場掃街拍肩",
              type: 2
            },
            {
              text: "(B) 在長秒數紅綠燈的街口",
              type: 1
            },
            {
              text: "(C) 和網紅直播與網友對談",
              type: 5
            },
            {
              text: "(D) 擔任藝文活動嘉賓",
              type: 3
            }
          ],
          img: "q2.png"
        },
        {
          title: "國際性活動即將到來！快提出政見乘勝追擊",
          options: [
            {
              text: "(A) 與青年創新企業合作，打造新氣象",
              type: 4
            },
            {
              text: "(B) 整頓地方交通，與國際接軌",
              type: 1
            },
            {
              text: "(C) 提倡重大建設舉辦公聽會，充分了解各方意見",
              type: 5
            },
            {
              text: "(D) 要求公開重大工程支出表，避免納稅錢被浪費",
              type: 0
            }
          ],
          img: "q3.png"
        },
        {
          title: "遭遇口水戰！最痛恨哪種抹黑？",
          options: [
            {
              text: "(A) 初選豪灑五百億！青年參政淪口號！？",
              type: 4
            },
            {
              text: "(B) 交通補助不可行？對手痛批：政策買票",
              type: 1
            },
            {
              text: "(C) 公聽會談造假？網友爆卦：一切自導自演",
              type: 5
            },
            {
              text: "(D) 家世政商背景良好！？質疑選後官商勾結？",
              type: 0
            }
          ],
          img: "q4.png"
        },
        {
          title: "反擊吧！選擇盟友拒絕抹黑",
          options: [
            {
              text: "(A) 教師公會會長",
              type: 3
            },
            {
              text: "(B) 某知名經濟學教授",
              type: 2
            },
            {
              text: "(C) 網紅社運領袖",
              type: 5
            },
            {
              text: "(D) 高階縣市府主管",
              type: 0
            }
          ],
          img: "q5.png"
        },
        {
          title: "別打口水戰，有種來辯論！選擇議題回擊囉！",
          options: [
            {
              text: "(A) 沒有地方價值",
              type: 3
            },
            {
              text: "(B) 城市又老又窮",
              type: 2
            },
            {
              text: "(C) 青年北漂",
              type: 4
            },
            {
              text: "(D) 公車路線的規劃與收費方式",
              type: 1
            }
          ],
          img: "q6.png"
        }
      ],
      choosed: [],
      answers: {
        "0": 0,
        "1": 0,
        "2": 0,
        "3": 0,
        "4": 0,
        "5": 0
      }
    };
  },
  mounted() {
    setTimeout(() => {
      this.showIntro = false;
      this.showQuestion = 1;
    }, 1000);
  },
  beforeDestroy() {
    this.choosed.forEach(element => {
      this.answers[element]++;
    });
    this.$emit("get-dynamic-questions", this.answers);
  },
  watch: {
    choosed() {
      this.showQuestion++;
      if (this.showQuestion > 6) this.$emit("next-step");
    }
  }
};
</script>

<style lang='scss' scoped>
#static-questions {
  min-height: 100vh;
  padding: 10px 0;
}
.intro-wrapper {
  perspective: 200px;
  height: 100vh;
}
.intro {
  overflow: hidden;
  transform-style: preserve-3d;
  transform-origin: 50% 100%;
  transform: rotateX(12deg);
  width: 100%;
  height: 100%;
  position: relative;
}
.intro-text {
  font-family: "Zpix";
  color: #e7c34e;
  font-size: 2.8em;
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  animation: scroll 10s linear;
}
.question-wrapper {
  .question {
    min-height: 100vh;
  }
  .title {
    font-family: "Zpix";
    font-size: 1.2em;
  }
  .middle {
    position: relative;
  }
  .progress-line-mobile {
    display: none;
  }
  .progress-line-pc {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    position: absolute;
    top: 0;
    right: 0;
  }
  .step-pc {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
    background-color: #cfcfcf;
    position: relative;
    &.showed {
      background-color: #e2ba3d;
    }
    &:not(:first-child):before {
      content: "";
      display: block;
      position: absolute;
      height: 24px;
      width: 4px;
      top: -24px;
      left: 50%;
      transform: translateX(-50%);
      background-color: inherit;
    }
  }
  .options {
    input[type="radio"] {
      display: none;
      &:checked + .option {
        border: 2px solid #ff0000;
        color: #ff0000;
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

@keyframes scroll {
  0% {
    top: 100%;
  }
  100% {
    top: -100%;
  }
}

@media screen and (max-width: 767px) {
  .intro-text {
    font-size: 9vw;
  }
  .question-wrapper {
    .option {
      font-size: 0.8em;
      padding: 10px;
      margin: 5px 0;
    }
    .progress-line-pc {
      display: none;
    }
    .progress-line-mobile {
      width: 100%;
      height: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .step-mobile {
        width: 25px;
        height: 25px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #fff;
        background-color: #cfcfcf;
        position: relative;
        font-size: 4vw;
        &.showed {
          background-color: #e2ba3d;
        }
        &:not(:first-child):before {
          content: "";
          display: block;
          position: absolute;
          height: 4px;
          width: calc((100vw - 180px)/5);
          top: 50%;
          right: 25px;
          transform: translateY(-50%);
          background-color: inherit;
        }
      }
    }
  }
}
// @media screen and (max-width: 412px) {
//   .intro-text {
//     font-size: 2em;
//   }
// }
</style>

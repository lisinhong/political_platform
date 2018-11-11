<template>
  <div id="static-questions" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center row justify-content-center align-items-center">
        <div class="intro-text col-12">
          <p>2018年8月，某太平洋島國上</p>
          <p>受夠了兩大勢力的互相鬥爭</p>
          <p>受夠了充滿幹話的政治環境</p>
          <p>年輕世代群起奮起！</p>
          <p>開啟了大政治時代</p>
          <p>也醞釀著一個議員的誕生...</p>
        </div>
      </div>
    </div>
    <div class="question-wrapper col-12">
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
  name: "StaticQuestions",
  data() {
    return {
      showIntro: true,
      showQuestion: null,
      questions: [
        {
          title: "剛參選，首先要先了解民意，你決定先拜訪誰呢？",
          options: [
            "(A) 即將畢業的大學生們",
            "(B) 地方文史工作者",
            "(C) 縣市政府內的公務員",
            "(D) 商圈內店家"
          ],
          img: "q1.jpg"
        },
        {
          title:
            "終於收集完民意了！要開始向大家宣傳政見，你決定要用什麼方式宣傳？",
          options: [
            "(A) 進入市場掃街拜票",
            "(B) 在長秒數紅綠燈的街口",
            "(C) 定期直播與網友對談",
            "(D) 擔任藝文活動嘉賓"
          ],
          img: "q2.jpg"
        },
        {
          title:
            "你得知，所在縣市不久後，即將舉辦國際性活動，身為候選人的你，決定提出什麼政見乘勝追擊呢？",
          options: [
            "(A) 與青年創新企業合作，打造新氣象",
            "(B) 整頓地方交通，與國際接軌",
            "(C) 倡重大建設舉辦公聽會，充分了解各方意見",
            "(D) 嚴格監督活動預算，避免納稅錢被浪費"
          ],
          img: "q3.jpg"
        },
        {
          title: "遇到政敵抹黑了！你最不希望被怎麼打擊呢？",
          options: [
            "(A) 驚爆身世疑為政二代！？強調青年參政令人起疑",
            "(B) 交通規劃紙上空談？專家表示：政策買票",
            "(C) 全民參政攏是假？友人表示：已佈好暗樁",
            "(D) 家世政商背景良好！？質疑選後官商勾結？"
          ],
          img: "q4.jpg"
        },
        {
          title: "反擊吧！你覺得誰替你背書最有利呢？",
          options: [
            "(A) 具有教學權威的教師公會",
            "(B) 以嚴謹經濟學理論背書的經濟學家",
            "(C) 有極高聲量的社運領袖",
            "(D) 多年公務經驗的高階縣市府主管"
          ],
          img: "q5.jpg"
        },
        {
          title: "正面硬上你的政敵！要從哪個議題切入呢？",
          options: [
            "(A) 地方文化的廢存",
            "(B) 活化地方商圈",
            "(C) 年輕世代的高失業率",
            "(D) 公車路線的規劃與收費方式"
          ],
          img: "q6.jpg"
        }
      ]
    };
  },
  mounted() {
    setTimeout(() => {
      this.showIntro = false;
      this.showQuestion = 1;
    }, 10000);
  }
};
</script>

<style lang='scss' scoped>
#static-questions {
  min-height: 100vh;
}
.intro-wrapper {
  perspective: 150px;
  height: 100vh;
}
.intro {
  overflow: hidden;
  transform-style: preserve-3d;
  transform: rotateX(10deg);
  width: 100%;
  height: 100%;
  position: relative;
}
.intro-text {
  font-family: "Zpix";
  color: #e7c34e;
  font-size: 40px;
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

@keyframes scroll {
  0% {
    top: 100%;
  }
  100% {
    top: -100%;
  }
}
</style>

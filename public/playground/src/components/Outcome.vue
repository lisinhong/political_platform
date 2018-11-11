<template>
  <div id="outcome" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center row justify-content-center align-items-center">
        <div class="intro-text col-12">
          <p>2018年11月底</p>
          <p>某太平洋島國上</p>
          <p>眼前所見</p>
          <p>是一張張殷切期待的臉孔</p>
          <p>螢幕上</p>
          <p>各家新聞忙著報導一位政治素人</p>
          <p>從血戰下生存的傳奇</p>
          <p>這是新時代下</p>
          <p>一個議員的誕生</p>
          <p>而後，改變才正要開始</p>
          <p>......</p>
        </div>
      </div>
    </div>
    <div class="outcome-wrapper col-12" v-if="showOutcome">
      <div class="outcome row justify-content-center align-items-center">
        <p class="title col-12 text-center">結果出爐！你跟這位議員關心的議題最相近</p>
        <div class="card-wrapper col-3">
          <input type="checkbox" id="flip-card">
          <div class="card-inner row justify-content-center">
            <div class="card card-front col-12">
              <div class="row justify-content-center align-items-center">
                <div class="photo-wrapper col-12 text-center">
                  <div class="photo"></div>
                </div>
                <div class="name col-12 text-center">姓名</div>
                <div class="radar col-6"></div>
                <div class="policies col-6">
                  <p class="policy">政見</p>
                  <p class="policy">政見</p>
                  <p class="policy">政見</p>
                </div>
              </div>
            </div>
            <div class="card card-back col-12">
              <div class="row justify-content-center align-items-center">
                <div class="col-12">
                  <div class="row align-items-center">
                    <div class="number-wrapper col-4 text-center">
                    <div class="number">87</div>
                  </div>
                  <div class="name col-8">姓名</div>
                  </div>
                </div>
                <div class="photo-wrapper col-12 text-center">
                  <div class="photo"></div>
                </div>
                <div class="slogan col-12">
                  懇請支持，搶救
                </div>
                <div class="policies col-12">
                  <p class="policy">政見</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12"></div>
        <div class="col-3">
          <div class="row justify-content-between align-items-center">
            <div class="col-12 col-md-6 text-center">
              <label class="button" for="flip-card">
                翻面
                <span class="dot"></span>
              </label>
            </div>
            <div class="col-12 col-md-6 text-center">
              <div class="button">
                再玩一次
                <span class="dot"></span>                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Outcome",
  data() {
    return {
      showIntro: true,
      showOutcome: false
    };
  },
  mounted() {
    setTimeout(() => {
      this.showIntro = false;
      this.showOutcome = true;
    }, 10000);
  }
};
</script>

<style lang='scss' scoped>
#outcome {
  min-height: 100vh;
}
.btn-check {
  border: none;
  background: none;
  cursor: pointer;
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
.outcome-wrapper {
  min-height: 100vh;
  .title {
    font-family: "Zpix";
    font-size: 2.5em;
  }
}
.card-wrapper {
  perspective: 1000px;
  height: 450px;
  .card-inner {
    position: relative;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    transition: transform 0.6s;
    transform-style: preserve-3d;
    height: 100%;
  }
  .card {
    border: 2px solid;
    font-family: "Zpix";
    padding: 16px;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    backface-visibility: hidden;
    .photo {
      display: inline-block;
      width: 200px;
      height: 200px;
      border-radius: 50%;
      background: gray;
      margin-bottom: 10px;
    }
    .name {
      margin-bottom: 10px;
      font-size: 1.2em;
    }
    .number {
      border: 2px solid #ff0000;
      color: #ff0000;
      font-size: 1.4em;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
  .card-front {
    z-index: 10;
  }
  .card-back {
    transform: rotateY(180deg);
    z-index: 1;
    .name {
      margin: 0;
    }
  }
}
#flip-card {
  display: none;
  &:checked {
    + .card-inner {
      transform: rotateY(180deg);
    }
  }
}

@keyframes scroll {
  0% {
    top: 100%;
  }
  100% {
    top: -170%;
  }
}
</style>

<template>
  <div id="landing" class="row justify-content-center align-items-center">
    <div class="pre-game">
      <div class="title">
        <img src="../../public/title.png" alt="title">
      </div>
      <div class="slogan text-right">
        11/24（週六）回家投票
      </div>
      <div class="start text-center">
        <!-- <img src="../../public/start.png" alt="start"> -->
        <div class="button" @click="nextStep">
          開始遊戲
          <span class="dot"></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Landing",
  methods: {
    nextStep() {
      this.$emit('next-step');
    }
  }
};
</script>

<style lang='scss' scoped>
#landing {
  min-height: 100vh;
  padding: 50px;
}
.pre-game {
  width: 375px;
}
.slogan {
  font-family: "JF-Dot-Kappa-20-Bold";
  margin-top: 10px;
  margin-bottom: 20px;
  letter-spacing: 2px;
}
.start img {
  cursor: pointer;
}
</style>

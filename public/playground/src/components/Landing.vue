<template>
  <div id="landing" class="row justify-content-center align-items-center">
    <div class="pre-game">
      <div class="title">
        <img src="../../public/title.png" alt="title">
      </div>
      <div class="slogan text-right">
        第一次參選就上手！<br>
        如果參政，你會是哪個議員？
      </div>
      <div class="start text-center">
        <!-- <img src="../../public/start.png" alt="start"> -->
        <div class="button" @click="nextStep">
          開始參選
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
      this.$emit("next-step");
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
  max-width: 100%;
}
.slogan {
  font-family: "Zpix";
  margin-top: 10px;
  margin-bottom: 40px;
}
.title {
  img {
    max-width: 100%;
  }
}

@media screen and (max-width: 420px) {
  .slogan {
    font-size: 4.4vw;
  }
}
</style>

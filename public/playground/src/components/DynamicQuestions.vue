<template>
  <div id="dynamic-questions" class="row">
    <transition mode="out-in">
      <div class="intro-wrapper col-12" v-if="showIntro">
        <div class="intro text-center row justify-content-center align-items-center">
          <div class="intro-text col-12">開始辯論</div>
        </div>
      </div>
      <div class="slot-wrapper col-12">
        <transition mode="out-in">
          <div class="slot row align-items-between"
            :class="`slot-${slot_index+1}`"
            :key="slot_index"
            v-for="(slot, slot_index) in slots"
            v-if="showSlot===(slot_index+1)">
            <div class="title col-12">{{slot_index+1}}. {{slot}}</div>
            <div class="dialogs col-12">
              <div class="dialog dialog-host" v-if="showSlot !== 2">
                <p class="dialog-text">{{questions[slot_index].o_comment}}</p>
              </div>
              <div class="dialog dialog-opponent text-right" v-if="showSlot === 2">
                <p class="dialog-text text-left">{{questions[slot_index].o_comment}}</p>
                <img src="../../public/character2.png" alt="character2">
              </div>
              <div class="dialog dialog-user">
                <p class="dialog-text">{{questions[slot_index].m_comment}}</p>
                <img src="../../public/character1.png" alt="character1">
              </div>
            </div>
            <div class="options col-12">
              <div class="row justify-content-between">
                <div class="col-12 col-md-6">
                  <input type="radio" :name="`slot-${slot_index+1}`" id="option-a" 
                  :value="questions[slot_index].option_a_key"
                  v-model="choosed[slot_index]">
                  <label for="option-a" class="option option-a">
                    (A) {{questions[slot_index].option_a}}
                  </label>
                </div>
                <div class="col-12 col-md-6">
                  <input type="radio" :name="`slot-${slot_index+1}`" id="option-b" 
                  :value="questions[slot_index].option_b_key"
                  v-model="choosed[slot_index]">
                  <label for="option-b" class="option option-b">
                    (B) {{questions[slot_index].option_b}}
                  </label>
                </div>
                <div class="col-12 col-md-6">
                  <input type="radio" :name="`slot-${slot_index+1}`" id="option-c" 
                  :value="questions[slot_index].option_c_key"
                  v-model="choosed[slot_index]">
                  <label for="option-c" class="option option-c">
                    (C) {{questions[slot_index].option_c}}
                  </label>
                </div>
                <div class="col-12 col-md-6">
                  <input type="radio" :name="`slot-${slot_index+1}`" id="option-d" 
                  :value="questions[slot_index].option_d_key"
                  v-model="choosed[slot_index]">
                  <label for="option-d" class="option option-d">
                    (D) {{questions[slot_index].option_d}}
                  </label>
                </div>
              </div>
            </div>
          </div>
        </transition>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: "DynamicQuestions",
  data() {
    return {
      showIntro: true,
      showSlot: null,
      slots: ["申論", "交叉詰問", "結論"],
      choosed: []
    };
  },
  props: ["questions"],
  mounted() {
    setTimeout(() => {
      this.showIntro = false;
      this.showSlot = 1;
    }, 2000);
  },
  beforeDestroy() {
    this.$emit('get-result', this.choosed);
  },
  watch: {
    choosed() {
      this.showSlot++;
      if (this.showSlot > 3) this.$emit("next-step");
    }
  }
};
</script>

<style lang='scss' scoped>
#dynamic-questions {
  min-height: 100vh;
  padding: 10px 0;
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
  animation: twinkling 2s linear;
}
.slot-wrapper {
  .slot {
    min-height: 100vh;
  }
  .title {
    font-family: "Zpix";
    font-size: 1.2em;
  }
  .dialogs {
    position: relative;
    min-height: 400px;
  }
  .dialog {
    position: absolute;
    &.dialog-host {
      right: 100px;
      top: 0;
      animation: fadeIn 1s linear;
      &:before {
        content: "主持人";
        display: inline-block;
        position: relative;
        top: -2px;
        left: 0;
        color: #fff;
        background-color: #2a2a2a;
        padding: 4px 15px;
        font-size: 0.6em;
      }
    }
    &.dialog-opponent {
      right: 100px;
      top: 0;
      animation: fadeIn 1s linear;
      .dialog-text {
        right: 10px;
        &:before {
          content: "";
          display: block;
          position: absolute;
          border-right: 15px solid #2a2a2a;
          border-bottom: 20px solid transparent;
          bottom: -20px;
          right: 40px;
        }
      }
    }
    &.dialog-user {
      bottom: 0;
      left: 100px;
      animation: fadeIn 2.5s linear;
      .dialog-text {
        left: 30px;
        &:before {
          content: "";
          display: block;
          position: absolute;
          border-left: 15px solid #2a2a2a;
          border-bottom: 20px solid transparent;
          bottom: -20px;
          left: 70px;
        }
      }
    }
    .dialog-text {
      position: relative;
      background-color: #2a2a2a;
      color: #fff;
      padding: 15px;
      margin: 0;
      margin-bottom: 30px;
      max-width: 40vw;
    }
  }
  .options {
    height: min-content;
    animation: fadeIn 3.5s linear;
    input[type="radio"] {
      display: none;
      &:checked + .option {
        border: 2px solid #ff0000;
        box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        color: #ff0000;
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
@media screen and (max-width: 767px) {
  .intro-text {
    font-size: 18vw;
  }
  .slot-wrapper {
    .dialog {
      &.dialog-host {
        right: 15px;
      }
      &.dialog-opponent {
        right: 15px;
        img {
          max-width: 40vw;
        }
      }
      &.dialog-user {
        left: 15px;
        img {
          max-width: 40vw;
        }
      }
      .dialog-text {
        font-size: 0.8em;
        padding: 10px;
      }
    }
    .option {
      font-size: 0.8em;
      padding: 10px;
      margin: 5px 0;
    }
  }
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
@keyframes twinkling {
  0% {
    opacity: 0;
  }
  25% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
  75% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
</style>

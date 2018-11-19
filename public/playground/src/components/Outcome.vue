<template>
  <div id="outcome" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center justify-content-center align-items-center">
        <div class="intro-text col-12">
          <p>2018年11月底</p>
          <p>某太平洋島國上</p>
          <p>眼前所見</p>
          <p>是一張張殷切期待的臉孔</p>
          <p>螢幕上，各家新聞忙著報導一位政治素人</p>
          <p>從血戰下生存的傳奇</p>
          <p>這是新時代下</p>
          <p>一個議員的誕生</p>
          <p>而後</p>
          <p>改變才正要開始</p>
          <p>......</p>
        </div>
      </div>
    </div>
    <transition name="fade">
      <div class="outcome-wrapper col-12" v-if="showOutcome">
        <div class="outcome row justify-content-center align-items-center">
          <p class="title col-12 text-center">結果出爐！你跟這位議員關心的議題最相近</p>
          <div class="card-wrapper col-10 col-sm-8 col-md-5 col-lg-4">
            <input type="checkbox" id="flip-card">
            <div class="card-inner row justify-content-center">
              <div class="card card-front col-12">
                <div class="row justify-content-center align-items-center">
                  <div class="photo-wrapper col-12 text-center">
                    <div class="photo" :style="{backgroundImage: `url(${fake_result[0].image_url})`}"></div>
                  </div>
                  <div class="name col-12 text-center">{{fake_result[0].name}}</div>
                  <div class="radar col-6">
                    <canvas id="radar" width="100" height="100"></canvas>
                  </div>
                  <div class="policies col-6">
                    <p class="policy" :key="index" v-for="(policy, index) in fake_result[1].slice(0, 3)">{{policy.description}}</p>
                    <p class="more-policy text-right">更多政見</p>
                  </div>
                </div>
              </div>
              <div class="card card-back col-12">
                <div class="row justify-content-center align-items-center">
                  <div class="col-12">
                    <div class="card-back-header row align-items-center">
                      <div class="number-wrapper text-center">
                        <div class="number">{{Math.floor((Math.random() * 10) + 1)}}</div>
                      </div>
                    <div class="name col-12 text-center">{{user_name}}</div>
                    </div>
                  </div>
                  <div class="photo-wrapper col-12 text-center">
                    <div class="photo" :style="{backgroundImage: `url(${user_avatar_url})`}"></div>
                  </div>
                  <div class="slogan col-12 text-center">懇請支持</div>
                  <div class="slogan col-12 text-center">搶救</div>
                  <div class="slogan col-12 text-center">{{user_name}}</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12">
            <div class="row justify-content-center">
              <div class="col-10 col-sm-8 col-md-5 col-lg-4">
                <div class="row justify-content-between align-items-center">
                  <div class="col-6 text-center">
                    <label class="button" for="flip-card">
                      翻面
                      <span class="dot"></span>
                    </label>
                  </div>
                  <div class="col-6 text-center">
                    <div class="button">
                      分享
                      <span class="dot"></span>                
                    </div>
                  </div>
                  <div class="col-12 text-center">
                    <div class="button" @click="playAgain">
                      再玩一次
                      <span class="dot"></span>                
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
      </div>
    </transition>
  </div>
</template>

<script>
import Chart from "chart.js";
import 'bootstrap';

export default {
  name: "Outcome",
  data() {
    return {
      showIntro: true,
      showOutcome: false,
      fake_result: [
        {
          id: 25,
          name: "蘇世岳",
          region: "03 八德區",
          party: "無黨籍",
          age: 0,
          gender: 0,
          city: "桃園市",
          birth: null,
          school: null,
          experience: null,
          created_at: "2018-10-28T10:19:46.518Z",
          updated_at: "2018-11-04T13:17:45.232Z",
          image_url:
            "https://election.storm.mg/uploads/images/4ad40fb935db3a3e3664b142fda03fb6.jpg"
        },
        [
          {
            id: 17,
            description:
              "督促大湳滯洪池、興豐路排水改善工程儘速完成，完善雨水下水道，解決長年積水問題。\n",
            politician_id: 25,
            created_at: "2018-10-28T10:19:46.686Z",
            updated_at: "2018-11-06T10:07:28.789Z",
            first_type: "0"
          },
          {
            id: 1031,
            description:
              "增加幼兒園招生名額；爭取補助幼兒園安裝CO2及PM2.5室內空氣監測設備。",
            politician_id: 25,
            created_at: "2018-11-06T10:02:14.882Z",
            updated_at: "2018-11-11T13:15:19.599Z",
            first_type: "3"
          },
          {
            id: 15,
            description:
              "督促八德公托中心、瑞泰公托中心、廣興公托中心，如實如期完工，落實在地公托。\n",
            politician_id: 25,
            created_at: "2018-10-28T10:19:46.643Z",
            updated_at: "2018-11-11T13:15:19.631Z",
            first_type: "3"
          },
          {
            id: 16,
            description: "監督鐵路地下化儘速動工，打開八德對外交通瓶頸。\n",
            politician_id: 25,
            created_at: "2018-10-28T10:19:46.664Z",
            updated_at: "2018-11-11T13:15:19.682Z",
            first_type: "1"
          },
          {
            id: 1032,
            description:
              "爭取各國中、國小教室儘速裝設冷氣；建置智慧校園數位學堂；監督八德國小校舍整建及八德國中活動中心改善。",
            politician_id: 25,
            created_at: "2018-11-06T10:02:32.240Z",
            updated_at: "2018-11-11T13:15:19.780Z",
            first_type: "3"
          },
          {
            id: 1033,
            description:
              "爭取在八德擴大計畫區設置八德綜合中學，包括高中部及高職部，便利在地升學。",
            politician_id: 25,
            created_at: "2018-11-06T10:02:50.986Z",
            updated_at: "2018-11-11T13:15:19.810Z",
            first_type: "3"
          },
          {
            id: 1034,
            description:
              "爭取在八德擴大計畫區設置八德綜合中學，包括高中部及高職部，便利在地升學。",
            politician_id: 25,
            created_at: "2018-11-06T10:03:11.179Z",
            updated_at: "2018-11-11T13:15:19.854Z",
            first_type: "3"
          },
          {
            id: 1035,
            description:
              "督促捷運綠線如期動工，妥善規劃替代疏運路線，避免交通黑暗期。",
            politician_id: 25,
            created_at: "2018-11-06T10:04:31.560Z",
            updated_at: "2018-11-11T13:15:19.889Z",
            first_type: "1"
          },
          {
            id: 1036,
            description:
              "爭取以豐德路延伸增設國道三號八德第二交流道，帶動八德擴大計畫區發展。",
            politician_id: 25,
            created_at: "2018-11-06T10:04:50.630Z",
            updated_at: "2018-11-11T13:15:19.921Z",
            first_type: "1"
          },
          {
            id: 1037,
            description:
              "增設YouBike租賃站；建置智慧型公車系統，提升公車到站準點率。",
            politician_id: 25,
            created_at: "2018-11-06T10:05:13.717Z",
            updated_at: "2018-11-11T13:15:19.954Z",
            first_type: "1"
          },
          {
            id: 1038,
            description: "爭取再增設一所日間照顧中心，減輕家庭照護壓力。",
            politician_id: 25,
            created_at: "2018-11-06T10:05:35.474Z",
            updated_at: "2018-11-11T13:15:19.986Z",
            first_type: "3"
          },
          {
            id: 1039,
            description:
              "督促八德國民運動中心、大湳森林公園、八塊厝故事館、北區青少年活動中心、興豐親子館、兒童玩具圖書館儘速完工；增加天幕籃球場、寵物公園、親子共樂遊憩設施。",
            politician_id: 25,
            created_at: "2018-11-06T10:05:50.514Z",
            updated_at: "2018-11-11T13:15:20.010Z",
            first_type: "3"
          },
          {
            id: 1040,
            description:
              "督促儘速規劃完成公共汙水下水道，提升用戶普及率，同時完成電纜地下化。",
            politician_id: 25,
            created_at: "2018-11-06T10:06:14.765Z",
            updated_at: "2018-11-06T10:06:14.765Z",
            first_type: "0"
          }
        ],
        {
          id: 7,
          name: "李信宏",
          email: "alan12141020@gmail.com",
          affairs: 2,
          transportation: 1,
          economic: 1,
          education: 2,
          teen: 0,
          citizen: 0,
          created_at: "2018-11-18T09:52:49.054Z",
          updated_at: "2018-11-18T09:52:49.054Z",
          u_id: "1901888149900371"
        }
      ],
      user_name: "",
      user_avatar_url: ""
    };
  },
  props: ["result"],
  mounted() {
    // this.user_name = document.querySelector('#name').value;
    this.user_name = '劉義維';
    // this.user_avatar_url = document.querySelector('#avatar').value;
    this.user_avatar_url = 'https://scontent.ftpe8-4.fna.fbcdn.net/v/t1.0-9/37671776_2078680108811872_5005884623729721344_n.jpg?_nc_cat=110&_nc_ht=scontent.ftpe8-4.fna&oh=04cf8e9f54091b66608b07773ba85ad5&oe=5C7DBF34';

    setTimeout(() => {
      this.showIntro = false;
      this.showOutcome = true;
    }, 1000);
    setTimeout(() => {
      const affairs = this.fake_result[2].affairs;
      const transportation = this.fake_result[2].transportation;
      const education = this.fake_result[2].education;
      const teen = this.fake_result[2].teen;
      const citizen = this.fake_result[2].citizen;
      const economic = this.fake_result[2].economic;
      const ctx = document.getElementById("radar");
      new Chart(ctx, {
        type: "radar",
        data: {
          labels: [
            "內政",
            "交通",
            ["教育", "文化"],
            ["青年", "發展"],
            ["公民", "政治"],
            "經濟"
          ],
          datasets: [
            {
              backgroundColor: "rgba(231,195,78,0.4)",
              data: [
                affairs,
                transportation,
                education,
                teen,
                citizen,
                economic
              ],
              borderWidth: 1,
              pointRadius: 0
            }
          ]
        },
        options: {
          tooltips: {
            enabled: false
          },
          legend: {
            display: false
          },
          scale: {
            ticks: {
              beginAtZero: true,
              maxTicksLimit: 4,
              min: 0,
              max: 4,
              stepSize: 2,
              display: false
            }
          }
        }
      });
    }, 1000);
  },
  methods: {
    playAgain() {
      this.$emit("play-again");
    }
  }
};
</script>

<style lang='scss' scoped>
#outcome {
  min-height: 100vh;
  padding: 10px 0;
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
  animation: scroll 12s linear;
}
.outcome-wrapper {
  min-height: 100vh;
  .title {
    font-family: "Zpix";
    font-size: 2.5em;
  }
}
.outcome {
  height: 100%;
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
    animation: flipCard 2.5s ease;
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
    .photo-wrapper {
      margin-top: 10px;
    }
    .photo {
      display: inline-block;
      width: 200px;
      height: 200px;
      border-radius: 50%;
      background: #7c7b79;
      background-repeat: no-repeat;
      background-position: center center;
      background-size: contain;
      border: 2px solid #7c7b79;
      margin-bottom: 10px;
    }
    .name {
      margin-bottom: 10px;
      font-size: 1.2em;
    }
    .policy {
      font-size: 0.6em;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    .slogan {
      color: red;
      font-size: 1.6em;
      text-shadow: -1px 0 #fff, 0 1px #fff, 1px 0 #fff, 0 -1px #fff;
      font-weight: 800;
      font-family: "JF-Dot-jiskan24h-2000";
    }
    .more-policy {
      color: #e7c34e;
      font-size: 0.6em;
      margin-right: 10px;
      cursor: pointer;
    }
    .number-wrapper {
      position: absolute;
      left: 15px;
      top: 0;
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
      background-color: #fff;
    }
  }
  #radar {
    width: 100%;
    height: auto;
  }
  .card-front {
    z-index: 10;
  }
  .card-back {
    transform: rotateY(180deg);
    z-index: 1;
    background: url(../assets/card.png) no-repeat center center;
    background-size: 110%;
    .name {
      margin: 0;
      color: #ff0000;
      font-size: 2em;
      text-shadow: -1px 0 #fff, 0 1px #fff, 1px 0 #fff, 0 -1px #fff;
      font-weight: 500;
      font-family: "JF-Dot-jiskan24h-2000";
    }
  }
  .card-back-header {
    position: relative;
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
@media screen and (max-width: 767px) {
  .outcome-wrapper {
    .title {
      font-size: 8vw;
    }
  }
  .intro-text {
    font-size: 8vw;
  }
  .button {
    font-size: 1em;
    width: 100px;
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
@keyframes flipCard {
  0% {
    transform: rotateY(0deg);
  }
  100% {
    transform: rotateY(1800deg);
  }
}
</style>

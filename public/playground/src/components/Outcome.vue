<template>
  <div id="outcome" class="row">
    <div class="intro-wrapper col-12" v-if="showIntro">
      <div class="intro text-center">
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
      <div class="col-12 text-center">
        <div class="button" @click="skipIntro">
          略過劇情
          <span class="dot"></span>
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
                    <div class="photo" :style="{backgroundImage: `url(${result[0].image_url})`}"></div>
                  </div>
                  <div class="name col-12 text-center">{{result[0].name}}</div>
                  <div class="radar col-6">
                    <canvas id="radar" width="100" height="100"></canvas>
                  </div>
                  <div class="policies col-6">
                    <p class="policy" :key="index" v-for="(policy, index) in result[1].slice(0, 3)">{{policy.description}}</p>
                    <p class="more-policy text-right" @click="morePolicyInfo">更多政見</p>
                  </div>
                </div>
              </div>
              <div class="card card-back col-12">
                <div class="row justify-content-center align-items-center">
                  <div class="col-12">
                    <div class="card-back-header row align-items-center">
                      <div class="number-wrapper text-center">
                        <div class="number">{{number}}</div>
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
                    <label class="button" for="flip-card" @click="showCardFront = !showCardFront">
                      翻面
                      <span class="dot"></span>
                    </label>
                  </div>
                  <div class="col-6 text-center" data-title="分享出去" data-img="" :data-url="shareUrl" :data-desc="shareDesc" data-via="">
                    <a rel="nofollow " data-site="facebook" class="ssb-icon ssb-facebook" onclick="return SocialShareButton.share(this);" title="Share to Facebook" href="#">
                      <div class="button">
                        分享
                        <span class="dot"></span>                
                      </div>
                    </a>
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
    <div class="modal fade policy-info" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table>
              <tr>
                <td class="text-center" rowspan="3">
                  <img src="../../public/stamp.png" alt="stamp">
                </td>
                <td class="text-center table-title table-head">姓名</td>
                <td>{{result[0].name}}</td>
              </tr>
              <tr>
                <td class="text-center table-title table-head">選區</td>
                <td>{{result[0].region}}</td>
              </tr>
              <tr>
                <td class="text-center table-title table-head">政黨</td>
                <td>{{result[0].party}}</td>
              </tr>
              <tr>
                <td class="text-center table-title">學歷</td>
                <td colspan="2">{{result[0].school}}</td>
              </tr>
              <tr>
                <td class="text-center table-title">經歷</td>
                <td colspan="2">{{result[0].experience}}</td>
              </tr>
              <tr>
                <td class="text-center table-title">政見</td>
                <td colspan="2">
                  <p :key="index" v-for="(policy, index) in result[1]">{{policy.description.trim()}}</p>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Chart from "chart.js";
import "bootstrap";
import $ from "jquery";

export default {
  name: "Outcome",
  data() {
    return {
      showIntro: true,
      showOutcome: false,
      showCardFront: null,
      shareUrl: "https://www.taiwanbunbun.com/result/1901888149900371",
      shareDesc: "",
      fake_result: [
        {
          id: 675,
          name: "陳義洲",
          region: "02 內湖區、南港區",
          party: "中國國民黨",
          age: 65,
          gender: 0,
          city: "臺北市",
          birth: "1952-09-01T00:00:00.000Z",
          school:
            "內湖國小  \n方濟中學 \n基隆高中\n淡江大學國貿系畢業  \n美國舊金山大學碩士",
          experience:
            "現任台北市議員  \n文湖、碧湖、麗山國小家長會顧問  \n麗山高中家長會副會長   \n內湖登山會會員\n救國團內湖區團委會諮詢委員  \n國民黨內湖區黨部委員  \n內湖區晨泳會副會長  \n內湖獅子會榮譽理事長",
          created_at: "2018-10-28T10:21:15.746Z",
          updated_at: "2018-11-04T06:31:42.784Z",
          image_url: "https://election.storm.mg/uploads/images/1029.jpg"
        },
        [
          {
            id: 312,
            description: "●幫助基河國宅每戶房價降價退費約150萬元 \n",
            politician_id: 675,
            created_at: "2018-10-28T10:21:15.882Z",
            updated_at: "2018-11-18T15:34:44.516Z",
            first_type: "0"
          },
          {
            id: 2620,
            description: "●爭取碧湖國小新建工程2億，興建東湖國小地下停車場 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:30:52.751Z",
            updated_at: "2018-11-18T15:34:44.541Z",
            first_type: "1"
          },
          {
            id: 2621,
            description:
              "●爭取南港區舊莊、九如、中研里訂定新的垃圾掩埋場回饋辦法降低水費及電費……等等 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:00.883Z",
            updated_at: "2018-11-18T15:34:44.563Z",
            first_type: "0"
          },
          {
            id: 2622,
            description: "●為解決東湖水患，爭取四億元興建康寧抽水站 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:08.596Z",
            updated_at: "2018-11-18T15:34:44.585Z",
            first_type: "0"
          },
          {
            id: 2623,
            description: "●將港墘路737市場旁平面停車場改為立體停車場 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:14.205Z",
            updated_at: "2018-11-18T15:34:44.607Z",
            first_type: "1"
          },
          {
            id: 2625,
            description: "●爭取13億元，清除內湖垃圾山，成為親水公園 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:31.097Z",
            updated_at: "2018-11-18T15:34:44.652Z",
            first_type: "0"
          },
          {
            id: 2626,
            description: "●積極爭取2.4億元改造並妝點美麗大湖與碧湖公園 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:37.220Z",
            updated_at: "2018-11-18T15:34:44.673Z",
            first_type: "0"
          },
          {
            id: 2629,
            description: "●加速推動捷運民生汐止線與內湖南北線之興建 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:32:03.540Z",
            updated_at: "2018-11-18T15:34:44.699Z",
            first_type: "1"
          },
          {
            id: 2630,
            description: "●結合區里資源建立老人陪醫制度，增設病床與安養中心 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:32:15.502Z",
            updated_at: "2018-11-18T15:34:44.724Z",
            first_type: "0"
          },
          {
            id: 2627,
            description: "●協助興建白石湖吊橋，拓展觀光休閒農業 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:47.143Z",
            updated_at: "2018-11-18T15:34:44.746Z",
            first_type: "2"
          },
          {
            id: 2628,
            description:
              "●開闢康湖隧道，拓寬並降低康湖路與安泰街114巷口未來 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:58.391Z",
            updated_at: "2018-11-18T15:34:44.768Z",
            first_type: "1"
          },
          {
            id: 2631,
            description: "●完整規劃公車路線，推動小型公車網路 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:32:53.380Z",
            updated_at: "2018-11-18T15:34:44.788Z",
            first_type: "1"
          },
          {
            id: 2632,
            description: "●於學校、公園、市場設立地下停車場，以解決停車問題 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:32:58.914Z",
            updated_at: "2018-11-18T15:34:44.806Z",
            first_type: "1"
          },
          {
            id: 2633,
            description: "●加速推動衛生下水道全面接管工程，及美化後巷工程 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:33:05.329Z",
            updated_at: "2018-11-18T15:34:44.832Z",
            first_type: "0"
          },
          {
            id: 2634,
            description: "●全力支持警政消防及防災預算，打擊犯罪，強化防災 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:33:12.150Z",
            updated_at: "2018-11-18T15:34:44.855Z",
            first_type: "0"
          },
          {
            id: 2635,
            description: "●建立山坡地及易淹水地區監測預警系統 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:33:37.222Z",
            updated_at: "2018-11-18T15:34:44.876Z",
            first_type: "0"
          },
          {
            id: 2636,
            description: "●加速電線電纜全面地下化 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:33:42.073Z",
            updated_at: "2018-11-18T15:34:44.898Z",
            first_type: "0"
          },
          {
            id: 2624,
            description:
              "●於內湖7號公園興建地下停車場，解決西湖、麗山兩里停車問題；並設自來水加壓站，解決世界新城缺水之苦近期 \n",
            politician_id: 675,
            created_at: "2018-11-18T15:31:22.934Z",
            updated_at: "2018-11-18T15:34:44.630Z",
            first_type: "1"
          }
        ],
        {
          id: 47,
          name: "李信宏",
          email: "alan12141020@gmail.com",
          affairs: 0,
          transportation: 1,
          economic: 0,
          education: 0,
          teen: 1,
          citizen: 0,
          created_at: "2018-11-20T07:56:39.357Z",
          updated_at: "2018-11-20T07:56:39.357Z",
          u_id: "1901888149900371"
        }
      ],
      user_name: "",
      user_avatar_url: "",
      user_id: "",
      number: 0
    };
  },
  props: ["result", "radar"],
  mounted() {
    this.user_name = document.querySelector("#name").value;
    // this.user_name = "劉義維";
    this.user_avatar_url = document.querySelector("#avatar").value;
    // this.user_avatar_url =
    //   "https://scontent.ftpe8-4.fna.fbcdn.net/v/t1.0-9/37671776_2078680108811872_5005884623729721344_n.jpg?_nc_cat=110&_nc_ht=scontent.ftpe8-4.fna&oh=04cf8e9f54091b66608b07773ba85ad5&oe=5C7DBF34";
    this.user_id = document.querySelector("#user-id").value;
    this.number = Math.floor(Math.random() * 10 + 1);
    this.showCardFront = true;

    setTimeout(() => {
      this.showIntro = false;
      this.showOutcome = true;
      this.renderRadar();
    }, 20000);
  },
  methods: {
    skipIntro() {
      this.showIntro = false;
      this.showOutcome = true;
      this.renderRadar();
    },
    playAgain() {
      this.$emit("play-again");
    },
    morePolicyInfo() {
      $(".modal").modal();
    },
    renderRadar() {
      setTimeout(() => {
        const affairs = this.radar[0];
        const transportation = this.radar[1];
        const education = this.radar[3];
        const teen = this.radar[4];
        const citizen = this.radar[5];
        const economic = this.radar[2];
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
                backgroundColor: "rgba(231,195,78,0.6)",
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
                min: -1,
                max: 4,
                stepSize: 2,
                display: false
              }
            }
          }
        });
      }, 0);
    }
  },
  watch: {
    showCardFront() {
      if (this.showCardFront) {
        this.shareUrl = `https://www.taiwanbunbun.com/result/${
          this.user_id
        }?front`;
      } else {
        this.shareUrl = `https://www.taiwanbunbun.com/result/${
          this.user_id
        }?back`;
      }
      this.shareDesc = `${this.user_name} 從政後會和 ${
        this.result[0].name
      } 議員 87% 像！！`;
    }
  }
};
</script>

<style lang='scss' scoped>
a {
  color: inherit;
  text-decoration: none;
}
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
  perspective: 200px;
  height: 100vh;
}
.intro {
  overflow: hidden;
  transform-style: preserve-3d;
  transform-origin: 50% 100%;
  transform: rotateX(12deg);
  width: 100%;
  height: calc(100vh - 100px);
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
  animation: scroll 20s linear;
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
      background: url(../assets/avatar.jpg);
      background-repeat: no-repeat;
      background-position: center center;
      background-size: cover;
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
    background-size: 115%;
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
.policy-info {
  .modal-open .modal {
    padding-right: 0 !important;
  }
  .modal-dialog {
    max-width: 80%;
  }
  table {
    width: 100%;
    font-family: "Zpix";
    border: 2px solid;
    border-collapse: collapse;
    background: #fff;
  }
  td {
    border: 2px solid;
    padding: 5px 10px;
    white-space: pre-line;
    line-height: 1.8em;
    &:first-child {
      width: 20%;
    }
    &:nth-child(2) {
      width: 10%;
    }
    &:last-child {
      width: 70%;
    }
  }
  tr {
    border: 2px solid;
  }
  .table-title {
    font-size: 1.2em;
    letter-spacing: 2px;
    line-height: 60px;
    &.table-head {
      line-height: 30px;
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
  .policy-info {
    .modal-dialog {
      max-width: 100%;
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
@keyframes flipCard {
  0% {
    transform: rotateY(0deg);
  }
  100% {
    transform: rotateY(1800deg);
  }
}
</style>

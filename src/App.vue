<template lang="pug">
  //- <!-- <div id="app">
  //-   <img alt="Vue logo" src="./assets/logo.png">
  //-   <HelloWorld msg="Welcome to Your Vue.js App"/>
  //- </div> -->
  #app
    //- audio(preload="auto",autoplay,  , loop, id="bgm")
    //-   source(src='./assets/sound/bgm2.ogg', type='audio/mp3')
    .version 0.0.1
    .logo
      .icon(:style="{backgroundColor: nowbgColor, backgroundImage:`url(${require('./assets/logo/' + this.nowImage)})` }")
      .space
      .font(:style="{backgroundImage:`url(${require('./assets/font/' + this.nowFont)})` }")
    .tab
      .colorPick.pick
        .pickColor.picker(v-for="(color, index) in bgcolor" :style="{backgroundColor: color}" @click="changeBgColor(index, color)" :class="{isActive: bgSelect[index]}")
      .facePick.pick
        .pickFace.picker(v-for="(item, index) in image" @click="changeImage(index, item)" :style="{backgroundImage:`url(${require('./assets/logo/' + item)})` }" :class="{isActive: imageSelect[index]}")
      .fontPick.pick
        .pickFont.picker(v-for="(font, index) in font" @click="chnageFont(index, true,font)" :style="{backgroundImage:`url(${require('./assets/font/' + font)})` }" :class="{isActive: fontSelect[index]}")


</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "app",
  components: {
    HelloWorld
  },
  data() {
    return {
      bgcolor: ["#FED300", "#FF4240", "#0396F1", "white"],
      image: ["logo1.png", "logo2.png", "logo3.png"],
      font: ["font1.png", "font2.png", "font3.png"],
      fontD: ["fontD1.png", "fontD2.png", "fontD3.png"],
      nowbgColor: "#FED300",
      nowFont: "font1.png",
      nowImage: "logo1.png",
      nowIndex: [0,0,0,0],
      bgSelect: [true, false, false, false],
      imageSelect: [true, false, false, false],
      fontSelect: [true, false, false, false],
      clickSound: null
    };
  },
  mounted(){
    // var audio = document.getElementById("bgm")
    // audio.volume = 0.5
    var source = document.createElement("source");
    source.src = require('./assets/sound/click.mp3');
    this.clickSound = document.createElement("audio");
    this.clickSound.setAttribute("preload", "auto");
    this.clickSound.style.display = "none";
    this.clickSound.volume = 0.3;
    this.clickSound.appendChild(source);
    document.body.appendChild(this.clickSound);

},
  computed: {

  },
  methods: {
    playSound(){
      /*eslint no-console: "error"*/

      this.clickSound.currentTime=0;
      var playpromise = this.clickSound.play()
      if (playpromise !== undefined) {
          playpromise.then(() => {
              this.clickSound.play()
          }).catch(error => {
/*eslint no-console: ["error", { allow: ["warn", "error"] }] */
              console.error(error, "error");
          });
      }
    },
    changeBgColor(index, color) {
      if(index != this.nowIndex[0])
        this.playSound()
      for(var i=0;i < this.bgSelect.length; i++){
        this.bgSelect[i] = false
      }
      this.bgSelect[index] = true
      this.nowIndex[0] = index
      this.nowbgColor = color;
    },
    changeImage(index, image) {
     if(index != this.nowIndex[1])
        this.playSound()
      for(var i=0;i < this.imageSelect.length; i++){
        this.imageSelect[i] = false
      }
      this.imageSelect[index] = true
      this.nowIndex[1] = index
      this.nowImage = image;
    },
    chnageFont(index,d, font) {
      if(index != this.nowIndex[2])
        this.playSound()
      for(var i=0;i < this.fontSelect.length; i++){
        this.fontSelect[i] = false
      }
      if (d) {
        this.fontSelect[index] = true
        this.nowFont = font;
        this.nowIndex[2] = index
      } else {
        this.nowFont = this.fontD[index];
        this.nowIndex[3] = index
      }
    },

  }
};
</script>

<style lang="sass">

@media only screen and (max-width: 600px) 
  .tab
    bottom: 5% !important
    height: 15rem !important
  .pick 
    flex-direction: column
    margin:0 1.3rem !important
  .picker
    width: 3rem !important
    height: 15rem

  .logo
    margin-bottom: 60% !important
  
  
  .icon
    height: 100px !important
    width: 100px !important
    margin: 10px !important


  .font
    width: 150px !important
    height: 100px !important
    margin: 10px !important


body
  color: black
  font-family: "Questrial", sans-serif
  background-color: #ffec63
  background-image: linear-gradient(45deg, #ffd966 25%, transparent 25%, transparent 75%, #ffd966 75%, #ffd966), linear-gradient(-45deg, #ffd966 25%, transparent 25%, transparent 75%, #ffd966 75%, #ffd966)
  background-size: 60px 60px
  background-position: 0 0
  animation: slide 4s infinite linear

@keyframes slide
  from
    background-position: 0 0

  to
    background-position: -120px 60px

html, body
  width: 100vw
  height: 100vh
  margin: 0
#app
  font-family: 'Avenir', Helvetica, Arial, sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  text-align: center
  width: 100%
  height: 100%
  color: #2c3e50
  display: flex
  justify-content: center
  align-items: center
  

.logo
  margin-bottom: 10%
  display: flex
  width: auto
  background-color:  rgba(255, 255, 255, 0.8)
  border-radius: 10px
.space
  width: 0px

.icon
  height: 200px
  width: 200px
  margin: 20px
  background-position: center center
  background-size: contain
  background-repeat: no-repeat
  background-image: url("./assets/logo/logo1.png")
  border-radius: 50%

.font
  margin: 20px
  width: 300px
  height: 200px
  background-position: center center
  background-repeat: no-repeat
  background-size: contain
  background-image: url("./assets/logo/logo1.png")

.tab
  cursor: pointer
  position: absolute
  bottom: 15%
  display: flex
  width: auto
  height: 5.3rem

  .pick 
    display: flex
    margin: 3px
    .picker
      margin: 3px
      width: 5.3rem
      background-position: center center
      background-repeat: no-repeat
      background-size: contain
      border: 3px solid #F4F4F4



.isActive
  outline: dashed 2.5px

.version
  position: absolute
  bottom: 2px
  right: 1px
  font-weight: bold
  opacity: .5



</style>

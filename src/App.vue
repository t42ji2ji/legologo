<template lang="pug">
  //- <!-- <div id="app">
  //-   <img alt="Vue logo" src="./assets/logo.png">
  //-   <HelloWorld msg="Welcome to Your Vue.js App"/>
  //- </div> -->
  #app
    .logo
      .icon(:style="{backgroundColor: nowbgColor, backgroundImage:`url(${require('./assets/logo/' + this.nowImage)})` }")
      .space
      .font(:style="{backgroundImage:`url(${require('./assets/font/' + this.nowFont)})` }")
    .tab
      .colorPick.pick
        .pickColor.picker(v-for="(color, index) in bgcolor" :style="{backgroundColor: color}" @click="changeBgColor(index, color, $event)" :class="{isActive: bgSelect[index]}")
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

    };
  },
  computed: {

  },
  methods: {
    changeBgColor(index, color, event) {
      console.log(event);
      for(var i=0;i < this.bgSelect.length; i++){
        this.bgSelect[i] = false
      }
      this.bgSelect[index] = true
      this.nowIndex[0] = index
      this.nowbgColor = color;
    },
    chnageFont(index,d, font) {
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
    changeImage(index, image) {
      for(var i=0;i < this.imageSelect.length; i++){
        this.imageSelect[i] = false
      }
      this.imageSelect[index] = true
      this.nowIndex[1] = index
      this.nowImage = image;
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
    margin-right: 2rem !important
  .picker
    width: 3rem !important
    height: 15rem

  
  
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




</style>

<!--suppress ALL -->
<template>
  <!-- vue 中所有的组件要被根结点div包含起来 -->
  <div class="header">
    <div class="header-l">
      <img src="../../assets/bit.png" class="bitLogo">
      <h1 class="title" align="center" style="font-size: 40px;color: #ba2407;user-select: none;cursor:default;">BIT跳蚤市场</h1>
    </div>
    <div class="header-m">
      <SearchBar/>
    </div>
    <div class="header-r">
    <el-menu
      :default-active="3"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
      background-color="#286822FF"
      text-color="#fff"
      active-text-color="#ba2407">
      <el-menu-item index="1" >
        <el-button @click="handleSignBtnClick" class="headerBtn">
         {{this.$store.state.username}}
        </el-button>
      </el-menu-item>

      <el-menu-item index="2" @click="toGoodsAdd">
        <el-button class="headerBtn">发布宝贝</el-button>
      </el-menu-item>

      <el-menu-item index="3" @click="toHome" class="headerBtn">
        <i class="el-icon-menu" style="font-size: 24px"></i>
        主页
      </el-menu-item>
    </el-menu>
    </div>
    <!-- 调用 dialog 子组件 -->
    <user-dialog :visible.sync="visible"></user-dialog>

  </div>
</template>

<script>
  import UserDialog from "../User/UserDialog";
  import store from "../../vuex/store.js";
  import SearchBar from './SearchBar.vue'

  export default {
    components: {
      UserDialog,
      SearchBar
    },

    data() {
      return {
        visible : false ,
        activeIndex: '0',
        activeIndex2: '0'
      };
    },
    //注册 vuex
    store,
    methods: {

      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      },

      handleSignBtnClick(){

        if (!this.$store.state.id) {
          this.visible = true //通过data显示控制dialog
        } else {
          this.$router.push({ name : 'profile'})
        }
      },
      toHome(){
        this.$router.push({ path : '/'})
      },
      /* 发布商品按钮点击事件 */
      toGoodsAdd(){
        if (this.$store.state.hasSign ) {
          this.$router.push( { path : '/goods/add'})
        }else {
          alert('请先登陆')
        }
      }
    }
  }
</script>

<style lang="scss">
.header {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  align-items: center;
  width: 100%;
  overflow: hidden;
  background: #ffffff;
  height: 60px;
}
  .myli {
    float: right;
  }

  .el-menu--horizontal > .el-menu-item {
    float: right;
  }
.header-l {
  float: left;
  flex: 0 0 25%;
  max-width: 25%;
  height: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
}
.bitLogo{
  height: 100%;
  margin-right: 20px;
  margin-left: 20px;
}
.title{
  flex: 0 0 80%;
}
.header-r {
  float: right;
  text-align: right;
  flex: 0 0 24%;
  max-width: 24%;
  color: #ba2407;
}
.headerBtn {
  font-weight: bold;
  font-size: 14px;
}
.header-m {
  flex: 0 0 51%;
  max-width: 51%;
}
</style>

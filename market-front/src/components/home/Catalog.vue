<template>
  <div class="catalog">
    <el-menu class="menuLeft" active-text-color="#ba2407">
      <div v-for="item in catalogs">
        <el-menu-item
          class="item-tag"
          slot="reference">
          <router-link
            style="color: white;text-decoration: None"
            @click="test(item)"
            :to="{
                  name:'type',
                  params:
                  {
                    typeName:item
                   }
                  }">
            {{item}}
          </router-link>
        </el-menu-item>
      </div>
      <el-menu-item class="item-tag">
        <router-link :to="{ name: 'type',params: {typeName : 'all' } }" style="color: white;text-decoration: None">查看全部</router-link>
      </el-menu-item>
    </el-menu>
    <router-view>
      <p>Goodlist</p>
    </router-view>

  </div>

</template>

<script>
  import Axios from 'axios'
  import Api from '../../server/api.js'
  import GoodsList from '../goods/GoodsList.vue'

  export default {
    data() {
      return {
        catalogs: [],
        page : 0
      }
    },
    methods: {
      test(name) {
        alert(name)
        console.log(name)
      },
      InitData() {
        var self = this;
        Axios.get(Api.types(), {
          headers: {
            'Content-Type': 'application/x-www-userSignIn-urlencoded'
          }
        })
          .then(function (response) {
            self.catalogs = response.data.data;
            console.log(response)
          })
          .catch(function (error) {
            console.log(error);
          });
      },
    }, mounted() {
      this.InitData();
    },components:{
      GoodsList
    },
  }
</script>

<style lang="scss">
.catalog{
  display: flex;
  flex-direction: row;
  width: 100%;
}
.menuLeft{
  display: flex;
  flex-direction: column;
  width: 10%;
}
.item-tag{
  width: 100%;
  height: 70px;
  font-size: 26px;
  text-align: center;
  font-weight: bold;
  color: white;
  border: 2px solid #ffffff;
  border-radius: 10px;
  background-color: #266720;
}
  .el-icon-circle-plus {
    color: #ff5555;
    padding: 10px;
    height: 30px;
    width: 30px;
  }

  .camera {
    height: 40px;
    width: 40px;
    padding-left: 10px;
    padding-top: 15px;
    padding-right: 5px;
    float: left;
  }

  .text-upload_goods {
    font-size: larger;
  }

  .text-upload-description {
    font-size: small;
  }

  .el-tag-type > > > div {
    position: absolute;
  }

  .el-tag-type {
    background-color: white;
    color: #ff5555;
    border: 1px solid;
    margin-left: 10px;
    margin-right: 10px;
    float: left;
    cursor: pointer; /*鼠标悬停样式*/
    user-select: none; //用户不可选中文字
    text-decoration-line: none;
  }
  .el-tag-type:hover{
    color: #ff5555;
  }
  .release-goods{
    border: 1px solid #c3c3c3;
    border-radius:10px;
    padding-bottom: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    cursor: pointer;
  }

</style>

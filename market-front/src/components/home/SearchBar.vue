<template>
	<div class="searchBar" >
    <div class="demo-input-suffix" align="center" >
			<span class="search">
          <el-input
            class="searchSpace"
            placeholder="请输入你想要搜索的宝贝..."
            v-model="input_search"
            @keyup.enter.native="submit">
          </el-input>
          <button class="searchBtn" @click="submit">搜索</button>
		  </span>
    </div>
	</div>
</template>
<script>
  export default {
    data() {
      return {
        input_search: ''
      }
    },
    methods: {
      submit() {
        if (this.input_search !== '')
          this.$router.push( { name:'find-key' , params:{ key : this.input_search } })
      }
    }
  }
</script>
<style lang="scss">
.searchBar {
  height: 60px;
}
.search {
  display: flex;
  flex-direction: row;
  line-height: 52px;
  position: relative;
  width: 90%;
  padding-top: 2px;
  padding-bottom: 2px;
}
.el-input.is-active .el-input__inner, .el-input__inner:focus {
    border-color: #ff5555;

}
.el-input__inner{
	width:100%;
  height: 100%;
}
.searchSpace{
  height: 54px;
  width: 90%;
  border: 2px solid #555d65;
  font-size: 16px;
}
button.searchBtn {
  right: 0;
  width: 10%;
  background-color: #266720;
  color: #ffffff;
  font-size: 18px;
  font-weight: bold;
  border: 2px solid #555d65;
}
</style>

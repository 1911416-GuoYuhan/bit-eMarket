<template>
	<!-- vue 中所有的组件要被根结点div包含起来 -->
	<div class="home">
		<v-header></v-header>
		<br><br>
		<v-catalog></v-catalog>
    <el-footer class="copyright-footer">
      <div class="footer-text">北京理工大学：面向对象技术与方法</div>
    </el-footer>
 	</div>
</template>

<script>
  import Header from './Header.vue'
  import SearchBar from './SearchBar.vue'
  import Catalog from './Catalog.vue'
  import GoodsList from '../goods/GoodsList.vue'

  export default {
    data() {
      return {
        msg: 'Hello world from home！',
        title: '首页',
      }
    },
    methods: {},
    components: {
      'v-header': Header,
      'v-search-bar': SearchBar,
      'v-catalog': Catalog,
      'v-goods-list': GoodsList
    }, mounted() {

    }
	}

</script>
<!-- scoped表示局部作用域 -->

<style lang="scss">
hr{
	color:#c3c3c3;
}
  .copyright-footer{
    display: flex;
    flex-direction: column;
    background-color: #286822;
    text-align: center;
    color: white;
    margin-top: 20px;
    font-size: 20px;
    justify-content: center;
    align-items: center;
  }
  .foot-text{
    margin-top: 20px;
  }
</style>

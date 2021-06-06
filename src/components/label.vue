<template>
  <div style="padding:20px;" id="app">
    <div class="panel panel-primary">
      <div class="panel-heading">用户标签</div>
      <table class="table table-bordered table-striped text-center">
        <thead>
        <tr>
          <th>序号</th>
          <th>姓名</th>
          <th>艺术兴趣值</th>
          <th>宗教兴趣值</th>
          <th>社会科学兴趣值</th>
          <th>自然科学兴趣值</th>
          <th>文学兴趣值</th>
          <th>历史地理兴趣值</th>
          <th>应用科学兴趣值</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for ="(lable,index) in latestLables" v-bind:key="index">
          <td>{{index+1}}</td>
          <td>{{lable.name}}</td>
          <td>{{lable.gender}}</td>
          <td>{{lable.age}}</td>
          <td>{{lable.art_value}}</td>
          <td>{{lable.religion_value}}</td>
          <td>{{lable.socialSci_value}}</td>
          <td>{{lable.Sci_value}}</td>
          <td>{{lable.literature_value}}</td>
          <td>{{lable.hisgeo_value}}</td>
          <td>{{lable.appliSci_value}}</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'hello',
    data () {
      return {
        lables: [
          {'name': '赵康', 'gender':'男','age':'21','art': '25','religion':'0','socialSci':'50','Sci':'10','literature':'80','hisgeo':'10','appliSci':'120'},
          {'name': '钱由军', 'gender':'男','age':'22','art': '5','religion':'0','socialSci':'50','Sci':'10','literature':'120','hisgeo':'70','appliSci':'30'},
          {'name': '孙为名', 'gender':'男','age':'22','art': '10','religion':'0','socialSci':'40','Sci':'10','literature':'40','hisgeo':'40','appliSci':'50'},
        ]
      }
    },
    created() {
      let usersInfo=this.$store.getters.usersInfo       //获取存储的用户数据，计算属性
      this.lables=usersInfo
    },
    computed:{
      latestLables:function(){
        return this.lables
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  h1, h2 {
    font-weight: normal;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }
  tr,th{
    text-align:center;
  }
</style>

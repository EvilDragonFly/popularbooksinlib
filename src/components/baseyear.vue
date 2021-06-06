<template>
    <div>
      <x-chart id="high" class="high" :option="option"></x-chart>
    </div>
</template>

<script>
  import { mapState}  from 'vuex'
  

  // // 导入chart组件
  // var myvue = {};
  import XChart from './charts'
  export default {          //之前无法识别vue属性，只能显示为普通属性，待执行npm install vue后才得以解决
    components: {
      XChart
    },
    data() {
      return {
        option:{
          chart: {
            type: 'column'
          },
          title: {
            text: '图书馆用户兴趣度信息'
          },
          subtitle: {
            text: ''
          },
          xAxis: {
            categories: [
              '艺术','宗教','社会科学','自然科学','文学','历史地理','应用科学'
            ],
            crosshair: true
          },
          yAxis: {
            min: 0,
            title: {
              text: '兴趣值(以用户翻阅图书次数为基础)'
            }
          },
          series: [{
            name: '各类书籍用户兴趣度统计',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6]
            //data:[]
          }]
        },
      }
    },
   
    
    
    methods :{
      setUsersInfo:function(usersInfo){
        this.$store.commit('setUsersInfo',usersInfo)
      }
    },

    computed:{
      ...mapState({
        usersInfo:state=>state.usersInfo,
        interestValue:state=>state.interestValue
      })
    },
    mounted(){
      let that=this     //$.ajax中无法识别this故将this赋值给that
      
      $.ajax(
        'http://localhost:3001',
        {
        
          type:"post",            //get不能传输数据体？这里只能用post
          data:{
            need:'usersInfo',
          },            //client向server传输的数据，以query的形式添加到url上
          dataType:"json",    //client接收的数据类型
          success:function(data){
            //alert('数据返回成功了')
            var interestValue=new Array(0,0,0,0,0,0,0);
            console.log(data)
            that.setUsersInfo(data)      //这里store.commit方法只能放在methods中,且运行不能放在created hook中
            $.each(data,function(index,info){
              interestValue[0]+=info["art_value"]
              interestValue[1]+=info["religion_value"]
              interestValue[2]+=info["socialSci_value"]
              interestValue[3]+=info["Sci_value"]
              interestValue[4]+=info["literature_value"]
              interestValue[5]+=info["hisgeo_value"]
              interestValue[6]+=info["appliSci_value"]
            })
            console.log('interestvalue如下')
            console.log(interestValue)
            //this.$store.commit('setInterestValue',interestValue)
            that.option.series[0].data=interestValue
            console.log('series数据')
            console.log(that.option.series[0].data)
            console.log(that.$store.state.usersInfo)
          }
        
      })
      console.log('ajax方法发生了')
      
      
    }
  }
</script>

<style scoped>

</style>

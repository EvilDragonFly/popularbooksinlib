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
            name: '受欢迎指数',
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
    created(){
      if(this.usersInfo.length==0){
        let that=this
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
    },
    mounted(){
      console.log("进入carrier")
      console.log("usersinfo")
      let usersInfo=this.usersInfo
      console.log(usersInfo)
      console.log('type of userinfo'+ typeof(usersInfo))
      let genderInfo=new Array(2)
      genderInfo[0]=new Array(0,0,0,0,0,0,0)      //青少年 <18             初始化为0防止+=运算出错
      genderInfo[1]=new Array(0,0,0,0,0,0,0)      //青年   18~45
     
      for(let info of usersInfo){               //不能用in ，in是index
        console.log("info")
        console.log(info)
        console.log("art_value")
        console.log(info["art_value"])
        if(info.gender=="男"){
          genderInfo[0][0]+=info["art_value"]
          genderInfo[0][1]+=info["religion_value"]
          genderInfo[0][2]+=info["socialSci_value"]
          genderInfo[0][3]+=info["Sci_value"]
          genderInfo[0][4]+=info["literature_value"]
          genderInfo[0][5]+=info["hisgeo_value"]
          genderInfo[0][6]+=info["appliSci_value"]
        }
        
        else{
          genderInfo[1][0]+=info["art_value"]
          genderInfo[1][1]+=info["religion_value"]
          genderInfo[1][2]+=info["socialSci_value"]
          genderInfo[1][3]+=info["Sci_value"]
          genderInfo[1][4]+=info["literature_value"]
          genderInfo[1][5]+=info["hisgeo_value"]
          genderInfo[1][6]+=info["appliSci_value"]
        }
      }
      console.log('genderInfo')
      console.log(genderInfo)
      // this.option.series=new Array(4)    //需要new来更改值，不能直接更改
      // this.option.series[0].name="青少年"
      // this.option.series[0].data=genderInfo[0]
      // this.option.series[1].name="青年"
      // this.option.series[1].data=genderInfo[1]
      // this.option.series[2].name="中年"
      // this.option.series[2].data=genderInfo[2]
      // this.option.series[3].name="老年"
      // this.option.series[3].data=genderInfo[3]

      let tmp=new Array(2)    //需要new来更改值，不能直接更改
      tmp[0]={                      //不能直接tmp[0].name="青少年" undefined不能被赋值
        name:"男性",
        data:genderInfo[0]
      }
      tmp[1]={
        name:"女性",
        data:genderInfo[1]
      }
      
      
      
      this.option.series=tmp


      
      
      
    }
  }
</script>

<style scoped>

</style>

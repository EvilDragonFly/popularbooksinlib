<template>
  <div class="x-bar">
    <div :id="id"  :option="latestOption"></div>
  </div>
</template>
<script>
  import HighCharts from 'highcharts'
  export default {
    // 验证类型
    props: {
      id: {
        type: String
      },
      option: {
        type: Object
      }
    },
    watch: {
      option : {
        handler(newVal,oldVal){
          this.option=newVal
          HighCharts.chart(this.id,this.option)
        },
        
        deep:true,           //深度监控，对对象内成员变化也能处理，比如option中的series数据.
        //immediate:true
      },
      
      
    },
    // computed:{
    //   latestOption:function(){
    //     HighCharts.chart(this.id,this.option)
    //     return this.option
    //   }
    // },
    mounted() {
      HighCharts.chart(this.id,this.option)
    }
  }
</script>

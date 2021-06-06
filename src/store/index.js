// index.js
import Vue from 'vue'
import Vuex from 'vuex'
//import * as state from "./state"

Vue.use(Vuex)

// const state = {
// 	test:"testMsg"
// }
export default new Vuex.Store({
    state: {
        usersInfo: [],
        interestValue: []
    },
    getters: {
        usersInfo(state) {
            return state.usersInfo;
        },
        interestValue(state) {
            return state.interestValue
        }
    },
    mutations: {
        setUsersInfo(state, usersInfo) { //用于单文件组件中将对服务器请求返回的用户数据保存
            state.usersInfo = usersInfo
        },
        setInterestValue(state, interestValue) {
            state.interestValue = interestValue //保存图书馆用户兴趣度统计信息
        }
    },
    actions: {}
})
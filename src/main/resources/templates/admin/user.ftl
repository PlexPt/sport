<!DOCTYPE html>
<html lang="zh">
<head>
    <title>后台管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- 开发环境版本，包含了有帮助的命令行警告 2.6.10-->
    <script src="/js/vue.js"></script>
    <script src="/js/axios.js"></script>
    <script src="/js/utils.js"></script>

    <!-- element引入组件库 -->
    <script src="/js/ele.js"></script>
    <!-- element引入样式 -->
    <link rel="stylesheet" href="/css/element-ui.css">


</head>
<body>
<div id="app" style="padding: 0; margin: 0; ">
    <el-container style="height: 100%;min-height: 1080px;  padding: 0; margin: 0 ;  ">

        <el-header style="background:#409EFF;">
            <nav style="margin: 0; text-align: center">
                <span style="color: #eee; font-size: x-large" slot="title">后台管理系统</span>
            </nav>
        </el-header>
        <el-container>
            <el-aside width="120px" style="background-color: #304156;">
                <el-menu
                        background-color="#304156"
                        text-color="#fff"
                        :collapse="sidebarFold"
                        :collapseTransition="false"
                >


                    <el-menu-item>
                        <el-link href="./login" type="primary"> 留 言</el-link>
                    </el-menu-item>


                    <el-menu-item>
                        <el-link href="./login" type="primary">轮 播 图</el-link>
                    </el-menu-item>


                    <el-menu-item>
                        <el-link href="./login" type="primary">案 例</el-link>
                    </el-menu-item>


                    <el-menu-item>
                        <el-link href="./login" type="primary">关 于 我 们</el-link>
                    </el-menu-item>

                    <el-menu-item>
                        <el-link href="./login" type="primary">账 号</el-link>
                    </el-menu-item>

                    <el-menu-item>
                        <el-link href="./login" type="danger">退 出</el-link>
                    </el-menu-item>

                </el-menu>
            </el-aside>


            <el-main>

                <div style="margin: 0">
                    <el-form ref="form" :model="form" label-width="80px">
                        <el-form-item label="活动名称">
                            <el-input v-model="form.name"></el-input>
                        </el-form-item>
                        <el-form-item label="活动区域">
                            <el-select v-model="form.region" placeholder="请选择活动区域">
                                <el-option label="区域一" value="shanghai"></el-option>
                                <el-option label="区域二" value="beijing"></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="活动时间">
                            <el-col :span="11">
                                <el-date-picker type="date" placeholder="选择日期" v-model="form.date1"
                                                style="width: 100%;"></el-date-picker>
                            </el-col>
                            <el-col class="line" :span="2">-</el-col>
                            <el-col :span="11">
                                <el-time-picker placeholder="选择时间" v-model="form.date2"
                                                style="width: 100%;"></el-time-picker>
                            </el-col>
                        </el-form-item>
                        <el-form-item label="即时配送">
                            <el-switch v-model="form.delivery"></el-switch>
                        </el-form-item>
                        <el-form-item label="活动性质">
                            <el-checkbox-group v-model="form.type">
                                <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
                                <el-checkbox label="地推活动" name="type"></el-checkbox>
                                <el-checkbox label="线下主题活动" name="type"></el-checkbox>
                                <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
                            </el-checkbox-group>
                        </el-form-item>
                        <el-form-item label="特殊资源">
                            <el-radio-group v-model="form.resource">
                                <el-radio label="线上品牌商赞助"></el-radio>
                                <el-radio label="线下场地免费"></el-radio>
                            </el-radio-group>
                        </el-form-item>
                        <el-form-item label="活动形式">
                            <el-input type="textarea" v-model="form.desc"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="onSubmit">立即创建</el-button>
                            <el-button>取消</el-button>
                        </el-form-item>
                    </el-form>

                </div>


            </el-main>
        </el-container>
    </el-container>


</div>
</body>


<script type="text/javascript">

    var app = new Vue({
        el: '#app',
        data: function () {
            return {
                form: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                }
            }
        },
        methods: {
            onSubmit() {
                console.log('submit!');
            }
        }

    });

</script>


<style>

    html {
        height: 100%;
    }

    body {
        margin: 0;
        min-height: 1080px%;
    }

    .el-menu-item {
        text-align: center
    }

</style>

</html>

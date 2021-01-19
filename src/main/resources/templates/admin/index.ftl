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
    <el-container style="height: 100%; padding: 0; margin: 0 ;  ">

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


                <el-table :data="tableData"
                          border
                          v-loading="dataListLoading"
                          style="width: 100%;"
                >
                    <el-table-column prop="date" header-align="center" label="日期" width="140">
                    </el-table-column>

                    <el-table-column prop="name" header-align="center"
                                     label="姓名" width="120">
                    </el-table-column>

                    <el-table-column prop="mobile" header-align="center" label="手机" width="140">
                    </el-table-column>

                    <el-table-column prop="email" header-align="center" label="邮箱" width="160">
                    </el-table-column>

                    <el-table-column prop="qq" header-align="center" label="QQ" width="140">
                    </el-table-column>

                    <el-table-column prop="weixin" header-align="center" label="微信" width="140">
                    </el-table-column>

                    <el-table-column prop="msg" header-align="center" label="留言">
                    </el-table-column>
                </el-table>
            </el-main>
        </el-container>
    </el-container>


</div>
</body>


<script type="text/javascript">

    var app = new Vue({
        el: '#app',
        data: function () {
            const item = {
                // date: '2019-05-02',
                name: '王小虎',
                mobile: '13563746574',
                email: '135637465@qq.com',
                qq: '13563746574',
                weixin: '13563746574',
                msg: '测试数据'

            };

            return {
                tableData: Array(1).fill(item)
            }
        },
        methods: {
            getData(){
                this.tableData = [];
                axios.get('/admin/feedback/list', {
                    params: {}
                })
                    .then(function (response) {
                        console.log(response);
                        this.tableData = response.data;
                        return response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }

        },
        created() {
           this.getData();
        }
    });

</script>


<style>
    body {
        margin: 0;
    }

    .el-menu-item {
        text-align: center
    }

</style>

</html>

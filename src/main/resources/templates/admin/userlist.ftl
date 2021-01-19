<!DOCTYPE html>
<html lang="zh">
<head>
    <title>后台管理系统</title>
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
<div id="app" style="height: 100%; padding: 0; margin: 0; ">
    <el-container style="height: 100%;   padding: 0; margin: 0 ;  ">

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
<#--                        :collapse="sidebarFold"-->
<#--                        :collapseTransition="false"-->
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


            <el-main id="test">

                <div>
                    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">

                        <el-form-item>
                            <el-button type="primary" @click="addOrUpdateHandle()">新增
                            </el-button>

                        </el-form-item>
                    </el-form>
                    <el-table
                            :data="dataList"
                            border
                            v-loading="dataListLoading"
                            style="width: 100%;"
                    >

                        <el-table-column prop="userId" header-align="center" align="center"
                                         width="80"
                                         label="ID"></el-table-column>
                        <el-table-column prop="name" header-align="center" align="center"
                                         label="姓名"></el-table-column>
                        <el-table-column prop="username" header-align="center" align="center"
                                         label="用户名"></el-table-column>

                        <el-table-column fixed="right" header-align="center" align="center"
                                         width="150" label="操作">
                            <template slot-scope="scope">
                                <el-button
                                        type="text"
                                        size="small"
                                        @click="addOrUpdateHandle(scope.row.userId)">修改
                                </el-button>
                                <el-button
                                        type="text"
                                        size="small"
                                        @click="deleteHandle(scope.row.userId)"
                                >删除
                                </el-button>
                            </template>
                        </el-table-column>
                    </el-table>

                    <!-- 弹窗, 新增 / 修改 -->

                    <el-dialog
                            v-if="addOrUpdateVisible"
                            ref="addOrUpdate"
                            @refreshDataList="getDataList"
                            :title="!dataForm.id ? '新增' : '修改'"
                            :close-on-click-modal="false"
<#--                            :visible.sync="visible"-->
                    >
                        <el-form :model="dataForm"     ref="dataForm"
                                 @keyup.enter.native="dataFormSubmit()" label-width="80px">
                            <el-form-item label="姓名" prop="userName">
                                <el-input v-model="dataForm.name" placeholder="姓名"></el-input>
                            </el-form-item>
                            <el-form-item label="登录帐号" prop="username">
                                <el-input v-model="dataForm.username" placeholder="登录帐号"></el-input>
                            </el-form-item>
                            <el-form-item label="密码" prop="password"
                                          :class="{ 'is-required': !dataForm.id }">
                                <el-input v-model="dataForm.password" type="password"
                                          placeholder="密码"></el-input>
                            </el-form-item>
                            <el-form-item label="确认密码" prop="comfirmPassword"
                                          :class="{ 'is-required': !dataForm.id }">
                                <el-input v-model="dataForm.comfirmPassword" type="password"
                                          placeholder="确认密码"></el-input>
                            </el-form-item>

                        </el-form>
                        <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
                    </el-dialog>
                </div>


            </el-main>
        </el-container>
    </el-container>


</div>
</body>


<script type="text/javascript">
    (function () {

        var heights = window.innerHeight;
        document.getElementById("test").style.height = parseInt(heights - 60 - 20) + "px";
    })();
    var app = new Vue({
        el: '#app',
        data: function () {


            return {
                dataForm: {
                    id: 0,
                    name: '',
                    username: '',
                    password: '',
                    comfirmPassword: '',
                    status: 1
                },
                dataList: Array(200).fill({
                    id: '1',
                    name: '罗艺',
                    username: '13563746574',

                })

                ,
                dataListLoading: false,
                addOrUpdateVisible: false
            };
        },
        activated() {
            this.getDataList();
        },
        methods: {
            // 获取数据列表
            getDataList: function () {
                this.dataListLoading = true;
                axios.request({
                    url: "/sys/user/list",
                    method: "get"

                }).then(({data}) => {
                    if (data && data.code === 0) {
                        this.dataList = data.page.list;
                        this.totalPage = data.page.totalCount;
                    } else {
                        this.dataList = [];
                        this.totalPage = 0;
                    }
                    this.dataListLoading = false;


                    this.dataList = [{
                        id: '1',
                        name: '罗艺',
                        username: '13563746574',

                    }];
                });
            },
            // 新增 / 修改
            addOrUpdateHandle: function (id) {
                this.addOrUpdateVisible = true;
                this.$nextTick(() => {
                    //  this.init(id);
                });
            },
            init: function (id) {
                this.dataForm.id = id || 0
                axios.request({
                    url: ('/sys/role/select'),
                    method: 'get',

                }).then(({data}) => {
                    this.roleList = data && data.code === 0 ? data.list : []
                }).then(() => {
                    this.visible = true
                    this.$nextTick(() => {
                        this.$refs['dataForm'].resetFields()
                    })
                }).then(() => {
                    if (this.dataForm.id) {
                        axios.request({
                            url: (`/sys/user/info/` + this.dataForm.id),
                            method: 'get',
                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.dataForm.userName = data.user.username
                                this.dataForm.salt = data.user.salt
                                this.dataForm.email = data.user.email
                                this.dataForm.mobile = data.user.mobile
                                this.dataForm.roleIdList = data.user.roleIdList
                                this.dataForm.status = data.user.status
                            }
                        })
                    }
                })
            },
            // 删除
            deleteHandle: function (id) {
                var userIds = id;
                this.$confirm(
                    `确定删除?`,
                    "提示",
                    {
                        confirmButtonText: "确定",
                        cancelButtonText: "取消",
                        type: "warning"
                    })
                    .then(() => {
                        axios.request({
                            url: ("/user/delete/" + userIds),
                            method: "post",

                        }).then(({data}) => {
                            if (data && data.code === 0) {
                                this.$message({
                                    message: "操作成功",
                                    type: "success",
                                    duration: 1500,
                                    onClose: () => {
                                        this.getDataList();
                                    }
                                });
                            } else {
                                this.$message.error(data.msg);
                            }
                        });
                    })
                    .catch(() => {
                    });
            }
            ,
            onSubmit: function () {
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
        height: 100%;
    }

    .el-menu-item {
        text-align: center
    }

</style>

</html>

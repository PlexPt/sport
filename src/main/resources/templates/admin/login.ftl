<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>登录后台</title>


    <!-- 开发环境版本，包含了有帮助的命令行警告 2.6.10-->
    <script src="/js/vue.js"></script>
    <script src="/js/axios.js"></script>
        <script src="/js/store.js"></script>

    <!-- element引入样式 -->
    <link rel="stylesheet" href="/css/element-ui.css">
    <!-- element引入组件库 -->
    <script src="/js/ele.js"></script>
    <#--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>-->
    <#--对于生产环境，我们推荐链接到一个明确的版本号和构建文件，以避免新版本造成的不可预期的破坏-->
    <#--<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>-->

    <style>
        html, body {
            margin: 0;
            padding: 10%;
            position: relative;
            background: #2d3a4b;
        }

        .dialog {
            margin-top: 40px;
            width: 520px;
            max-width: 100%;
            height: 100%;

            background: rgba(0, 0, 0, .8);


        }

        .loginPage {
            /*position: absolute;*/
            /*top: 50%;*/
            /*left: 50%;*/
            /*margin-top: -150px;*/
            /*margin-left: -175px;*/
            /*width: 350px;*/
            /*min-height: 300px;*/
            /*padding: 30px 20px 20px;*/
            /*border-radius: 8px;*/
            /*box-sizing: border-box;*/
            /*background-color: #fff;*/


            position: absolute;
            top: 40%;
            left: 25%;
            margin-top: -150px;
            width: 50%;
            min-height: 300px;
            padding: 30px 20px 20px;
            border-radius: 8px;
            box-sizing: border-box;
            background-color: #fff;
        }

        .loginPage p {
            color: red;
            text-align: left;
        }

        .loginPage h1 {
            color: #233333;
            text-align: center;
        }

    </style>

</head>
<body>
<div id="app">

    <div class="dialog">
        <div class="loginPage">
            <h1>登录</h1>
            <el-form>
                <el-form-item label="用户名">
                    <el-input type="text" id="user" v-model="formName.user"
                              @input="inputBlur('user',formName.user)"></el-input>
                    <p>{{formName.userError}}</p>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input type="password" id="password" v-model="formName.password"
                              @input="inputBlur('password',formName.password)"></el-input>
                    <p>{{formName.passwordError}}</p>
                </el-form-item>
                <el-button style="width:100%;" type="primary" @click="submitForm('formName')"
                           v-bind:disabled="formName.beDisabled">登录
                </el-button>
                <#--                <el-button style="width:40%;" @click="resetForm">重置</el-button>-->
            </el-form>
        </div>
    </div>
</div>
</body>


<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: function () {
            return {
                formName: {//表单中的参数
                    user: '',
                    userError: '',
                    password: '',
                    passwordError: '',
                    beDisabled: true
                },
                beShow: false//传值给父组件
            }
        },
        methods: {
            // resetForm: function () {
            //     this.formName.user = '';
            //     this.formName.userError = '';
            //     this.formName.password = '';
            //     this.formName.passwordError = '';
            // },
            submitForm: function (formName) {
                //与父组件通信传值
                //this.$emit('showState', [this.beShow,this.formName.user])
                //提交user password
                var user = this.formName.user,
                    password = this.formName.password;
                var that = this;
                console.log(user, password)
                axios.post('./login?username=' + user + '&pwd=' + password)
                    .then(function (res) {
                        console.log(res.data);
                        if (res.status === 200 && res.data.code === 0) {
                            console.log("登录成功");

                            save(res.data.token);

                            location.href = "./index";
                        } else {

                            // ele.MessageBox({
                            //     title: 'e',
                            //     message: ' 密码错误' ,
                            //     type: ' error '
                            // });
                            // this.$ElementUI.Message({
                            //     message: '用户名或密码错误',
                            //     type: 'error'
                            // });
                            that.$message.error('用户名或密码错误');
                            // alert("用户名或密码错误");
                        }

                    })
                    .catch(function () {

                    })
            },
            inputBlur: function (errorItem, inputContent) {
                if (errorItem === 'user') {
                    if (inputContent === '') {
                        this.formName.userError = '用户名不能为空'
                    } else {
                        this.formName.userError = '';
                    }
                } else if (errorItem === 'password') {
                    if (inputContent === '') {
                        this.formName.passwordError = '密码不能为空'
                    } else {
                        this.formName.passwordError = '';
                    }
                }
                //对于按钮的状态进行修改
                if (this.formName.user != '' && this.formName.password != '') {
                    this.formName.beDisabled = false;
                } else {
                    this.formName.beDisabled = true;
                }
            }
        },
        beforeMount() {
            // var store = require("/js/store.js")
            // var token = store.get();
            var str = gettoken();
            debugger;

            // axios.get('/user', {
            //     params: {
            //         ID: 12345
            //     }
            // })
            //     .then(function (response) {
            //         console.log(response);
            //     })
            //     .catch(function (error) {
            //         console.log(error);
            //     });
        }
    });


</script>
</html>

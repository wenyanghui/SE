<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" >
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>图书名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="bookname"  required="" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>图书数量</label>
                <div class="layui-input-inline">
                    <input type="number" id="booknum" name="num" required="" lay-verify="number"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>出版社</label>
                <div class="layui-input-inline">
                    <input type="text" id="press" required=""
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>图书单价</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" id="price"  required=""
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="*" lay-submit="">修改</button>
            </div>
        </form>
    </div>
</div>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(*)', function(data){
            var da=JSON.stringify(data.field);
            $.ajax({
                url:"./addnewbook",
                method:"POST",
                data:{"bookname":document.getElementById("bookname").value,"booknum":document.getElementById("booknum").value
                ,"press":document.getElementById("press").value,"price":document.getElementById("price").value},
                success:x()
            });
            return false;
        });

        function x() {
            layer.msg('添加成功!', {icon: 1, time: 1000},function (xxx) {
                xadmin.close();
                xadmin.father_reload();
            });

        }
    });
</script>
</body>

</html>
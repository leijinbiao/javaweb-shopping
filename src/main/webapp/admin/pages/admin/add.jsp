<%--
  Created by IntelliJ IDEA.
  User: 波波哥
  Date: 2022/1/2
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/basePath.jsp"></jsp:include>
<link rel="stylesheet" href="static/admin/lib/layui-v2.6.3/css/layui.css" media="all">
<link rel="stylesheet" href="static/admin/css/public.css" media="all">
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
            <tip>${requestScope.msg}</tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" lay-reqtext="密码不能为空" placeholder="请输入密码" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">手机</label>
        <div class="layui-input-block">
            <input type="phone" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="email" name="email" placeholder="请输入邮箱" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">信息</label>
        <div class="layui-input-block">
            <textarea name="information" class="layui-textarea" cols="30" rows="10"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="static/admin/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="static/admin/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script>
    layui.use(['form','miniTab','layer'], function () {
        var form = layui.form,
            layer = layui.layer,
            miniTab = layui.miniTab,
            $ = layui.jquery;
        //添加判断

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.post("admin/adminServlet?action=addAdmin",data.field,function (res) {
                if(res.trim() == "successful"){
                    miniTab.openNewTabByIframe({
                        title: "用户列表",
                        href: "admin/page/admin/list.jsp",
                        icon: "fa fa-tachometer",
                        target: "_self"
                    })
                    layer.msg("user add successful!",function (){
                        window.parent.location.reload();
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    })
                } else {
                    layer.msg("name alread exist!",function (){
                        document.location.reload();
                    })
                }
            });
        });

    });
</script>

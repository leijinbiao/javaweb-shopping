<%--
  Created by IntelliJ IDEA.
  User: 波波哥
  Date: 2022/1/2
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
<link rel="stylesheet" href="../../css/public.css" media="all">
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">pid</label>
        <div class="layui-input-block">
            <input type="text" id="attributeId" name="pid" lay-verify="required" lay-reqtext="pid不能为空" placeholder="请输入pid" value="" class="layui-input">
            <tip></tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">类别名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="类别名称不能为空" placeholder="请输入类别名称" value="" class="layui-input">
            <tip></tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别描述</label>
        <div class="layui-input-block">
            <textarea name="descr" placeholder="请输入" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="saveBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>

<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script>
    layui.use(['form','miniTab','layer'], function () {
        var form = layui.form,
            layer = layui.layer,
            miniTab = layui.miniTab,
            $ = layui.jquery;
        //添加判断

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.post("adminServlet?action=addCategory",data.field,function (res) {
                parent.window.location.reload();
            });
        });

    });
</script>

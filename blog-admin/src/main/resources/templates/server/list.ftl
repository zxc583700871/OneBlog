<#include "/include/macros.ftl">
<@header>
    <link href="/assets/modules/textbus-1.1.0/textbus.min.css" rel="stylesheet">
</@header>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <@breadcrumb>
            <ol class="breadcrumb">
                <li><a href="/">首页</a></li>
                <li class="active">服务器管理</li>
            </ol>
        </@breadcrumb>
        <div class="x_panel">
            <div class="x_content">
                <div class="<#--table-responsive-->">
                    <table id="tree-table-box">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<@addOrUpdateMOdal defaultTitle="添加资源链接">
    <input type="hidden" name="id">
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ip">服务器IP <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="ip" id="ip" required="required" placeholder="请输入服务器IP"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cnnPort">远程端口 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="cnnPort" id="cnnPort" required="required" placeholder="请输入远程端口"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">登陆名 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="username" id="username" required="required" placeholder="请输入登陆名"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">登陆密码 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="password" id="password" required="required" placeholder="请输入登陆密码"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cloudType">云类型 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <select name="cloudType" id="cloudType" required="required" class="form-control col-md-7 col-xs-12">
                <option value="">请选择</option>
                <option value="tx">腾讯云</option>
                <option value="ali">阿里云</option>
            </select>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="usage">使用用途 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea name="usage" class="form-control col-md-7 col-xs-12" id="usage" placeholder="请输入使用用途" required="required"></textarea>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="btUrl">宝塔链接 </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="btUrl" id="btUrl" placeholder="请输入宝塔链接"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="btName">宝塔登陆名 </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="btName" id="btName" placeholder="请输入宝塔登陆名"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="btPassword">宝塔登陆密码 </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12" name="btPassword" id="btPassword" placeholder="请输入宝塔登陆密码"/>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">附加信息 </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea class="form-control col-md-7 col-xs-12" id="extContent" name="extContent" style="display: none"></textarea>
            <div id="textbus-editor"></div>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">附加信息是否加密 <span class="required">*</span></label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <ul class="list-unstyled list-inline">
                <li><input type="radio" class="flat" name="extContentEncryptible" value="1"> 加密</li>
                <li><input type="radio" class="flat" checked="checked" name="extContentEncryptible" value="0"> 不加密</li>
            </ul>
        </div>
    </div>
</@addOrUpdateMOdal>
<@footer>
    <script type="text/javascript" src="/assets/js/zhyd.treetable.js"></script>
    <script src="/assets/modules/textbus-1.1.0/textbus.min.js"></script>
    <script>
        $(function () {
            $.table.init({
                modalName: "资源",
                columns: [{
                    field: 'selectItem',
                    checkbox: true
                }, {
                    field: '-',
                    title: '层级',
                    width: "90px",
                    align: "center"
                }, {
                    field: 'name',
                    title: '资源名',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'id',
                    title: '资源ID',
                    width: '60px',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'type',
                    title: '资源类型',
                    width: '100px',
                    formatter: function (code) {
                        return code == 'menu' ? '菜单' : '按钮';
                    }
                }, {
                    field: 'url',
                    title: '资源地址',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'permission',
                    title: '资源权限',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'parent.name',
                    title: '父级资源',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'icon',
                    title: '资源图标',
                    width: '120px',
                    align: 'center',
                    formatter: function (code) {
                        return code ? '<i class="' + code + ' fa-fw"></i>'+ code : '-';
                    }
                }, {
                    field: 'sort',
                    title: '排序',
                    width: '70px',
                    align: 'center',
                    formatter: function (code) {
                        return code ? code : '-';
                    }
                }, {
                    field: 'external',
                    title: '外部资源',
                    width: '100px',
                    align: 'center',
                    formatter: function (code) {
                        return code ? '<span class="label label-success">是</span>' : '<span class="label label-danger">否</span>';
                    }
                }, {
                    field: 'available',
                    title: '可用',
                    width: '80px',
                    align: 'center',
                    formatter: function (code) {
                        return code ? '<span class="label label-success">可用</span>' : '<span class="label label-danger">不可用</span>';
                    }
                }]
            }, {
                listUrl: "/resources/list",
                getInfoUrl: "/resources/get/{id}",
                updateUrl: "/resources/edit",
                removeUrl: "/resources/remove",
                createUrl: "/resources/add",
                saveRolesUrl: "/resources/saveRoleResources"
            })
        });
    </script>
</@footer>

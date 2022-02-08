<#include "/include/macros.ftl">
<#setting number_format="#">
<@header>
    <link href="/assets/modules/textbus-1.1.0/textbus.min.css" rel="stylesheet">
    <style>
        .CodeMirror, .CodeMirror-scroll {
            min-height: 130px;
            max-height: 200px;
        }
        .CodeMirror .cm-spell-error:not(.cm-url):not(.cm-comment):not(.cm-tag):not(.cm-word) {
            background: none;
        }
    </style>
</@header>
    <div class="clearfix"></div>
    <form id="publishForm" class="form-horizontal form-label-left" novalidate>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <@breadcrumb>
                    <ol class="breadcrumb">
                        <li><a href="/">首页</a></li>
                        <li><a href="/articles">文章列表</a></li>
                        <li class="active">发布文章-Markdown 编辑器</li>
                    </ol>
                </@breadcrumb>
                <div class="x_panel">
                    <div class="x_title">
                        <h2>发布文章 <small>可以通过右上角“系统配置”-“文章编辑器”选择默认的文章发布编辑器</small></h2>
                        <#if !id??>
                            <ul class="nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a class="changeEditor" data-href="/article/publish-we">WangEditor 编辑器</a></li>
                                        <li><a class="changeEditor" data-href="/article/publish-tiny">TinyMCE 编辑器</a></li>
                                        <li><a class="changeEditor" data-href="/article/publish-textbus">Textbus 编辑器</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </#if>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <input type="hidden" name="id">
                        <input type="hidden" name="isMarkdown" value="0">
                        <input type="hidden" name="editorType" value="textbus">
                        <div class="item form-group">
                            <label class="control-label col-md-1 col-sm-1 col-xs-1" for="title">标题 <span class="required">*</span></label>
                            <div class="col-md-8 col-sm-8 col-xs-8">
                                <input type="text" class="form-control col-md-7 col-xs-12" name="title" id="title" required="required" placeholder="请输入标题"/>
                            </div>
                            <div class="col-md-1 col-sm-1 col-xs-1">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="square" checked name="original"> 原创
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="password">内容 <span class="required">*</span></label>
                            <div class="col-md-10 col-sm-10 col-xs-10">
                                <textarea class="form-control col-md-7 col-xs-12" id="content" name="content" style="display: none" required="required"></textarea>
                                <div id="textbus-editor"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-1 col-sm-1 col-xs-12"></label>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <button type="button" class="btn btn-success to-choose-info"><i class="fa fa-pencil"> 发布文章</i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@publishModal></@publishModal>
    </form>
</div>
<@chooseImgModal></@chooseImgModal>
<@footer>

    <script type="text/javascript" src="/assets/js/highlight.min.js"></script>
    <script type="text/javascript" src="/assets/modules/simplemde/simplemde.min.js"></script>
    <script type="text/javascript" src="/assets/js/inline-attachment.js"></script>
    <script type="text/javascript" src="/assets/js/codemirror.inline-attachment.js"></script>
    <script>
        articleId = '${id}';
        editorType = 'textbus';
        $(function () {
            var op = {
                id: "textbus-editor",
                uniqueId: "textbus-editor_1",
                uploadUrl: "/api/uploadFile"
            };
            zhyd.textbusEditor.init(op);
        });
    </script>
    <script src="/assets/js/zhyd.publish-article.js"></script>
</@footer>

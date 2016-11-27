<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>设备列表</title> 

<link href="css/base.css" rel="stylesheet">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
<link rel="stylesheet" href="css/providers.css">
<!-- <link href="css/basic_info.css" rel="stylesheet"> -->
<style type="text/css">
    html, body{ margin:0; height:100%; }
</style>


<script type="text/javascript" src="../custom/jquery.min.js"></script>
<script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../custom/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SP7yzbUEjZyftws3bxA2eBuhlT03b0cn"></script>
<!-- <style type="text/css">
    #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style> -->

</head> 
<body>
    <div class="container" style="width: 100%;height: 100%">
        <div class="left-tree" style="height: 100%;width: 20%;position:relative" >
             <table id="dg" style="height:100%;width: 100%" title="设备列表" data-options="
                rownumbers:false,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                fitColumns:true,
                striped:true,
                checkOnSelect:false,
                selectOnCheck:false,
                collapsible:true,
                toolbar:'#tb',
                pageSize:20">
                <thead>
                    <tr>
                        <th field="code" width="110">设备编码</th>
                    </tr>
                </thead>
            </table>
            <div id="tb" style="padding:0 0px;">
                设备编码查询: <input class="easyui-textbox" type="text" name="code" style="width:130px;height:35px;line-height:35px;"></input>
                <!-- 供应商名称: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input> -->
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true" style="width: 20%"></a>
                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-reload" style="width: 50%">重置</a> -->
            </div>
        </div>
        <div class="content" style="position:absolute;left:20%;top: 0;width: 80%;height: 100%">
            <div id="allmap" style="height:100%;width: 100%">
        </div>
    </div>

    <script type="text/javascript">
            (function($){
            function pagerFilter(data){
                if ($.isArray(data)){   // is array
                    data = {
                        total: data.length,
                        rows: data
                    }
                }
                var target = this;
                var dg = $(target);
                var state = dg.data('datagrid');
                var opts = dg.datagrid('options');
                if (!state.allRows){
                    state.allRows = (data.rows);
                }
                if (!opts.remoteSort && opts.sortName){
                    var names = opts.sortName.split(',');
                    var orders = opts.sortOrder.split(',');
                    state.allRows.sort(function(r1,r2){
                        var r = 0;
                        for(var i=0; i<names.length; i++){
                            var sn = names[i];
                            var so = orders[i];
                            var col = $(target).datagrid('getColumnOption', sn);
                            var sortFunc = col.sorter || function(a,b){
                                return a==b ? 0 : (a>b?1:-1);
                            };
                            r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
                            if (r != 0){
                                return r;
                            }
                        }
                        return r;
                    });
                }
                var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = state.allRows.slice(start, end);
                return data;
            }

            var loadDataMethod = $.fn.datagrid.methods.loadData;
            var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
            $.extend($.fn.datagrid.methods, {
                clientPaging: function(jq){
                    return jq.each(function(){
                        var dg = $(this);
                        var state = dg.data('datagrid');
                        var opts = state.options;
                        opts.loadFilter = pagerFilter;
                        var onBeforeLoad = opts.onBeforeLoad;
                        opts.onBeforeLoad = function(param){
                            state.allRows = null;
                            return onBeforeLoad.call(this, param);
                        }
                        var pager = dg.datagrid('getPager');
                        pager.pagination({
                            onSelectPage:function(pageNum, pageSize){
                                opts.pageNumber = pageNum;
                                opts.pageSize = pageSize;
                                pager.pagination('refresh',{
                                    pageNumber:pageNum,
                                    pageSize:pageSize
                                });
                                dg.datagrid('loadData',state.allRows);
                            }
                        });
                        $(this).datagrid('loadData', state.data);
                        if (opts.url){
                            $(this).datagrid('reload');
                        }
                    });
                },
                loadData: function(jq, data){
                    jq.each(function(){
                        $(this).data('datagrid').allRows = null;
                    });
                    return loadDataMethod.call($.fn.datagrid.methods, jq, data);
                },
                deleteRow: function(jq, index){
                    return jq.each(function(){
                        var row = $(this).datagrid('getRows')[index];
                        deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                        var state = $(this).data('datagrid');
                        if (state.options.loadFilter == pagerFilter){
                            for(var i=0; i<state.allRows.length; i++){
                                if (state.allRows[i] == row){
                                    state.allRows.splice(i,1);
                                    break;
                                }
                            }
                            $(this).datagrid('loadData', state.allRows);
                        }
                    });
                },
                getAllRows: function(jq){
                    return jq.data('datagrid').allRows;
                }
            })
        })(jQuery);

        function getData(){
            var rows = [];
            for(var i=1; i<=800; i++){
                rows.push({
                    code: '10695'//,
                    // name: '南京天泽星网股份有限公司',
                    // level: '正式',
                    // provide: '光纤通信设备配件',
                    // full: '√',
                    // issubmit: '√',
                    // status:'已审核',
                    // note: '-'
                });
            }
            return rows;
        }
        
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });        
    </script>
</body> 
</html>
<script type="text/javascript">               
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(113.820265,36.0604873333333);
    map.centerAndZoom(point, 12);
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>
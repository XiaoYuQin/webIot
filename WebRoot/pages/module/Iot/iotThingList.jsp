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

        <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
        <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css">

        <script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>


        <style type="text/css">
            html, body{ margin:0; height:100%; }
        </style>

    </head> 
    <body>
        <div class="container" style="width: 100%;height: 100%">
           <table id="dg" style="width:100%;height:100%" title="全体设备列表" data-options="
                    rownumbers:true,
                    singleSelect:false,
                    autoRowHeight:false,
                    pagination:true,
                    fitColumns:true,
                    striped:true,
                    checkOnSelect:false,
                    selectOnCheck:false,
                    collapsible:true,
                    toolbar:'#tb',
                    pageSize:10">
                <thead>
                    <tr href="#">
                        <th field="code" width="110">设备编码</th>
                        <th field="name" width="226">设备名称</th>
                        <th field="level" width="112">设备类型</th>
                        <th field="provide" width="170">所属部门</th>
                        <th field="full" width="130">所在地区</th>
                        <th field="issubmit" width="136">使用状况</th>
                        <th field="status" width="120">责任人</th>
                        <th field="note" width="105">备注</th>
                    </tr>
                </thead>
            </table>
          <div id="tb" style="padding:0 30px;">
            <div class="conditions">
                <span class="con-span">设备编码: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
                <span class="con-span">设备名称: </span><input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
                <a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>
            </div>
            <div class="conditions hide">
                <span class="con-span">责任人: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
                <span class="con-span">所在地区: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
                <span class="con-span">使用状况: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>正常</option><option>维护</option><option>维修</option></select>
                <span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">
            </div>
    <!--         <div class="conditions hide">
                <span class="con-span">公司代码: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
                <span class="con-span">公司名称: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>公司名称</option></select>
                <span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">
                <span class="con-span">合同状态: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            </div> -->
            <div class="opt-buttons">
                <a href="#" class="easyui-linkbutton" data-options="selected:true">新增</a>
                <!-- <a href="#" class="easyui-linkbutton">发布</a>
                <a href="#" class="easyui-linkbutton">取消发布</a>
                <a href="#" class="easyui-linkbutton">标记为执行完毕</a> -->
                <a href="#" class="easyui-linkbutton">导出</a>
            </div>
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
                        code: '10695',
                        name: '充电试验台',
                        level: '检测设备',
                        provide: '研发部',
                        full: '北京',
                        issubmit: '正常使用',
                        status:'张一',
                        note: '-'
                    });
                }
                return rows;
            }
            
            $(function(){
                $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
            });    


            $(".more").click(function(){
                $(this).closest(".conditions").siblings().toggleClass("hide");
            });
        </script>
    </body> 
</html>

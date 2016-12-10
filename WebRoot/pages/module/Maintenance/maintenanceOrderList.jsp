<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>设备列表</title> 

<link href="<%=basePath%>/pages/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" href="<%=basePath%>/pages/css/providers1.css">

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

<style type="text/css">
    html, body{ margin:0; height:100%; }
</style>
<style type="text/css" media=print>  
.Noprint{display : none }  
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
                pageSize:20">
            <thead>
                <tr href="#">
                    <th field="t1" width="10%" data-options="align:'center',editor:'text'">维修单号</th>
                    <th field="t2" width="6%" data-options="align:'center',editor:'text'">客户名称</th>
                    <th field="t3" width="12%" data-options="align:'center',editor:'text'">项目名称</th>
                    <th field="t4" width="4%" data-options="align:'center',editor:'text'">报修人</th>
                    <th field="t5" width="9%" data-options="align:'center',editor:'text'">产品编号</th>
                    <th field="t6" width="20%" data-options="align:'center',editor:'text'">故障描述</th>
                    <th field="t7" width="20%" data-options="align:'center',editor:'text'">故障原因</th>
                    <th field="t8" width="20%" data-options="align:'center',editor:'text'">维修结果</th>
                    <th field="t9" width="4%" data-options="align:'center',editor:'text'">维修人员</th>
                    <th field="t10" width="18%" data-options="align:'center',editor:'text'">备注</th>
                    <th field="t11" width="4%" data-options="align:'center',editor:'text'">审批结果</th>          
                    <th field="t12" width="4%" data-options="align:'center',editor:'text'">维修单</th>
                    <th field="t12" width="4%" data-options="align:'center',editor:'text'">日志</th>
                </tr>
            </thead>
        </table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions">
			<span class="con-span">填写时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">        
            <span class="con-span">客户名称: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>           
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
            <a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>
        </div>
        <div class="conditions hide">
            <span class="con-span">客户名称: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">项目名称: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
        </div>
<!--         <div class="conditions hide">
            <span class="con-span">公司代码: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">公司名称: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>公司名称</option></select>
            <span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">
            <span class="con-span">合同状态: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
        </div> -->
<!--         <div class="opt-buttons">
            <a href="#" class="easyui-linkbutton" data-options="selected:true">新增</a>
            <a href="#" class="easyui-linkbutton">导出</a>
			<a href="#" class="easyui-linkbutton" onclick="printPreView()">打印预览</a>
			<a href="#" class="easyui-linkbutton" onclick="printIt()">打印</a>
			<a href="#" class="easyui-linkbutton" onclick="printSetup()">打印设置</a>
        </div> -->
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

        function getData()
        {
            var rows = [];
            for(var i=0; i<50; i++){
                rows.push({
                    t1: 'GN-WXD-20160314-001',
                    t2: '北京公交公司',
                    t3: '金龙9',
                    t4: '李德生',
                    t5: '1256487532',
                    t6: '无法充电',
                    t7: '电池损耗',
                    t8:'已维修',    
                    t9:'郭淑琴',
                    t10:'-',
                    t11: '2016/12/6',
                    t12: "<a href='#' onclick='viewMaintenanceOrder()'>查看</a>",
                    t13: "<a href='#' onclick='viewLog()'>查看</a>"
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

		var printSetup = function(){      
			window.execwb(8,1);      
			// $("#dg").printArea();  
		}      
		var printPreView = function(){      
		// 　　  document.all.wb.execwb(7,1);    　　      
			// $("#dg").printArea();  
		}      
		var printIt = function(){      
			if (confirm('确定打印吗？')) {      
				//wb.execwb(6,6)   ;  
		        window.print();//update by liuguocheng  		   
			}
		}
		
		var windowClose = function(){  
		    window.opener=null;   
		    window.open('','_self');   
		    window.close();  
		};  

        function viewMaintenanceOrder()
        {
                window.open ('<%=basePath%>/pages/module/Maintenance/maintenanceOrder.jsp', 'newwindow', 'height=768px, width=1024px, scrollbars=yes, resizable=yes');    
        }
        function viewLog()
        {


        }
    </script>
</body> 
</html>
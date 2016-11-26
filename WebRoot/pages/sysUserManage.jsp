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
    <title>供应商列表</title> 

<link href="css/base.css" rel="stylesheet">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
<link rel="stylesheet" href="css/providers.css">
</head> 
<body>
	<div id="dlg" class="easyui-dialog" title="新建申请" data-options="closed:true" style="width:700px;height:490px;padding:10px;">
		<div class="conditions">
            <span class="con-span">用户名</span><input class="easyui-textbox" type="text" name="code" style="width:80px;height:35px;line-height:35px;"></input>           
			<!-- <span class="con-span">审批人: </span><select class="easyui-combobox" name="language" style="height:35px;width:80px;"><option>领导1</option><option>领导2</option></select>            
			<span class="con-span">选择文件: </span><input class="easyui-filebox" name="file1" buttonText="选择文件" data-options="prompt:'选择文件'" style="width:166px;height:35px;">
			<span class="con-span">日期: </span><input class="easyui-textbox" type="text" name="code" style="width:120px;height:35px;line-height:35px;" prompt="2016/11/26 10:13"></input>            -->
        </div>        
        <div class="conditions" style="margin-top: 30px">
        	<div class="con-span">审批描述: </div>
        	<div class="con-span" style="margin-top: 10px"></div>
        	<div id="editor-state" class="editor-state"></div>	        		
        </div>   
        <div class="conditions" style="margin-top: 30px">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">确定</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-reload">取消</a>       		
        </div>  					
	</div>

    <div class="container">
       <table id="dg" style="width:100%;height:554px" title="全体供应商列表" data-options="
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
                <tr>
                    <th field="userName" width="110">账户名</th>
                    <th field="trueName" width="110">实际姓名</th>
                    <th field="section" width="110">所在部门</th>
					<th field="position" width="110">职位</th>                    
                    <th field="mail" width="226">邮箱</th>
                    <!-- <th field="secrety" width="112">密码</th> -->
                    <th field="sigupDate" width="170">注册时间</th>
                    <th field="status" width="130">状态</th>
                    <!-- <th field="deal" width="136">操作</th> -->
                </tr>
            </thead>
        </table>
      <div id="tb" style="padding:0 30px;">
        实际姓名: <input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
        所在部门: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
      </div>
    </div>
    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../custom/easyui-lang-zh_CN.js"></script>


    
  

    
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
			rows.push({
		        userName: 'xiaming',
		        trueName: '夏明',
		        section: '售后部',
		        position: '技术员',
		        mail: 'xiaming@xxx.com',
		        sigupDate: '2013-09-09 15:05',
		        status: '正常'
		    });
			rows.push({
		        userName: 'zhangmo',
		        trueName: '张默',
		        section: '售后部',
		        position: '技术员',
		        mail: 'zhangmo@xxx.com',
		        sigupDate: '2013-09-09 15:05',
		        status: '正常'
		    });
			rows.push({
		        userName: 'lili',
		        trueName: '李丽',
		        section: '研发部',
		        position: '硬件工程师',
		        mail: 'lili@xxx.com',
		        sigupDate: '2013-09-09 15:05',
		        status: '正常'
		    });
			rows.push({
		        userName: 'lidesheng',
		        trueName: '李德生',
		        section: '研发部',
		        position: '软件工程师',
		        mail: 'lidesheng@xxx.com',
		        sigupDate: '2013-09-09 15:05',
		        status: '正常'
		    });                           
		    return rows;
		}
	    $('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: "文件审批",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		            // alert('code:' + row.code + "\n LoginID:" + row.name);  
		            $('#dlg').dialog('open');
		        }  
		    }  
		})
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });        
    </script>
</body> 
</html>

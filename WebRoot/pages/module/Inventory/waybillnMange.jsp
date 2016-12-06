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
    <title>用户列表</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

<style type="text/css">
    html, body{ margin:0; height:100%; width: 100%}
    .con-span{font-size: 15px}
</style>
</head> 
<body>
    <div class="container" style="width: 100%;height:100%">
       <table id="dg" style="width:100%;height:100%" title="全体供应商列表" data-options="
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                fitColumns:true,
                striped:true,
                checkOnSelect:true,
                selectOnCheck:true,
                collapsible:true,
                toolbar:'#tb',
                pageSize:10">
            <thead>
                <tr>
                	<th field="ck" data-options="checkbox:true"></th>                
                    <th field="t1" width="5%">发货人</th>
                    <th field="t2" width="10%">发货地点</th>
					<th field="t3" width="10%">发货时间</th>                    
                    <th field="t4" width="10%">收货地点</th>
                    <th field="t5" width="5%">收货人</th>
                    <th field="t6" width="10%">运单号码</th>
                    <th field="t7" width="27%">主题</th>
                    <th field="t8" width="20%">运单最新状态</th>
                </tr>
            </thead>
        </table>
			<div id="tb" style="padding:0 30px;">
			<div class="conditions">
				<span class="con-span">发货人: </span>
				<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
            	<a class="con-span">发货地点: </a>
            	<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
                <span class="con-span">发货时间: </span>
                <input class="easyui-datebox" style="width:160px;height:35px;line-height:35px;">               	
				<span class="con-span">收货地点: </span>
				<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
                <span class="con-span">收货人: </span>
                <input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
				<span class="con-span">运单号码: </span>
				<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>                           

			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			<a id="creat" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >新增</a>                                
			<!-- <a id="modify" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >修改</a>   		     -->
			    <!--<a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>-->
			</div>
		</div>   
    </div>
	<div id="dlgCreat" class="easyui-dialog" title="用户设置" data-options="closed:true,buttons:'#dlg-buttons'" style="width:580px;height:250px;padding:10px;">
	    <div class="conditions">
			<a class="con-span">&#12288;发货人：</a>
			<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
	        <a class="con-span">发货地点：</a>
	        <input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>  			
	    </div>  		                 
	    <div class="conditions" style="margin-top: 10px">
	        <a class="con-span">发货时间：</a>
	        <input class="easyui-datebox" style="width:160px;height:35px;line-height:35px;">            
	        <a class="con-span">收货地点：</a>
	        <input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
	    </div>                					
	    <div class="conditions" style="margin-top: 10px">
	        <a class="con-span">&#12288;收货人：</a>
	        <input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
	        <a class="con-span">运单号码：</a>
			<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           	        
	    </div>          
	</div>
	<div id="dlg-buttons">
		<table cellpadding="0" cellspacing="0" style="width:100%">
			<tr>
				<td>
					<!-- <img src="email.gif"/> -->
				</td>
				<td style="text-align:right">
					<a id="btnCreatSave" href="#" class="easyui-linkbutton" iconCls="icon-save">保存</a>
					<a id="btnCreatCancel" href="#" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="dlgModify" class="easyui-dialog" title="运单详情" data-options="closed:true" style="width:450px;height:350px;padding:10px;">
	    <div class="conditions">
	       	<div style="font-size: 22px;margin-top: 10px">北京分部2016/12/7 12:22:22接收快件</div>
	       	<div style="font-size: 22px;margin-top: 10px">北京分部2016/12/7 12:22:22发出快件</div>
	       	<div style="font-size: 22px;margin-top: 10px">山西分部收到快件</div>
	       	<div style="font-size: 22px;margin-top: 10px">山西分部于2016/12/7 12:22:22收到快件</div>
	       	<div style="font-size: 22px;margin-top: 10px">2016/12/7 12:22:22快已签收</div>
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

			rows.push({
		        t1: '夏明',
		        t2: '北京',
		        t3: '2016/12/6',
		        t4: '山西',
                t5: '李明生',
				t6: '2124156113',
		        t7: '山西售后部12月份备件补充',
		        t8: '已签收'               
		    });
			rows.push({
		        t1: '夏明',
		        t2: '北京',
		        t3: '2016/12/6',
		        t4: '山西',
                t5: '李明生',
				t6: '2124156113',
		        t7: '山西售后部11月份备件补充',
		        t8: '已签收'               
		    });
			rows.push({
		        t1: '夏明',
		        t2: '北京',
		        t3: '2016/12/6',
		        t4: '山西',
                t5: '李明生',
				t6: '2124156113',
		        t7: '山西售后部10月份备件补充',
		        t8: '已签收'               
		    });					
		    return rows;
		}
	    $('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: ""
		})
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });



        $('#modify').click(function(){
        	console.info("modify click");
        	var checkedItems = $('#dg').datagrid('getChecked');
        	var name;
        	$.each(checkedItems,function(index,item)
        	{
        		console.info(item.name);
        		name=item.name;
        	});
			// console.info("checkedItems len = "+checkedItems.length);
        	if(checkedItems.length > 0)
        	{
        		// $('#dlgModifyName').text(name);
				$('#dlgModify').dialog('open');
        	}
        	else
        	{
				$.messager.alert('提醒',"<font size='4px'>你必须选择一个项目!</font>",'info');
        	}

        	
        });     
        $('#creat').click(function(){
        	$('#dlgCreat').dialog('open');
        });            
        $('#btnModifyDelete').click(function(){
        	$.messager.alert('提醒',"<font size='4px'>你确定要删除该联系人?</font>",'warning');
        });

        $('#btnModifySave').click(function(){

			$.messager.show({
				title:'保存',
				msg:'修改联系人保存成功',
				timeout:3000,
				showType:'slide'
			});	

			$('#dlgModify').dialog('close');
        }); 
		$('#btnCreatSave').click(function(){

			$.messager.show({
				title:'创建',
				msg:'创建联系人成功',
				timeout:3000,
				showType:'slide'
			});	

			$('#dlgCreat').dialog('close');
			$('#dg').datagrid('reload');
        }); 
		$('#btnCreatCancel').click(function(){
			$('#dlgCreat').dialog('close');
        }); 


		$('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: "文件审批",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		        	$('#dlgModify').dialog('open');
		            // alert('code:' + row.t1 + "\n LoginID:" + row.t2);  
		            // $('#dlg').dialog('open');
		        }  
		    }  
		})

    </script>
</body> 
</html>

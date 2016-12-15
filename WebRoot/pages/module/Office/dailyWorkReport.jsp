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
    <title>工作日志</title> 

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">
	<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/basic_info.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/platform.css"> -->

	<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>


	<!-- <link href="css/base.css" rel="stylesheet">
	<link rel="stylesheet" href="../custom/uimaker/easyui.css">
	<link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
	<link rel="stylesheet" href="css/providers.css"> -->

	<!-- 
	<script type="text/javascript" src="../custom/jquery.min.js"></script>
	<script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../custom/easyui-lang-zh_CN.js"></script> -->

	<style type="text/css">
	    html, body{ margin:0; height:100%; }
	    .info{font-size:15px}
	</style>
</head> 
<body>
	<div class="easyui-panel" style="width: 100%;height: 100%">
		<div class="easyui-tabs1" style="width:100%;height:100%">
			<div title="发日志" data-options="closable:false" class="basic-info">		
				<div class="easyui-panel" style="width: 100%;height: 100%;">
					<div class="easyui-layout" style="width: 100%;height: 100%">						
						<div data-options="region:'east'" style="width:20%;"></div>
						<div data-options="region:'west'" style="width:20%;"></div>
						<div data-options="region:'center'">
							<div style="font-size: 25px;text-align: center;">区域主任每日工作日报</div>
							<br/>
							<br/>
						   	<span class="info" style="margin-left: 30px">汇报人：</span>
						   	<span class="info">焦润连</span>
						   	<span class="info">&#12288;&#12288;</span>
						   	<span class="info">汇报时间：</span>
						   	<span class="info">2016/11/20</span>
						   	<span class="info">&#12288;&#12288;</span>
						   	<span class="info">区域：</span>
						   	<span class="info">华北</span>				

							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="tt" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:true"
										title="<font size='3px'>今日维修</font>">
									<thead>
										<tr>
											<th data-options="field:'productid',formatter:productFormatter,
													editor:{
														type:'combobox',
														options:{
															valueField:'productid',
															textField:'name',
															data:products,
															required:true
														}
													}" style="width: 10%">运营地</th>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 10%;">项目</th>
											<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 67%">故障描述</th>
											<th data-options="field:'attr1',editor:'text'" style="width: 10%">维修进度</th>
										</tr>
									</thead>
								</table>
							</div>	
							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="td" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:true"
										title="<font size='3px'>今日回访</font>">
									<thead>
										<tr>
											<th data-options="field:'productid',formatter:productFormatter,
													editor:{
														type:'combobox',
														options:{
															valueField:'productid',
															textField:'name',
															data:products,
															required:true
														}
													}" style="width: 10%">运营地</th>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 10%;">联系人</th>
											<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">联系方式</th>
											<th data-options="field:'attr1',editor:'text'" style="width: 67%">回访结果</th>
										</tr>
									</thead>
								</table>
							</div>	
							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="ta" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:true"
										title="<font size='3px'>今日巡访</font>">
									<thead>
										<tr>
											<th data-options="field:'productid',formatter:productFormatter,
													editor:{
														type:'combobox',
														options:{
															valueField:'productid',
															textField:'name',
															data:products,
															required:true
														}
													}" style="width: 10%">运营地</th>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 10%;">联系人</th>
											<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">联系方式</th>
											<th data-options="field:'attr1',editor:'text'" style="width: 67%">巡防结果</th>
										</tr>
									</thead>
								</table>
							</div>	
							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="tc" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:true"
										title="<font size='3px'>今日拓展</font>">
									<thead>
										<tr>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 97%;">今日拓展工作进展</th>
										</tr>
									</thead>
								</table>
							</div>	
							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="te" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:false"
										title="<font size='3px'>今日培训</font>">
									<thead>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 20%;">对象</th>							
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 10%;">人数</th>
											<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 40%">主题</th>
											<th data-options="field:'attr1',editor:'text'" style="width: 10%">时长</th>
											<th data-options="field:'attr1',editor:'text'" style="width: 10%">效果</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="easyui-panel" style="width: 98%;height: 400px;margin-top: 10px;">
								<table id="tf" style="width:100%;height:100% ;"
										data-options="singleSelect:true,idField:'itemid',url:'datagrid_data2.json',rownumbers:true"
										title="<font size='3px'>今日管理</font>">
									<thead>
										<tr>
											<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 49%;">管理或计划项目</th>
											<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 48%">管理结果或计划进度</th>							
										</tr>
									</thead>
								</table>
							</div>
<!-- 							<div class="easyui-panel" style="width: 98%;height: 200px;margin-top: 10px;">
								<div id="dlg-buttons">
									<table cellpadding="0" cellspacing="0" style="width:100%">
										<tr>
											<td style="text-align:left;">
												<a id="btnSubimt" href="#" class="easyui-linkbutton">提交</a>
											</td>
											<td style="text-align:right">
												<a id="btnCreatSave" href="#" class="easyui-linkbutton" iconCls="icon-save">保存</a>
												<a id="btnCreatCancel" href="#" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
											</td>
										</tr>
									</table>
								</div>																					
							</div> -->
													
							<div id="dlg-buttons">
								<table cellpadding="0" cellspacing="0" style="width:100%">
									<tr>
										<td style="text-align:left;">
											<a id="btnSubimt" href="#" class="easyui-linkbutton">提交</a>
										</td>
										<td style="text-align:right">
											<a id="btnCreatSave" href="#" class="easyui-linkbutton" iconCls="icon-save">保存</a>
											<a id="btnCreatCancel" href="#" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
										</td>
									</tr>
								</table>
							</div>							
						</div>
					</div>
					
				</div>			
		  </div>
		  <div title="我发出的" data-options="closable:false"></div>
		  <div title="我收到的" data-options="closable:false"></div>
		  <div title="日志报表" data-options="closable:false"></div>
		</div>
	</div>


 
	<script type="text/javascript">
		$('.easyui-tabs1').tabs({
		  tabHeight: 36
		});
		$(window).resize(function(){
			$('.easyui-tabs1').tabs("resize");
		}).resize();     
		function addTabs(title,href)
		{
			var jq = top.jQuery;    
			if (jq("#ta").tabs('exists', title))
			{    
			    jq("#ta").tabs('select', title);    
			} 
			else 
			{  
			      var content = '<iframe scrolling="auto" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';     
			       jq("#ta").tabs('add',{    
			                          title:title,    
			                          content:content,    
			                          closable:true    
			                        });    
			 }   
		}     
	</script>
</body> 
</html>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#tt').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#tt').datagrid('endEdit', lastIndex);
					$('#tt').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#tt').datagrid('getRows').length-1;
					$('#tt').datagrid('selectRow', lastIndex);
					$('#tt').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#tt').datagrid('getSelected');
					if (row){
						var index = $('#tt').datagrid('getRowIndex', row);
						$('#tt').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#tt').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#tt').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#tt').datagrid('endEdit', lastIndex);
					$('#tt').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#td').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#td').datagrid('endEdit', lastIndex);
					$('#td').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#td').datagrid('getRows').length-1;
					$('#td').datagrid('selectRow', lastIndex);
					$('#td').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#td').datagrid('getSelected');
					if (row){
						var index = $('#td').datagrid('getRowIndex', row);
						$('#td').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#td').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#td').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#td').datagrid('endEdit', lastIndex);
					$('#td').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#ta').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#ta').datagrid('endEdit', lastIndex);
					$('#ta').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#ta').datagrid('getRows').length-1;
					$('#ta').datagrid('selectRow', lastIndex);
					$('#ta').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#ta').datagrid('getSelected');
					if (row){
						var index = $('#ta').datagrid('getRowIndex', row);
						$('#ta').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#ta').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#ta').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#ta').datagrid('endEdit', lastIndex);
					$('#ta').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#tc').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#tc').datagrid('endEdit', lastIndex);
					$('#tc').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#tc').datagrid('getRows').length-1;
					$('#tc').datagrid('selectRow', lastIndex);
					$('#tc').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#tc').datagrid('getSelected');
					if (row){
						var index = $('#tc').datagrid('getRowIndex', row);
						$('#tc').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#tc').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#tc').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#tc').datagrid('endEdit', lastIndex);
					$('#tc').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#te').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#te').datagrid('endEdit', lastIndex);
					$('#te').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#te').datagrid('getRows').length-1;
					$('#te').datagrid('selectRow', lastIndex);
					$('#te').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#te').datagrid('getSelected');
					if (row){
						var index = $('#te').datagrid('getRowIndex', row);
						$('#te').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#te').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#te').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#te').datagrid('endEdit', lastIndex);
					$('#te').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
<script>
	var products = [
	    {productid:'FI-SW-01',name:'房山'},
	    {productid:'K9-DL-01',name:'天津'}
	];
	function productFormatter(value){
		for(var i=0; i<products.length; i++){
			if (products[i].productid == value) return products[i].name;
		}
		return value;
	}
	$(function(){
		var lastIndex;
		$('#tf').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#tf').datagrid('endEdit', lastIndex);
					$('#tf').datagrid('appendRow',{
						itemid:'',
						productid:'',
						listprice:'',
						unitprice:'',
						attr1:''
					});
					lastIndex = $('#tf').datagrid('getRows').length-1;
					$('#tf').datagrid('selectRow', lastIndex);
					$('#tf').datagrid('beginEdit', lastIndex);
				}
			},'-',{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var row = $('#tf').datagrid('getSelected');
					if (row){
						var index = $('#tf').datagrid('getRowIndex', row);
						$('#tf').datagrid('deleteRow', index);
					}
				}
			},'-',{
				text:'提交',
				iconCls:'icon-save',
				handler:function(){
					$('#tf').datagrid('acceptChanges');
				}
			},'-',{
				text:'取消',
				iconCls:'icon-undo',
				handler:function(){
					$('#tf').datagrid('rejectChanges');
				}
			}],
			onBeforeLoad:function(){
				$(this).datagrid('rejectChanges');
			},
			onClickRow:function(rowIndex){
				if (lastIndex != rowIndex){
					$('#tf').datagrid('endEdit', lastIndex);
					$('#tf').datagrid('beginEdit', rowIndex);
				}
				lastIndex = rowIndex;
			}
		});
	});
</script>
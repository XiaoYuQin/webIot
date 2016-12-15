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
    <title>售后维修单</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css">

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>


<style type="text/css">
    html, body{ margin:0; height:100%;width: 100% }
    .con-span{font-size: 15px}
    .kv-content{border:1px #cacaca solid;}
    /*新增/修改用户时，是否管理员样式保持与easyui一致*/
    .radioSpan {
      position: relative;
      /*border: 1px solid #95B8E7;*/
      background-color: #fff;
      vertical-align: middle;
      display: inline-block;
      overflow: hidden;
      white-space: nowrap;
      margin: 0;
      padding: 0;
      -moz-border-radius: 5px 5px 5px 5px;
      -webkit-border-radius: 5px 5px 5px 5px;
      /*border-radius: 5px 5px 5px 5px;*/
      display:block;
    }
</style>
</head> 
<body>

	<div class="easyui-panel" title="" style="width: 100%;height: 100%;">
		<div class="conditions">
			<span class="con-span">箱体外观: </span>
			<select class="easyui-combobox" name="language" panelHeight='auto' style="height:35px;width:70px;"><option>正常</option><option>异常</option></select>            				 
			<span class="con-span">连接插件: </span>
			<select class="easyui-combobox" name="language" panelHeight='auto' style="height:35px;width:70px;"><option>正常</option><option>异常</option></select>            				 
			<span class="con-span">数据采集: </span>
			<select class="easyui-combobox" name="language" panelHeight='auto' style="height:35px;width:70px;"><option>正常</option><option>异常</option></select>            				 
			<span class="con-span">绝缘检测: </span>
			<select class="easyui-combobox" name="language" panelHeight='auto' style="height:35px;width:70px;"><option>正常</option><option>异常</option></select>            				 						
		</div>  
		<div class="conditions" style="margin-top: 5px">
			<span class="con-span">单体电压：</span>
<!-- 		</div>
		<div class="conditions" style="margin-top: 10px"> -->
			<span class="con-span">最高: </span>
			<input class="easyui-textbox" type="text" name="code" style="width:70px;height:35px;line-height:35px;"></input>  
			<span class="con-span">最低: </span>
			<input class="easyui-textbox" type="text" name="code" style="width:70px;height:35px;line-height:35px;"></input>  						
		</div>  
		<div class="conditions" style="margin-top: 5px">
			<span class="con-span">电池温度：</span>
<!-- 		</div>
		<div class="conditions" style="margin-top: 10px"> -->
			<span class="con-span">最高: </span>
			<input class="easyui-textbox" type="text" name="code" style="width:70px;height:35px;line-height:35px;"></input>  
			<span class="con-span">最低: </span>
			<input class="easyui-textbox" type="text" name="code" style="width:70px;height:35px;line-height:35px;"></input>  						
		</div>  
		<div class="conditions" style="margin-top: 10px">
			<span class="con-span">故障类别: </span>
			<select class="easyui-combobox" name="language" panelHeight='auto' style="height:35px;width:100px;"><option>保内</option><option>保外</option><option>意外损坏</option></select>            				 						
		</div>  
		<div class="conditions" style="margin-top: 10px;">
			<span class="con-span">故障描述: </span>
			<input class="easyui-textbox" data-options="multiline:true" value="" style="width:525px;height:70px">	        
		</div>	
		<div class="conditions" style="margin-top: 10px;">
			<span class="con-span">故障原因: </span>
			<input class="easyui-textbox" data-options="multiline:true" value="" style="width:525px;height:70px">	        
		</div>	
		<div class="conditions" style="margin-top: 10px;">
			<span class="con-span">备件列表: </span>
		</div>			
		<div class="conditions" style="margin-top: 10px;height: 230px;margin-left: 68px">
	        <a class="easyui-panel" style="width: 530px;height: 230px;">
				<table id="te" style="width:100%;height:100% ;"
						data-options="
		                checkOnSelect:true,
		                selectOnCheck:true,
						idField:'itemid',
						url:'datagrid_data2.json',
						rownumbers:true">
					<thead>
						<tr>
							<th field="ck" data-options="checkbox:true"></th>      
							<th data-options="field:'x1',align:'center',editor:'text'" style="width: 200px">物料编码</th>
							<th data-options="field:'x2',align:'center',editor:'text'" style="width: 170px">物料名称</th>		
							<th data-options="field:'x3',align:'center',editor:'text'" style="width: 200px">规格</th>	
							<th data-options="field:'x4',align:'center',editor:'text'" style="width: 80px">数量</th>			
							<th data-options="field:'x5',align:'center',editor:'text'" style="width: 80px">单位</th>								
						</tr>
					</thead>
				</table>
			</a>
		</div>	    
		<!-- </div>			 -->
	</div>
	

</body> 
</html>
<script type="text/javascript">
	$(function()
	{
		var lastIndex;
		$('#te').datagrid({
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:function(){
					$('#dlgNew').dialog('open');
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

	function getSpareData()
	{
	    var rows = [];

		rows.push({
	        x1: 'A0200101001',
	        x2: '继电器',
	        x3: 'LEV100-24V',
	        x4: '3',
	        x5: '个'                 
	    });	
	    rows.push({
	        x1: 'A0200508002',
	        x2: '硅胶垫2',
	        x3: 'GN-AK8.1EV-2107517',
	        x4: '1',
	        x5: '件'                 
	    });
	    rows.push({
	        x1: 'A0200101011',
	        x2: '继电器',
	        x3: 'AEV19024',
	        x4: '6',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200306006',
	        x2: '弹垫',
	        x3: 'M10  镀锌',
	        x4: '100',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200302046',
	        x2: '外六角螺栓',
	        x3: 'M6*12  不锈钢',
	        x4: '30',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200404006',
	        x2: '护套',
	        x3: 'DJ33541',
	        x4: '18',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200406008',
	        x2: '绝缘支柱',
	        x3: 'SM7110',
	        x4: '50',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200407204',
	        x2: '扎带',
	        x3: '3*100',
	        x4: '1',
	        x5: '包'                 
	    });
	    rows.push({
	        x1: 'A0200507183',
	        x2: '2并绝缘板',
	        x3: 'GN-LZ-2107500',
	        x4: '15',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200102007',
	        x2: '熔断器',
	        x3: 'A70QS400-4',
	        x4: '3',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200302011',
	        x2: '六角螺栓',
	        x3: 'M6*16   镀锌',
	        x4: '5',
	        x5: '个'                 
	    });
	    rows.push({
	        x1: 'A0200202010',
	        x2: '高压单芯负插座',
	        x3: 'HV2-RFK4S-1YNB-H15',
	        x4: '3',
	        x5: '个'                 
	    });
	    return rows;
	}


    $(function(){
        $('#te').datagrid({data:getSpareData()}).datagrid('clientPaging');
    });


</script>
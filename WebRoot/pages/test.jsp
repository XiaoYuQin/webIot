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
    <title>信息管理系统</title> 
<link href="css/base.css" rel="stylesheet">
<link href="css/platform.css" rel="stylesheet">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">

<script type="text/javascript" src="../custom/jquery.min.js"></script>
<script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
<!-- <script type="text/javascript" src="js/menu.js"></script> -->
<script type="text/javascript" src="js/main.js"></script>
</head> 
<body>
<h2>Tabs Tools</h2>
	<p>Click the buttons on the top right of tabs header to add or remove tab panel.</p>
	<div style="margin:20px 0;"></div>
	<div id="tt" class="easyui-tabs" data-options="tools:'#tab-tools'" style="width:700px;height:250px">
	</div>
	<div id="tab-tools">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="addPanel()"></a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="removePanel()"></a>
	</div>
	<script type="text/javascript">
		var index = 0;
		function addPanel(){
			index++;
			$('#tt').tabs('add',{
				title: 'Tab'+index,
				// content: '<div style="padding:10px">Content'+index+'</div>',
				href:'iotMap.jsp',
				closable: true
			});
		}
		function removePanel(){
			var tab = $('#tt').tabs('getSelected');
			if (tab){
				var index = $('#tt').tabs('getTabIndex', tab);
				$('#tt').tabs('close', index);
			}
		}
	</script>

</body> 
</html>
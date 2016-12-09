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
    <title>任务指派</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css"> -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/process.css">

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
    .con-span{font-size: 15px}
</style>
</head> 
<body style="overflow: hidden;">
	<div class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'north'" style="height:15%">
			<div style="text-align: center;margin-top:20px ;font-size:20px">选人</div>
		</div>
		<div data-options="region:'east',split:true" title="" style="width:30%;height: 100%;margin-top: 10px">
			<div class="easyui-layout" style="width:100%;height:100%;">
				<div data-options="region:'north'" style="height:10%">
					<div style="font-size: 15px;margin-top: 10px;text-align: center;">北京国能电池科技有限公司</div>
				</div>
				<div data-options="region:'south'" style="height:90%;">
					<ul id="tt" class="easyui-tree" style="width: 100%;height: 100%">
						<li>
							<span>总库</span>
							<ul>
								<li data-options="state:'closed'">
									<span >华东区</span>
									<ul>
										<li>
											<span>山东</span>
										</li>
										<li>
											<span>江苏</span>
										</li>
										<li>
											<span>安徽</span>
										</li>
									</ul>
								</li>
								<li data-options="state:'closed'">
									<span>华中区</span>
									<ul>
										<li>河南</li>
										<li>湖北</li>
										<li>湖南 </li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>					
				</div>
			</div>
		</div>
		<div data-options="region:'west'" title="" style="width:70%;height: 100%;margin-top: 10px"></div>	
	</div>
</body> 
</html>

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
<body style="overflow: hidden;">

	<div class="easyui-panel" title="" style="width: 100%;height: 100%;">
		<!-- <div id="showSettlementDlg" class="easyui-dialog" title="维修站费用结算" data-options="" closed="true" style="width:1200px;height:500px;padding:10px;">		 -->
			<table id="showSettlementTable" class="kv-table">
				<tbody>
					<tr>
						<td colspan="18" class="kv-label" style="text-align: center;" width="100%">登记信息</td>
					</tr>
					<tr>
						<td class="kv-label" colspan="2">客户姓名</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">联系电话</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">服务人员</td>
						<td class="kv-content" colspan="4"></td>
					</tr>
					<tr>
						<td class="kv-label" colspan="2">服务地点</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">报修时间</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">服务时间要求</td>
						<td class="kv-content" colspan="4"></td>
					</tr>
					<tr>
						<td class="kv-label" colspan="2">出发时间</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">返回时间</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">项目名称</td>
						<td class="kv-content" colspan="4"></td>
					</tr>		
					<tr>
						<td class="kv-label" colspan="2">车牌号</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">公里数（km）</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">SOC值</td>
						<td class="kv-content" colspan="4"></td>
					</tr>	
					<tr>
						<td colspan="18" class="kv-label" style="text-align: center;" width="100%">常规检查</td>
					</tr>	
					<tr>
						<td class="kv-label" colspan="2">箱体外观</td>
						<td class="kv-content" colspan="4">
							<span class="radioSpan">
				                <span>异常</span><input type="radio" name="adminFlag" value="0"></input>
				                <span>正常</span><input type="radio" name="adminFlag" value="1"></input>
				            </span>							
						</td>
						<td class="kv-label" colspan="2">连接插件</td>
						<td class="kv-content" colspan="4">
							<span class="radioSpan">
				                <span>异常</span><input type="radio" name="adminFlag" value="0"></input>
				                <span>正常</span><input type="radio" name="adminFlag" value="1"></input>
				            </span>	
						</td>
						<td class="kv-label" colspan="2">单体电压</td>
						<td class="kv-content" colspan="4">
							<span>Max：</span>
							<span>&#12288;&#12288;&#12288;</span>
							<span>Min：</span>
							<span>&#12288;&#12288;&#12288;</span>
						</td>
					</tr>
					<tr>
						<td class="kv-label" colspan="2">电池温度</td>
						<td class="kv-content" colspan="4">
							<span>Max：</span>
							<span>&#12288;&#12288;&#12288;</span>
							<span>Min：</span>
							<span>&#12288;&#12288;&#12288;</span>							
						</td>
						<td class="kv-label" colspan="2">数据采集</td>
						<td class="kv-content" colspan="4">
							<span class="radioSpan">
				                <span>异常</span><input type="radio" name="adminFlag" value="0"></input>
				                <span>正常</span><input type="radio" name="adminFlag" value="1"></input>
				            </span>	
						</td>
						<td class="kv-label" colspan="2">绝缘检测</td>
						<td class="kv-content" colspan="4">
							<span class="radioSpan">
				                <span>异常</span><input type="radio" name="adminFlag" value="0"></input>
				                <span>正常</span><input type="radio" name="adminFlag" value="1"></input>
				            </span>	
						</td>
					</tr>	
					<tr>
						<td colspan="18" class="kv-label" style="text-align: center;" width="100%">故障检查</td>
					</tr>	
					<tr>
						<td class="kv-label" colspan="2" rowspan="2">故障类别及描述</td>
						<td class="kv-content" colspan="16">
							<span class="radioSpan">
				                <span>保内</span><input type="radio" name="adminFlag" value="0"></input>
				                <span>保外</span><input type="radio" name="adminFlag" value="1"></input>
				                <span>意外损坏</span><input type="radio" name="adminFlag" value="1"></input>
				            </span>															
						</td>				
					</tr>	
					<tr>
						<!-- <td class="kv-label" colspan="2">故障描述</td> -->
						<td class="kv-content" colspan="16"></td>					
					</tr>		
					<tr>
						<td class="kv-label" colspan="2" style="height: 80px">故障原因</td>
						<td class="kv-content" colspan="16"></td>					
					</tr>	
					<tr>
						<td class="kv-label" colspan="2" style="height: 80px">维修方法及结果</td>
						<td class="kv-content" colspan="16"></td>					
					</tr>	
					<tr>
						<td class="kv-label" colspan="2" style="height: 80px">服务总结及建议</td>
						<td class="kv-content" colspan="16"></td>					
					</tr>	
					<tr>
						<td colspan="18" class="kv-label" style="text-align: center;" width="100%">配件使用明细</td>
					</tr>
					<tr>
						<td class="kv-label" colspan="1">序号</td>
						<td class="kv-label" colspan="3">配件名称</td>
						<td class="kv-label" colspan="3">规格/型号</td>
						<td class="kv-label" colspan="1">数量</td>
						<td class="kv-label" colspan="1">单位</td>
						<td class="kv-label" colspan="9">维修费用明细</td>
					</tr>
					<tr>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="9" rowspan="3"></td>
					</tr>
					<tr>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="1"></td>
						<!-- <td class="kv-label" colspan="5">维修费用明细</td>				 -->
					</tr>
					<tr>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="3"></td>
						<td class="kv-label" colspan="1"></td>
						<td class="kv-label" colspan="1"></td>
						<!-- <td class="kv-label" colspan="5">维修费用明细</td> -->
					</tr>																
					<tr>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>
						<td class="kv-content" colspan="1" style="border-style:none"></td>												
					</tr>	
					<tr>
						<td class="kv-label" colspan="1" rowspan="2">客户签字</td>
						<td class="kv-content" colspan="8"></td>	
						<td class="kv-label" colspan="1" rowspan="2">维修站签章</td>
						<td class="kv-content" colspan="8" rowspan="2"></td>			
					</tr>	
					<tr>						
						<!-- <td class="kv-label" colspan="8"></td>			 -->
						<td class="kv-content" colspan="8"></td>					
					</tr>			
					<tr>
						<td class="kv-label" colspan="2">区域签字</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">客诉室</td>
						<td class="kv-content" colspan="4"></td>
						<td class="kv-label" colspan="2">服务部</td>
						<td class="kv-content" colspan="4"></td>
					</tr>	
					<tr>
						<td colspan="18" class="kv-label" width="100%">备注：产品在保修期内，系产品质量问题导致的问题，免费维修；意外因素导致及出保修期的故障有偿服务。（详细内容请详见产品使用手册）</td>
					</tr>																																																																	
				</tbody>
			</table>	
				
		<!-- </div>			 -->
	</div>
	

</body> 
</html>
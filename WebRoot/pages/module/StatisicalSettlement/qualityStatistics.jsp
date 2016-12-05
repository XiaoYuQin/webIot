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
    <title>职位列表</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">

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
</style>
</head> 
<body>
    <script type="text/javascript">
        $('.panel-header').css({ "background-color": "#FFFFFF" }).css({"filter":"progid:DXImageTransform.Microsoft.gradient(startColorstr=#FFFFFF,endColorstr=#FFFFFF,GradientType=0)"});
    </script>
    <!-- 查看点击的质量信息记录 -->
	<div id="dlgView" class="easyui-dialog" title="用户设置" data-options="closed:true" style="width:480px;height:350px;padding:10px;">
        <div class="conditions">
            <div style="font-size: 30px">用户名：xiaming</div>                    
        </div>  		
        <div class="conditions" style="margin-top: 10px">
            <a class="con-span">修改密码：</a><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>           
            <a class="con-span">确认密码：</a><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>  
            <a href="#" class="easyui-linkbutton">修改密码</a>                     
        </div>     
        <div class="conditions" style="margin-top: 10px">
            <a class="con-span">修改姓名：</a><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>           
            <a href="#" class="easyui-linkbutton">修改姓名</a>                     
        </div>
        <div class="conditions" style="margin-top: 10px">
            <a class="con-span">修改电话：</a><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>  
            <a href="#" class="easyui-linkbutton">修改电话</a>                     
        </div>                     
        <div class="conditions" style="margin-top: 10px">
            <a class="con-span">修改部门：</a><select class="easyui-combobox" name="language" style="height:35px;width:100px;"><option>研发部</option><option>售后部</option></select>
            <a class="con-span">修改职位：</a><select class="easyui-combobox" name="language" style="height:35px;width:100px;"><option>软件工程师</option><option>硬件工程师</option></select>
            <a href="#" class="easyui-linkbutton">修改职位</a>                     
        </div>                					
        <div class="conditions" style="margin-top: 10px">
            <a class="con-span">修改状态：</a><select class="easyui-combobox" name="language" style="height:35px;width:100px;"><option>离职</option><option>正常</option><option>暂停</option></select>            
            <a href="#" class="easyui-linkbutton">修改职位</a>                     
        </div>   
	</div>
	<!-- 新增新的售后质量信息 -->
	<div id="dlgCreate" class="easyui-dialog" title="新增售后质量信息" data-options="closed:true" style="width:500px;height:350px;padding:10px;">		
        <div class="conditions" style="margin-top: 10px">
        	<span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">            
        	<span class="con-span">客户项目: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>        	
        </div>   
        <div class="conditions" style="margin-top: 10px">
			<span class="con-span">运营地&#12288;: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>        
        </div>
	</div>




    <div class="container" style="width: 100%;height:100%">
		<table id="dg" title="" class="easyui-datagrid" style="width:100%;height:100%"  
		        singleSelect="true" 
		        iconCls="icon-save" 
		        rownumbers="true"
		        toolbar='#tb'
				pagination="true"
				fitColumns="true"
				striped="true"
		        >  
		    <thead>  
		        <tr>  
		            <th colspan="19" width="95%" ><font size="3">售后质量信息台账</font></th>             
		        </tr>  
		        <tr>  
		            <th rowspan="2" field="date" width="5%" align="center">日期</th>  
		            <th rowspan="2" field="project" width="5%" align="center">客户项目</th>  		 
		            <th rowspan="2" field="location" width="5%" align="center">运营地</th>  
		            <th rowspan="2" field="vin" width="5%" align="center">车辆VIN码</th>  	
					<th rowspan="2" field="id" width="5%" align="center">车牌号码</th>  
					<th rowspan="2" field="productId" width="5%" align="center">产品编号</th>  	
					<th rowspan="2" field="run" width="5%" align="center" nowrap="false">当前里程数<br>（Km）</th>  

					<th colspan="4">故障分类</th>  

		            <th rowspan="2" field="faultDescription" width="7%" align="center">故障描述</th>  
		            <th rowspan="2" field="faultCause" width="7%" align="center">故障原因</th>  	
					<th rowspan="2" field="picDescription" width="7%" align="center">图片说明</th>  
					<th rowspan="2" field="repairMethod" width="7%" align="center">维修方法</th>  	
					<th rowspan="2" field="isCustormRepairs" width="4%" align="center">是否<br>客户报修</th>  				
					<th rowspan="2" field="leader" width="3%" align="center">负责人</th>  				
					<th rowspan="2" field="note" width="7%" align="center">备注</th>  						
					<th rowspan="2" field="level" width="3%" align="center">等级</th>  											

		        </tr>  
		        <tr>
					<th field="cell" width="3%" >电芯</th>  
					<th field="electric" width="9%" align="center">电气<br>(BMS、线束、电器件)</th>  
					<th field="pack" width="3%" align="center">PACK</th>  
					<th field="appearance" width="4%" align="center">产品外观</th>  
		        </tr>
		    </thead>  
		</table> 
		<div id="tb" style="padding:0 30px;">
			客户项目: <input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
			运营地: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>
			故障分类: <select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>电芯</option><option>电气</option><option>PACK</option><option>产品外观</option></select>			
			负责人: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>						
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addQualityStatistics()">新增</a>
<!-- 			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>			 -->
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
		        date: '2016/12/3',
		        project: '酷开3',
		        location: '南京',
		        vin: 'smv12346513216546',
		        id: '123456789',
                productId:'13889888888',
		        run: '385',
		        faultDescription: '电芯故障',
		        faultCause: '破损',
		        picDescription: '无',
		        repairMethod: '更换',
		        isCustormRepairs: '是',
		        leader: '张一',
		        note: '无',
		        level: '1',
		        cell: '是',
		        electric: '是',
		        pack: '是',
		        appearance: '是'
		    });
			rows.push({
		        date: '2016/12/3',
		        project: '酷开3',
		        location: '南京',
		        vin: 'smv12346513216546',
		        id: '123456789',
                productId:'13889888888',
		        run: '385',
		        faultDescription: '电芯故障',
		        faultCause: '破损',
		        picDescription: '无',
		        repairMethod: '更换',
		        isCustormRepairs: '是',
		        leader: '张一',
		        note: '无',
		        level: '1',
		        cell: '是',
		        electric: '是',
		        pack: '是',
		        appearance: '是'
		    });
			rows.push({
		        date: '2016/12/3',
		        project: '酷开3',
		        location: '南京',
		        vin: 'smv12346513216546',
		        id: '123456789',
                productId:'13889888888',
		        run: '385',
		        faultDescription: '电芯故障',
		        faultCause: '破损',
		        picDescription: '无',
		        repairMethod: '更换',
		        isCustormRepairs: '是',
		        leader: '张一',
		        note: '无',
		        level: '1',
		        cell: '是',
		        electric: '是',
		        pack: '是',
		        appearance: '是'
		    });
			rows.push({
		        date: '2016/12/3',
		        project: '酷开3',
		        location: '南京',
		        vin: 'smv12346513216546',
		        id: '123456789',
                productId:'13889888888',
		        run: '385',
		        faultDescription: '电芯故障',
		        faultCause: '破损',
		        picDescription: '无',
		        repairMethod: '更换',
		        isCustormRepairs: '是',
		        leader: '张一',
		        note: '无',
		        level: '1',
		        cell: '是',
		        electric: '是',
		        pack: '是',
		        appearance: '是'
		    });                           
		    return rows;
		}
	    $('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    // method:'get',  
		    striped: true,  
		    title: "",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		            // alert('code:' + row.code + "\n LoginID:" + row.name);  
		            $('#dlgView').dialog('open');
		        }  
		    }  
		})
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });        
    </script>

<script type="text/javascript">
	function addQualityStatistics()
	{
 		$('#dlgCreate').dialog('open');
	}
</script>
</body> 
</html>

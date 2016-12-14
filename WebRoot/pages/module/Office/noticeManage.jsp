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
    <title>公告发布</title> 

	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/js/umeditor/themes/default/css/umeditor.css">	

	<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/pages/js/umeditor/umeditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/pages/js/umeditor/umeditor.min.js"></script>


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
<body>
    <script type="text/javascript">
        $('.panel-header').css({ "background-color": "#FFFFFF" }).css({"filter":"progid:DXImageTransform.Microsoft.gradient(startColorstr=#FFFFFF,endColorstr=#FFFFFF,GradientType=0)"});
    </script>


    <!-- 创建新公告dialog -->
    <div id="dlgCreate" class="easyui-dialog" title="发布公告" 
    		data-options="closed:true,buttons:'#dlg-buttons'" 
    		style="width:770px;height:570px;padding:10px;overflow: hidden;"
    	>	   
		<div class="conditions" style="margin-top: 10px">
			<a class="con-span">&#12288;发布者:</a>
			<input class="easyui-textbox" style="width:120px;height:28px;">	    
			<a class="con-span" id="releaseDate" value="${makedate}">发布时间:</a>
			<input class="easyui-datebox" style="width:120px;height:28px;">	    
		</div>
        <div class="conditions" style="margin-top: 10px;">
        	<div class="con-span">&#12288;&#12288;主题: </div>
        	<input class="easyui-textbox" style="width:327px;height:28px;">	    
        </div>		
        <div class="conditions" style="margin-top: 10px;">
        	<div class="con-span">公告内容: </div>
        </div>
        <div class="conditions" style="margin-left: 70px;">
        	<div id="editor-state" class="editor-state" style="width: 670px;height: 280px"></div>	        		
			<!-- <script id="editor" type="text/plain" style="width:670px;height:320px;"></script> -->
        </div> 		  	           
	</div>
	<div id="dlg-buttons">
		<table cellpadding="0" cellspacing="0" style="width:100%">
			<tr>
				<td style="text-align:right">
					<a id="btnCreatSave" href="#" class="easyui-linkbutton" iconCls="icon-save">保存</a>
					<a id="btnCreatCancel" href="#" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 公告查看dialog -->
	<div id="dlgView" class="easyui-dialog" title="查看公告" 
    		data-options="closed:true" 
    		style="width:770px;height:570px;padding:10px;overflow: hidden;"
    	>	   	  	           
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
		        <tr href="#">
					<th data-options="field:'t1',editor:'text'" style="width: 78%;">主题</th>
					<th data-options="field:'t2',align:'center',editor:'text'" style="width: 10%">发布者</th>		
					<th data-options="field:'t3',align:'center',editor:'text'" style="width: 10%">发布时间</th>       
	            </tr>		    
		    </thead>  
		</table> 
		<div id="tb" style="padding:0 30px;">
			<div class="conditions">
				<span class="con-span">主题: </span>
				<input class="easyui-textbox" type="text" name="code" style="width:120px;height:28px;line-height:28px;"></input>           
            	<a class="con-span">发布者: </a>
            	<input class="easyui-textbox" type="text" name="code" style="width:120px;height:28px;line-height:28px;"></input>           
                <span class="con-span">发布时间: </span>
                <input class="easyui-datebox" style="width:120px;height:28px;line-height:28px;">            
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addQualityStatistics()">新增</a>			    
			    <!--<a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>-->
			</div>
			<div class="conditions hide">
			    <span class="con-span">客户名称: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:28px;line-height:28px;"></input>
			    <span class="con-span">项目名称: </span><select class="easyui-combobox" name="language" style="height:28px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
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

			rows.push({
		        t1: '售后部公告1',
		        t2: '张一',
		        t3: '2016/12/12 15:34'
		    });
			rows.push({
		        t1: '售后部公告2',
		        t2: '张一',
		        t3: '2016/12/12 15:34'
		    });
			rows.push({
		        t1: '售后部公告3',
		        t2: '张一',
		        t3: '2016/12/12 15:34'
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

<script type="text/javascript">
	$('#btnInventoryOrganization').click(function(){
		console.info("btnInventoryOrganization");		
	});

</script>
<script type="text/javascript">
     var state = UM.getEditor('editor-state');
     state.setWidth("98%");
     $(".edui-body-container").css("width", "98%");

    $(window).resize(function(){
    	setTimeout(function(){
    		$('.easyui-tabs1').tabs("resize");
	    	state.setWidth("98%");
	     	$(".edui-body-container").css("width", "98%");	
	     },1);
    }).resize();
</script>

<!-- 公告查看dialog -->
<script type="text/javascript">
 	var contentx = '<iframe scrolling="auto" frameborder="0"  src="contacts.jsp" style="width:100%;height:100%;"></iframe>';   
	$("#dlgView").dialog({
        title: '查看公告',
        content:contentx,  
        modal: true,
        closed: true
    });
</script>
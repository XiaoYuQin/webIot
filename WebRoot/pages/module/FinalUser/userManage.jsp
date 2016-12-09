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
    <title>备件申请</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css">

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
<body>
    <script type="text/javascript">
        $('.panel-header').css({ "background-color": "#FFFFFF" }).css({"filter":"progid:DXImageTransform.Microsoft.gradient(startColorstr=#FFFFFF,endColorstr=#FFFFFF,GradientType=0)"});
    </script>
    <div id="dlgNew" class="easyui-dialog" title="添加备件" data-options="closed:true,buttons:'#dlg-button'" style="width:550px;height:280px;padding:10px;">
	    <div class="conditions" style="margin-top: 10px">
			<a class="con-span">物料编码:</a>
			<input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	        <a class="con-span">物料名称:</a>
	        <input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	      	
	    </div>  
	    <div class="conditions" style="margin-top: 10px">
	    	<a class="con-span">&#12288;&#12288;单位:</a>
	      	<input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	        <a class="con-span">申请数量:</a>
	        <input class="easyui-textbox" style="width:160px;height:35px;">	    
	    </div>
	    <div class="conditions" style="margin-top: 10px">	    	
	        <a class="con-span">实发数量:</a>
			<input class="easyui-textbox" style="width:160px;height:35px;">	    
	        <a class="con-span">主单位:</a>
	        <input class="easyui-textbox"  style="width:160px;height:35px;">	    
	    </div>	    
    </div>

    <div id="dlgCreate" class="easyui-dialog" title="备件申请" data-options="closed:true,buttons:'#dlg-buttons'" style="width:1100px;height:600px;padding:10px;">
	    <div class="conditions">
			<a class="con-span">库存组织:</a>
			<input  id="btnInventoryOrganization" class="easyui-textbox"  style="width:160px;height:35px;"
				 data-options="
					buttonText:'',
					icons: [{
						iconCls:'icon-list',
						handler: function(e){
							console.info('btnInventoryOrganization');
						}
					}],
					prompt:''
			">	    
			<!--<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           -->
	        <a class="con-span">&#12288;&#12288;仓库:</a><input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	      	<a class="con-span">申请类型:</a><input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	        <a class="con-span">申请单号:</a><input class="easyui-textbox" style="width:160px;height:35px;">	    
	    </div>  		                 
	    <div class="conditions" style="margin-top: 10px">

	    </div>                					
	    <div class="conditions" style="margin-top: 10px">
	        <a class="con-span">申请日期:</a><input class="easyui-datetimebox" style="width:160px;height:35px;line-height:35px;">            
	        <a class="con-span">&#12288;申请人:</a><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>  
			<a class="con-span">申请部门:</a><input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	        <a class="con-span">&#12288;&#12288;客户:</a><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>  
	    </div>   
	    <div class="conditions" style="margin-top: 10px">
	        <a class="con-span">&#12288;总数量:</a><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>  
	       	<a class="con-span">&#12288;审批人:</a><input class="easyui-textbox" data-options="buttonText:'',buttonIcon:'icon-list',prompt:''" style="width:160px;height:35px;">	    
	    </div>  
	    <div class="conditions" style="margin-top: 10px">
	        <a class="con-span">&#12288;&#12288;备注:</a><input class="easyui-textbox" data-options="multiline:true" value="" style="width:50%;height:100px">
	   	</div>  
	   	<div class="conditions" style="margin-top: 10px">
			<a class="con-span">&#12288;&#12288;备件:</a>
	    </div>  
   		<div class="conditions" style="margin-top: 10px;height: 230px;margin-left: 70px">
	        <a class="easyui-panel" style="width: 90%;height: 200px;">
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
							<th data-options="field:'listprice',align:'center',editor:'text'" style="width: 10%;">物料编码</th>
							<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">物料名称</th>		
							<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">单位</th>	
							<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">申请数量</th>		
							<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">实发数量</th>		
							<th data-options="field:'unitcost',align:'center',editor:'text'" style="width: 10%">主单位</th>							
						</tr>
					</thead>
				</table>
			</a>
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
	<div id="dlg-button">
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



    <div class="container" style="width: 100%;height:100%">
		<table id="dg" title="" class="easyui-datagrid" style="width:100%;height:100%"  
		        singleSelect="true" 
		        iconCls="icon-save" 
		        rownumbers="true"
		        toolbar='#tb'
				pagination="true"
				fitColumns="true"
				striped="true"
				pageSize=20"
		        >  
		    <thead>  
		        <tr href="#">
		            <th field="tr1" width="8%">姓名</th>
		            <th field="tr2" width="8%">电话</th>
		            <th field="tr3" width="8%">邮箱</th>
		            <th field="tr4" width="8%">车辆厂家</th>
		            <th field="tr5" width="9%">车型</th>
		            <th field="tr6" width="9%">VIN码</th>
		            <th field="tr7" width="9%">车牌号</th>
		            <th field="tr8" width="9%">所在地</th>
		            <th field="tr9" width="9%">运营公司</th>
		            <th field="tr10" width="21%">备注</th>
	            </tr>		    
		    </thead>  
		</table> 
		<div id="tb" style="padding:0 30px;">
			<div class="conditions">
				<span class="con-span">所在地: </span><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
            	<a class="con-span">运营公司: </a><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
				<span class="con-span">车型: </span><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
                <span class="con-span">姓名: </span><input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;"></input>           
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >新增</a>			    
			    <!--<a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>-->
			</div>
			<div class="conditions hide">
			    <span class="con-span">客户名称: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
			    <span class="con-span">项目名称: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
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

		    for(var i=0; i<30; i++){
				rows.push({
			        tr1: '张一',
			        tr2: '12312254',
			        tr3: '12312254@asdf.com',
			        tr4: 'xx',
			        tr5: 'xxxxxxxxxx',
	                tr6: 'xxxx',
	                tr7: 'SD4513',
			        tr8: '北京',
			        tr9: 'xxx公交集团',
			        tr10: ''
			    });
			}
		                          
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
		            //$('#dlgView').dialog('open');
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
					// $('#te').datagrid('endEdit', lastIndex);
					// $('#te').datagrid('appendRow',{
					// 	itemid:'',
					// 	productid:'',
					// 	listprice:'',
					// 	unitprice:'',
					// 	attr1:''
					// });
					// lastIndex = $('#te').datagrid('getRows').length-1;
					// $('#te').datagrid('selectRow', lastIndex);
					// $('#te').datagrid('beginEdit', lastIndex);
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
</script>
<script type="text/javascript">
	$('#btnInventoryOrganization').click(function(){
		console.info("btnInventoryOrganization");		
	});

</script>
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

	<div class="easyui-panel" title="" style="width: 100%;height: 100%;">
  		<table id="dg" style="width:100%;height:100%" title="" data-options="
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
                pageSize:20">
            <thead> 
		        <tr href="#">
		            <th field="tr1" width="5%">报修日期</th>
					<th field="tr13" width="10%">维修单号</th>
		            <th field="tr2" width="8%">客户名称</th>
		            <th field="tr3" width="12%">项目名称</th>
		            <th field="tr4" width="3%">报修人</th>
		            <th field="tr5" width="8%">电话</th>
		            <th field="tr6" width="9%">产品编号</th>
		            <th field="tr7" width="20%">故障描述</th>
		            <th field="tr9" width="4%">登记人</th>
		            <th field="tr11" width="4%">受理人</th>
		            <th field="tr12" width="4%">维修人员</th>
		            <th field="tr10" width="18%">备注</th>	          
		        </tr>		    
		    </thead>  
		</table> 
		<div id="tb">
			<div class="conditions">
				<ul class="process clearfix" style="width: 100%;margin-top: 3px">
					<li >
						<div id="baoxiu" class="item curr-pre">
							<div id="baoxiu" class="step">
								<i>1</i>
								<label>报修</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item current">
							<div id="renwuzhipai" class="step">
								<i>2</i>
								<label>任务指派</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item laters">
							<div id="xianchangkancha" class="step">
								<i>3</i>
								<label>现场勘查</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item laters">
							<div  id="kanchashengpi" class="step">
								<i>4</i>
								<label>勘查审批</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item laters">
							<div id="weihu" class="step">
								<i>5</i>
								<label>维修</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item last">
							<div id="weixiushengpi" class="step">
								<i>6</i>
								<label>维修审批</label>
							</div>
							<span></span>
						</div>
					</li>			
				</ul>
			</div>

			<div class="conditions">
				<span class="con-span">起始日期: </span>
				<input class="easyui-datebox" style="width:160px;height:35px;line-height:35px;">     
				<span class="con-span">结束日期: </span>
				<input class="easyui-datebox" style="width:160px;height:35px;line-height:35px;">     
		    	<span class="con-span">项目名称: </span>
		    	<select class="easyui-combobox" name="language" style="height:35px;width:160px;"><option>安凯8.1</option><option>金龙9</option></select>            				
				<span class="con-span">&#12288;&#12288;区域: </span>
		    	<select class="easyui-combobox" name="language" style="height:35px;width:160px;"><option>山西</option><option>北京</option></select>            						    	
       
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			    <!--<a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>-->
			</div>	
		</div>   			
	</div>
	<!-- 弹出窗口 -->
	<div id="dlgCreate" class="easyui-dialog" title="指派维修人员" data-options="closed:true,buttons:'#dlg-buttons'" style="width:300px;height:400;padding:10px;">
	    <div class="conditions">
			<a class="con-span">指派维修人员:</a>
			<input id="cc" class="easyui-combotree" data-options="url:'tree_data1.json',method:'get',required:true" style="width:160px;">
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


</body> 
</html>
<script type="text/javascript">
	$('#btnInventoryOrganization').click(function(){
		console.info("btnInventoryOrganization");		
	});

	$('#baoxiu').click(function(){
		console.info("baoxiu");		

	});
	$('#renwuzhipai').click(function(){
		console.info("renwuzhipai");	

	});
	$('#xianchangkancha').click(function(){
		console.info("xianchangkancha");	
		
	});
	$('#kanchashengpi').click(function(){
		console.info("kanchashengpi");		
		
	});
	$('#weihu').click(function(){
		console.info("weihu");		
	
	});
	$('#weixiushengpi').click(function(){
		console.info("weixiushengpi");	
			
	});
</script>
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

			for(var i=0; i<30; i++)
		    {
				rows.push({
			        tr1: '2016/12/6',
			        tr2: '北京公交公司',
			        tr3: '金龙9',
			        tr4: '李德生',
		            tr5: '1256487532',
					tr6: '124564SD12345',
			        tr7: '无法充电',
			        tr8: '2016/12/6',
			        tr9: '王丽坤',
			        tr10: '-',
			        tr11: '郭淑琴',
			        tr13:'GN-WXD-20160314-001'               
			    });
				rows.push({
			        tr1: '2016/12/5',
			        tr2: '北京公交公司',
			        tr3: '金龙9',
			        tr4: '李德生',
		            tr5: '1256487532',
					tr6: '124564SD12345',
			        tr7: '无法充电',
			        tr8: '2016/12/6',
			        tr9: '王丽坤',
			        tr10: '-',
			        tr11: '郭淑琴', 
			        tr13:'GN-WXD-20160314-002'                      
			    });
				rows.push({
			        tr1: '2016/12/4',
			        tr2: '北京公交公司',
			        tr3: '金龙9',
			        tr4: '李德生',
		            tr5: '1256487532',
					tr6: '124564SD12345',
			        tr7: '无法充电',
			        tr8: '2016/12/6',
			        tr9: '王丽坤',
			        tr10: '-',
			        tr11: '郭淑琴',
			        tr13:'GN-WXD-20160314-003'                      
			    });		
		    }	
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

			$('#dlgCreate').dialog('close');
			$('#dg').datagrid('reload');
        }); 
		$('#btnCreatCancel').click(function(){
			$('#dlgCreate').dialog('close');
        }); 


		$('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: "",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		        	$('#dlgCreate').dialog('open');
		            // alert('code:' + row.tr1);  


		            // $('#dlg').dialog('open');
		        }  
		    }  
		})

    </script>
    <script type="text/javascript">
    	function selectUser()
    	{
    		$('#dlgSelectUser').dialog('open');
    	}
    	$('#cc').combotree('loadData', [{ id: 1, text: 'Languages', children: [{ id: 11, text: 'Java' },{ id: 12, text: 'C++' }] }]); 
    	// $('#cc').combotree('loadData', ${treeData});
    </script>
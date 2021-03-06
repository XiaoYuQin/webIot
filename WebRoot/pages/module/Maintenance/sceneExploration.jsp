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
    <title>现场勘查</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css"> -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/process.css">

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>


<style type="text/css">
    html, body{ margin:0; height:100%; }
    .con-span{font-size: 15px}
</style>
</head> 
<body style="overflow: hidden;">

	<div class="easyui-panel" title="" style="width: 100%;height: 100%;">

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
		            <th rowspan="3" field="t1" width="5%" align="center">指派日期</th>  
					<th rowspan="3" field="t19" width="11%" align="center">维修单号</th>		 
		            <th rowspan="3" field="t2" width="9%" align="center">项目名称</th>  
		            <th rowspan="3" field="t3" width="9%" align="center">产品编号</th>  	
					<th rowspan="3" field="t4" width="4%" align="center">维修人员</th>  			            

		            <th colspan="8">故障分类</th>  

		            <th colspan="2">故障类别及描述</th>  

					<th rowspan="3" field="t5" width="9%" align="center">故障原因</th>  
					<th rowspan="3" field="t6" width="10%" align="center">维修方法</th>  	
					<th rowspan="3" field="t7" width="4%" align="center">备件<br>使用明细</th>  									
		        </tr>  
		        <tr>
					<th rowspan="2" field="t8" width="3%" align="center">箱体<br>外观</th>  
					<th rowspan="2" field="t9" width="3%" align="center">连接<br>插件</th>  
					<th colspan="2">单体电压</th>  
					<th colspan="2">电池温度</th>  

					<th rowspan="2" field="t10" width="3%" align="center">数据<br>采集</th>  
					<th rowspan="2" field="t11" width="3%" align="center">绝缘<br>监测</th>    
					
					<th rowspan="2" field="t12" width="4%" align="center">故障类别</th>  
					<th rowspan="2" field="t13" width="10%" align="center">故障描述</th>  

		        </tr>
				<tr>
					<th field="t14" width="3%" align="center">max</th>  
					<th field="t15" width="3%" align="center">min</th>
					<th field="t16" width="3%" align="center">max</th>  
					<th field="t17" width="3%" align="center">min</th>
				</tr>

		    </thead>  
		</table> 

		<div id="tb">
			<div class="conditions">
				<ul class="process clearfix" style="width: 100%;margin-top: 3px">
					<li >
						<div id="baoxiu" class="item passed">
							<div id="baoxiu" class="step">
								<i>1</i>
								<label>报修</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item curr-pre">
							<div id="renwuzhipai" class="step">
								<i>2</i>
								<label>任务指派</label>
							</div>
							<span></span>
						</div>
					</li>
					<li>
						<div class="item current">
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
		    	<select class="easyui-combobox" name="language" style="height:35px;width:160px;" panelHeight='auto'>
		    		<option>安凯8.1</option>
		    		<option>金龙9</option>
		    	</select>            				
				<span class="con-span">&#12288;&#12288;区域: </span>
		    	<select class="easyui-combobox" name="language" style="height:35px;width:160px;">
		    		<option>山西</option>
		    		<option>北京</option>
		    	</select>            						    	
       
			    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			</div>	
		</div>   			
	</div>
	<!-- 弹出窗口 -->
	<div id="dlgCreate" class="easyui-dialog" title="勘查信息登记" data-options="closed:true,buttons:'#dlg-buttons'" style="width:650px;height:600px;padding:10px;">	
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
						rownumbers:true,
						pageSize:1000">
					<thead>
						<tr>
							<th field="ck" data-options="checkbox:true"></th>      
							<th data-options="field:'x1',align:'center',editor:'text'" style="width: 200px">物料编码</th>
							<th data-options="field:'x2',align:'center',editor:'text'" style="width: 170px">物料名称</th>		
							<th data-options="field:'x3',align:'center',editor:'text'" style="width: 200px">规格</th>	
							<th data-options="field:'x4',align:'center',editor:'text'" style="width: 80px">数量</th>			
							<th data-options="field:'x5',align:'center',editor:'text'" style="width: 80px">单位</th>	
							<th data-options="field:'x6',align:'center',editor:'text'" style="width: 80px">单价</th>	
							<th data-options="field:'x7',align:'center',editor:'text'" style="width: 80px">合价</th>								
						</tr>
					</thead>
				</table>
			</a>
		</div>	    	     

	</div>
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
			        t1: '2016/12/6',
			        t2: '金龙9',
			        t3: 'ASC124632154',
			        t4: '张玉山',
			        t19: 'GN-WXD-20160314-001'         
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
        $('#btnSubimt').click(function(){

			$.messager.show({
				title:'提交',
				msg:'提交成功',
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
            		// window.open('<%=basePath%>/pages/module/Maintenance/maintenanceOrder.jsp', 'newwindow', 'height=768px, width=1024px, scrollbars=yes, resizable=yes');   
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
		        x5: '个',
		        x6: '15',
		        x7: '45'                 
		    });	
		    rows.push({
		        x1: 'A0200508002',
		        x2: '硅胶垫2',
		        x3: 'GN-AK8.1EV-2107517',
		        x4: '1',
		        x5: '件',
		        x6: '1',
		        x7: '1'                   
		    });
		    rows.push({
		        x1: 'A0200101011',
		        x2: '继电器',
		        x3: 'AEV19024',
		        x4: '6',
		        x5: '个',
		        x6: '20',
		        x7: '120'                   
		    });
		    rows.push({
		        x1: 'A0200306006',
		        x2: '弹垫',
		        x3: 'M10  镀锌',
		        x4: '100',
		        x5: '个',
		        x6: '1',
		        x7: '1'                   
		    });
		    rows.push({
		        x1: 'A0200302046',
		        x2: '外六角螺栓',
		        x3: 'M6*12  不锈钢',
		        x4: '30',
		        x5: '个',
		        x6: '1',
		        x7: '1'                   
		    });
		    rows.push({
		        x1: 'A0200404006',
		        x2: '护套',
		        x3: 'DJ33541',
		        x4: '18',
		        x5: '个',
		        x6: '1',
		        x7: '18'                   
		    });
		    rows.push({
		        x1: 'A0200406008',
		        x2: '绝缘支柱',
		        x3: 'SM7110',
		        x4: '50',
		        x5: '个',
		        x6: '1',
		        x7: '50'                   
		    });
		    rows.push({
		        x1: 'A0200407204',
		        x2: '扎带',
		        x3: '3*100',
		        x4: '1',
		        x5: '包',
		        x6: '10',
		        x7: '1'                   
		    });
		    rows.push({
		        x1: 'A0200507183',
		        x2: '2并绝缘板',
		        x3: 'GN-LZ-2107500',
		        x4: '15',
		        x5: '个',
		        x6: '1',
		        x7: '15'                   
		    });
		    rows.push({
		        x1: 'A0200102007',
		        x2: '熔断器',
		        x3: 'A70QS400-4',
		        x4: '3',
		        x5: '个',
		        x6: '1',
		        x7: '3'                   
		    });
		    rows.push({
		        x1: 'A0200302011',
		        x2: '六角螺栓',
		        x3: 'M6*16   镀锌',
		        x4: '5',
		        x5: '个',
		        x6: '1',
		        x7: '5'                  
		    });
		    rows.push({
		        x1: 'A0200202010',
		        x2: '高压单芯负插座',
		        x3: 'HV2-RFK4S-1YNB-H15',
		        x4: '3',
		        x5: '个',
		        x6: '30',
		        x7: '90'                   
		    });
		    rows.push({
		        x7: '357'                   
		    });		    
		    return rows;
		}


        $(function(){
            $('#te').datagrid({data:getSpareData()}).datagrid('clientPaging');
        });


    </script>
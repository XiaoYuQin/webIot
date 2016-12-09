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
    <title>报修</title> 

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
<body>

		<ul class="process clearfix">
			<li  style="cursor: pointer;">
				<div id="baoxiu" class="item current">
					<div class="step" style="cursor: pointer;">
						<i>1</i>
						<label style="cursor: pointer;">报修</label>
					</div>
					<span></span>
				</div>
			</li>
			<li style="cursor: pointer;">
				<div class="item laters">
					<div id="renwuzhipai" class="step" style="cursor: pointer;">
						<i>2</i>
						<label style="cursor: pointer;">任务指派</label>
					</div>
					<span></span>
				</div>
			</li>
			<li style="cursor: pointer;">
				<div class="item laters">
					<div id="xianchangkancha" class="step" style="cursor: pointer;">
						<i>3</i>
						<label style="cursor: pointer;">现场勘查</label>
					</div>
					<span></span>
				</div>
			</li>
			<li style="cursor: pointer;">
				<div class="item laters">
					<div  id="kanchashengpi" class="step" style="cursor: pointer;">
						<i>4</i>
						<label style="cursor: pointer;">勘查审批</label>
					</div>
					<span></span>
				</div>
			</li>
			<li style="cursor: pointer;">
				<div class="item laters" style="cursor: pointer;">
					<div id="weihu" class="step">
						<i>5</i>
						<label style="cursor: pointer;">维修</label>
					</div>
					<span></span>
				</div>
			</li>
			<li style="cursor: pointer;">
				<div class="item last" style="cursor: pointer;">
					<div id="weixiushengpi" class="step">
						<i>6</i>
						<label style="cursor: pointer;">维修审批</label>
					</div>
					<span></span>
				</div>
			</li>			
		</ul>


   

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

		            // <th field="tr1" width="8%">库存组织</th>
		            // <th field="tr2" width="8%">仓库</th>
		            // <th field="tr3" width="8%">申请类型</th>
		            // <th field="tr4" width="8%">申请单号</th>
		            // <th field="tr5" width="8%">申请日期</th>
		            // <th field="tr6" width="8%">申请人</th>
		            // <th field="tr7" width="8%">申请部门</th>
		            // <th field="tr8" width="8%">客户</th>
		            // <th field="tr9" width="22%">备注</th>
		            // <th field="tr10" width="4%">总数量</th>
		            // <th field="tr11" width="4%">审批人</th>
		            // <th field="tr12" width="4%">状态</th>	

			rows.push({
		        tr1: '北京国能电池科技有限公司',
		        tr2: '北京国能电池科技有限公司',
		        tr3: '紧急出库',
		        tr4: 'SA160829000005',
		        tr5: '2016-08-29',
                tr6: 'xyz',
		        tr7: '售后部',
		        tr8: '金龙',
		        tr9: '',
		        tr10: '100',
		        tr11: 'mnq',
		        tr12: '已审批'
		    });
			rows.push({
		        tr1: '北京国能电池科技有限公司',
		        tr2: '北京国能电池科技有限公司',
		        tr3: '紧急出库',
		        tr4: 'SA160829000005',
		        tr5: '2016-08-29',
                tr6: 'xyz',
		        tr7: '售后部',
		        tr8: '金龙',
		        tr9: '',
		        tr10: '100',
		        tr11: 'mnq',
		        tr12: '已审批'
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
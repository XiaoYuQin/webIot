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
    <title>数据字典</title> 

<link href="<%=basePath%>/pages/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" href="<%=basePath%>/pages/css/providers.css">
<link rel="stylesheet" href="<%=basePath%>/pages/css/providers1.css">
<!-- <link href="css/basic_info.css" rel="stylesheet"> -->
<style type="text/css">
    html, body{ margin:0; height:100%; }
</style>


<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

<!-- <style type="text/css">
    #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style> -->

</head> 
<body>
    <div class="container" style="width: 100%;height: 100%">
        <div class="left-tree" style="height: 100%;width: 20%;position:relative" >
			<div class="easyui-panel" style="height: 5%;width: 100%">
<!-- 				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="selectPanel()">添加</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addPanel()">删除</a> -->
				<a href="javascript:void(0)" class="easyui-linkbutton" style="margin-left: 50px;" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>				
			</div>
			<div class="easyui-panel" style="height: 95%;width: 100%">
				<ul id="tt" class="easyui-tree" style="width: 100%;height: 80%" 
						data-options="autoScroll : true">
					<li data-options="state:'closed'">
						<span>客户报修电话信息表</span>
						<ul>
							<li>字段设置</li>
							<li>角色权限</li>
						</ul>
					</li>
					<li data-options="state:'closed'">					
						<span>质量信息统计表</span>
						<ul>
							<li>字段设置</li>
							<li>角色权限</li>
						</ul>				
					</li>			
					<li data-options="state:'closed'">					
						<span>工具字典</span>
						<ul>
							<li>字段设置</li>
							<li>角色权限</li>
						</ul>				
					</li>	
					<li data-options="state:'closed'">					
						<span>备件字典</span>
						<ul>
							<li>字段设置</li>
							<li>角色权限</li>
						</ul>				
					</li>													
				</ul>
			</div>		
        </div>
        <div class="content" style="position:absolute;left:20%;top: 0;width: 80%;height: 100%">
			<div class="easyui-panel" title="" style="width: 100%;height: 100%">
				<table id="dg" class="easyui-datagrid" title="" style="width:100%;height:100%"
						data-options="
							iconCls: 'icon-edit',
							singleSelect: true,
							toolbar: '#tb',
							url: 'datagrid_data1.json',
							method: 'get',
							onClickRow: onClickRow
						">
					<thead>
						<tr>


							<th width="11%" data-options="field:'l1',align:'right',editor:{type:'numberbox',options:{precision:1}}">字段号</th>
							<th width="11%" data-options="field:'l2',align:'right',editor:'numberbox'">名称</th>
							<th width="11%" data-options="field:'l3',editor:'textbox'">数据类型</th>
							<th width="11%" data-options="field:'l4',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">选项字典</th>
							<th width="11%" data-options="field:'l5',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">引用字段</th>
							<th width="11%" data-options="field:'l6',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">不得重复</th>
							<th width="11%" data-options="field:'l7',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">必填</th>
							<th width="11%" data-options="field:'l8',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">公式设置</th>							
							<th width="12%"data-options="field:'l9',align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">顺序号</th>														
						</tr>
					</thead>
				</table>

				<div id="tb" style="height:auto">
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
				</div>

				<script type="text/javascript">
					var editIndex = undefined;
					function endEditing(){
						if (editIndex == undefined){return true}
						if ($('#dg').datagrid('validateRow', editIndex)){
							var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
							var productname = $(ed.target).combobox('getText');
							$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
							$('#dg').datagrid('endEdit', editIndex);
							editIndex = undefined;
							return true;
						} else {
							return false;
						}
					}
					function onClickRow(index){
					}
					function append(){
						if (endEditing()){
							$('#dg').datagrid('appendRow',{status:'P'});
							editIndex = $('#dg').datagrid('getRows').length-1;
							$('#dg').datagrid('selectRow', editIndex)
									.datagrid('beginEdit', editIndex);
						}
					}
					function removeit(){
						if (editIndex == undefined){return}
						$('#dg').datagrid('cancelEdit', editIndex)
								.datagrid('deleteRow', editIndex);
						editIndex = undefined;
					}
					function accept(){
						if (endEditing()){
							$('#dg').datagrid('acceptChanges');
						}
					}
					function reject(){
						$('#dg').datagrid('rejectChanges');
						editIndex = undefined;
					}
					function getChanges(){
						var rows = $('#dg').datagrid('getChanges');
						alert(rows.length+' rows are changed!');
					}
				</script>


			<!-- 	<table id="dg" style="width:100%;height:100%" title="" data-options="
				        rownumbers:false,
				        singleSelect:true,
				        autoRowHeight:false,
				        pagination:false,
				        fitColumns:true,
				        striped:false,
				        checkOnSelect:true,
				        selectOnCheck:true,
				        collapsible:true,
				        toolbar:'#tb',
				        pageSize:40">
				    <thead>
				        <tr href="#">
				            <th field="code" width="11%">字段号</th>
				            <th field="name" width="11%">名称</th>
				            <th field="level" width="11%">数据类型</th>
				            <th field="provide" width="11%">选项字典</th>
				            <th field="full" width="11%">引用字段</th>
				            <th field="issubmit" width="11%">不得重复</th>
				            <th field="status" width="11%">必填</th>
				            <th field="dealDate" width="11%">公式设置</th>
				            <th field="dealPeople" width="10%">顺序号</th>	            
				        </tr>
				    </thead>
				</table>
				<div id="tb" style="padding:0 30px;">
					<div class="opt-buttons">
					    <a href="#" class="easyui-linkbutton">新增</a>
					    <a href="#" class="easyui-linkbutton">引用</a>
						<a href="#" class="easyui-linkbutton">删除</a>
					</div>
				</div>   				 -->
			</div><!-- easyui-panel -->			     	 
        </div>
    </div>

  
</body> 
</html>
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
    for(var i=1; i<=30; i++){
        rows.push({
            code: '10695',
            name: '充电试验台',
            level: '检测设备',
            provide: '研发部',
            full: '北京',
            issubmit: '正常使用',
            status:'张一',
            note: '-'
        });
    }
    return rows;
}

$(function(){
    $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
});    


$(".more").click(function(){
    $(this).closest(".conditions").siblings().toggleClass("hide");
});

var printSetup = function(){      
	window.execwb(8,1);      
	// $("#dg").printArea();  
}      
var printPreView = function(){      
// 　　  document.all.wb.execwb(7,1);    　　      
	// $("#dg").printArea();  
}      
var printIt = function(){      
	if (confirm('确定打印吗？')) {      
		//wb.execwb(6,6)   ;  
        window.print();//update by liuguocheng  		   
	}
}

var windowClose = function(){  
    window.opener=null;   
    window.open('','_self');   
    window.close();  
};  
</script>
<script type="text/javascript">               
	$('#tt').tree({
	    onClick: function(node){
	        // alert(node.text);  // alert node text property when clicked
	        // addTabs(node.text,"123.jsp");
	        console.info("node.text = "+node.text);
	    }
	});
	// function addTabs(title,href)
 //    {
 //        var jq = top.jQuery;    
    
 //        if (jq("#tb").tabs('exists', title)){    
 //            jq("#tb").tabs('select', title);    
 //        } else {  
 //              var content = '<iframe scrolling="auto" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';     
 //               jq("#tb").tabs('add',{    
 //                                  title:title,    
 //                                  content:content,    
 //                                  closable:true    
 //                                });    
 //         }    

 //    }	
</script>
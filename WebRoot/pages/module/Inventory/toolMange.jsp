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
    <title>备件仓库</title> 

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
        <div class="easyui-panel" style="width: 100%;height:100%">
            <div class="left-tree" style="height: 100%;width: 15%;position:relative" >
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
            <div class="content" style="position:absolute;left:15%;top: 0;width: 85%;height: 100%">
    			<div class="easyui-panel" title="" style="width: 100%;height: 100%">
    				<table id="dg" style="width:100%;height:100%" title="" data-options="
    				        rownumbers:true,
    				        singleSelect:false,
    				        autoRowHeight:false,
    				        pagination:true,
    				        fitColumns:true,
    				        striped:true,
    				        checkOnSelect:false,
    				        selectOnCheck:false,
    				        collapsible:true,
    				        toolbar:'#tb',
    				        pageSize:20
                        ">
    				    <thead>
    				        <tr href="#">
    				            <th field="organization" width="12%">库存组织</th>
    				            <th field="warehouse" width="12%">仓库</th>
    				            <th field="materialCode" width="22%">品名</th>
    				            <th field="specs" width="22%">规格</th>
    				            <th field="model" width="20%">型号</th>
    				            <th field="primaryUnit" width="5%">单位</th>
    				            <th field="retainNumber" width="5%">数量</th>
                            </tr>
    				    </thead>
    				</table>
    				<div id="tb" style="padding:0 30px;">
    					<div class="conditions">
    						<span class="con-span">物料名称: </span><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>           
    					    <span class="con-span">规格: </span><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>           
                            <span class="con-span">物料编码: </span><input class="easyui-textbox" type="text" name="code" style="width:100px;height:35px;line-height:35px;"></input>           
    					    <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
    					    <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
    					    <!--<a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>-->
    					</div>
                        <div class="conditions">
                            <a id="butGongjuchuku" href="#" class="easyui-linkbutton">工具出库</a>
                            <a id="butGongjuruku" href="#" class="easyui-linkbutton">工具入库</a>
                        </div>
    					
                        <!--
                        <div class="opt-buttons">
    					    <a href="#" class="easyui-linkbutton" data-options="selected:true">新增</a>
    					    <a href="#" class="easyui-linkbutton">导出</a>
    						<a href="#" class="easyui-linkbutton" onclick="printPreView()">打印预览</a>
    						<a href="#" class="easyui-linkbutton" onclick="printIt()">打印</a>
    						<a href="#" class="easyui-linkbutton" onclick="printSetup()">打印设置</a>
    					</div>
                        -->
    				</div>   				
    			</div><!-- easyui-panel -->			     	 
            </div>
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


function getData()
{

                                // <th field="organization" width="12%">库存组织</th>
                                // <th field="warehouse" width="12%">仓库</th>
                                // <th field="materialCode" width="22%">品名</th>
                                // <th field="specs" width="22%">规格</th>
                                // <th field="model" width="20%">型号</th>
                                // <th field="primaryUnit" width="5%">单位</th>
                                // <th field="retainNumber" width="5%">数量</th>

    var rows = [];
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后工具库',
        materialCode: '螺丝刀',
        specs: 'T6',
        model: '',
        primaryUnit:'把',
        retainNumber: '35'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后工具库',
        materialCode: '螺丝刀',
        specs: 'T5',
        model: '',
        primaryUnit:'把',
        retainNumber: '21'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后工具库',
        materialCode: '万用表',
        specs: 'TD-9205',
        model: '',
        primaryUnit:'把',
        retainNumber: '35'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后工具库',
        materialCode: '扭力扳手',
        specs: 'DBS-5',
        model: '1~5 0.05 6.3 187',
        primaryUnit:'把',
        retainNumber: '7'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后工具库',
        materialCode: '钳子',
        specs: '',
        model: '',
        primaryUnit:'把',
        retainNumber: '56'
    });
    return rows; 
}
function getShandongData()
{
    var rows = [];
   rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后工具库',
        materialCode: '螺丝刀',
        specs: 'T6',
        model: '',
        primaryUnit:'把',
        retainNumber: '35'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后工具库',
        materialCode: '螺丝刀',
        specs: 'T5',
        model: '',
        primaryUnit:'把',
        retainNumber: '21'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后工具库',
        materialCode: '万用表',
        specs: 'TD-9205',
        model: '',
        primaryUnit:'把',
        retainNumber: '35'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后工具库',
        materialCode: '扭力扳手',
        specs: 'DBS-5',
        model: '1~5 0.05 6.3 187',
        primaryUnit:'把',
        retainNumber: '7'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后工具库',
        materialCode: '钳子',
        specs: '',
        model: '',
        primaryUnit:'把',
        retainNumber: '56'
    });      
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
	        //alert(node.text);  // alert node text property when clicked
	        //addTabs(node.text,"123.jsp");
            if(node.text=="总库")
            {
                console.info(node.text);
                $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
            }            
            if(node.text=="山东")
            {
                console.info(node.text);
                $('#dg').datagrid({data:getShandongData()}).datagrid('clientPaging');
            }
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
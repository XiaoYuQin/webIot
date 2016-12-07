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
    				            <th field="materialCode" width="12%">物料编码</th>
    				            <th field="materialName" width="12%">物料名称</th>
    				            <th field="specs" width="12%">规格</th>
    				            <th field="model" width="10%">型号</th>
    				            <th field="primaryUnit" width="5%">主单位</th>
    				            <th field="retainNumber" width="5%">结存主数量</th>
    				            <th field="reservedNumber" width="5%">预留主数量</th>
    				            <th field="frezzeNumber" width="5%">冻结主数量</th>
                                <th field="supplierRetainNumber" width="5%">供应商物权<br>结存主数量</th>
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
    					<div class="conditions hide">
    					    <span class="con-span">客户名称: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
    					    <span class="con-span">项目名称: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
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
    var rows = [];
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后材料库',
        materialCode: 'A0200101001',
        materialName: '继电器',
        specs: 'LEV100-24V',
        model: '',
        primaryUnit:'个',
        retainNumber: '35',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后材料库',
        materialCode: 'A0200508002',
        materialName: '硅胶垫2',
        specs: 'GN-AK8.1EV-2107517',
        model: '',
        primaryUnit:'件',
        retainNumber: '500',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后材料库',
        materialCode: 'A0200101001',
        materialName: '继电器',
        specs: 'AEV19024',
        model: '',
        primaryUnit:'个',
        retainNumber: '6',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后材料库',
        materialCode: 'A0200306006',
        materialName: '弹垫',
        specs: 'M10  镀锌',
        model: '',
        primaryUnit:'个',
        retainNumber: '1250',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '售后材料库',
        materialCode: 'A0200302046',
        materialName: '外六角螺栓',
        specs: 'M6*12  不锈钢',
        model: '',
        primaryUnit:'个',
        retainNumber: '1100',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    return rows; 
}
function getShandongData()
{
    var rows = [];
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200404006',
        materialName: '护套',
        specs: 'DJ33541',
        model: '',
        primaryUnit:'个',
        retainNumber: '2000',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200406008',
        materialName: '绝缘支柱',
        specs: 'SM7110',
        model: '',
        primaryUnit:'个',
        retainNumber: '50',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });        
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200407204',
        materialName: '扎带',
        specs: '3*100',
        model: '',
        primaryUnit:'包',
        retainNumber: '10000',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });        
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200507183',
        materialName: '2并绝缘板',
        specs: 'GN-LZ-2107500',
        model: '',
        primaryUnit:'个',
        retainNumber: '167',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });        
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200102007',
        materialName: '熔断器',
        specs: 'A70QS400-4',
        model: '',
        primaryUnit:'个',
        retainNumber: '70',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
    });        
    rows.push({
        organization: '北京国能电池科技有限公司',
        warehouse: '山东售后材料库',
        materialCode: 'A0200302011',
        materialName: '六角螺栓',
        specs: 'M6*16   镀锌',
        model: '',
        primaryUnit:'个',
        retainNumber: '750',
        reservedNumber: '0',
        frezzeNumber: '0',
        supplierRetainNumber: '0'
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
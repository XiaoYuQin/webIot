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
    <title>实时数据</title> 

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">

    <script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>


<style type="text/css">
    html, body{ margin:0; height:100%;width: 100%}
</style>



</head> 
<body>
	<div id="dlg" class="easyui-dialog" title="设备数据" data-options="" closed="true" style="width:850px;height:380px;padding:10px;">		
		<div id="echarttest" style="width:800px;height:300px"></div>
	</div>
    <div class="container" style="height: 100%;width: 100%">
       <table id="dg" style="width:100%;height:100%" title="全体设备列表" data-options="
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
                pageSize:20">
            <thead>
                <tr href="#">
                    <th field="t1" width="12%">客户名称</th>
                    <th field="t2" width="12%">项目名称</th>
                    <th field="t3" width="12%">车型</th>
                    <th field="t4" width="18%">使用单位</th>
                    <th field="t5" width="8%">牌照号</th>
                    <th field="t6" width="13%">VIN码</th>
                    <th field="t7" width="18%">产品编号</th>
                    <th field="t8" width="4%">设备状态</th>
                </tr>
            </thead>
        </table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <span class="con-span">VIN码: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:28px;line-height:28px;"></input>
            <span class="con-span">项目名称: </span><input class="easyui-textbox" type="text" name="name" style="width:166px;height:28px;line-height:28px;"></input>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
            <a href="#" class="easyui-linkbutton">导出</a>
            <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> -->
            <!-- <a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a> -->
        </div>
<!--         <div class="conditions hide">
            <span class="con-span">责任人: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">所在地区: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
            <span class="con-span">使用状况: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>正常</option><option>维护</option><option>维修</option></select>
            <span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">
        </div> -->
<!--         <div class="opt-buttons">
            <a href="#" class="easyui-linkbutton" data-options="selected:true">新增</a>
            <a href="#" class="easyui-linkbutton">导出</a>
        </div> -->
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
            for(var i=1; i<=800; i++){
                rows.push({
                    t1: '河南少林客车股份有限公司',
                    t2: '少林9米',
                    t3: '少林纯电动客车',
                    t4: '林州市天安公共交通有限责任公司',
                    t5: '豫EGJ983',
                    t6: 'LS8GDEB44F1003261',
                    t7: '-',
                    t8: '-'
                });
            }
            return rows;
        }
		$('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: "",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		            // alert('code:' + row.code + "\n LoginID:" + row.name);  
		            $('#dlg').dialog('open');
		        }  
		    }  
		})
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });    

        $(".more").click(function(){
            $(this).closest(".conditions").siblings().toggleClass("hide");
        });

    </script>
</body> 
</html>
<script type="text/javascript">
  	// 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });
    // 使用
    require(
        [
            'echarts',
            'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
            'echarts/chart/gauge' // 使用柱状图就加载bar模块，按需加载
        ],
        function (ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('echarttest')); 
            
            option = {
                title : {
                    text: '每日最高最低电压',
                    subtext: ''
                },
                tooltip : {
                    trigger: 'axis'
                },
                toolbox: {
                    show : false,
                    feature : {
                        dataZoom : {show: true},
                        mark : {show: false},
                        dataView : {show: false},
                        magicType : {show: false, type: ['line', 'bar', 'stack', 'tiled']},
                        restore : {show: false},
                        saveAsImage : {show: false}
                    }
                },
                calculable : true,
                dataZoom : {
                    show : true,
                    realtime : true,
                    start : 20,
                    end : 80
                },
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : function (){
                            var list = [];
                            for (var i = 1; i <= 30; i++) {
                                list.push('2016-03-' + i);
                            }
                            return list;
                        }()
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} 伏特'
                        }
                    }
                ],
                series : [
                    {
                        name:'最高电压',
                        type:'line',
                        data:function (){
                            var list = [];
                            for (var i = 1; i <= 30; i++) {
                                list.push(Math.round(Math.random()* 30)+500);
                            }
                            return list;
                        }()
                    },
                     {
                        name:'最低电压',
                        type:'line',
                        data:function (){
                            var list = [];
                            for (var i = 1; i <= 30; i++) {
                                list.push(Math.round(Math.random()* 20)+480);
                            }
                            return list;
                        }()
                    }
                ]
            };
                // 为echarts对象加载数据 
            myChart.setOption(option); 
                                
                                
        }
    );

</script>
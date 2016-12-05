<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>维修站费用结算</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css">

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

<style type="text/css">
    html, body{ margin:0; height:100%;width: 100%}
</style>



</head> 
<body>
	<div id="showSettlementDlg" class="easyui-dialog" title="维修站费用结算" data-options="" closed="true" style="width:1200px;height:500px;padding:10px;">		
		<table id="showSettlementTable" class="kv-table">
			<tbody>
				<tr>
					<td colspan="14" class="kv-label" style="text-align: center;font-size: 20px" width="100%">结算单</td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">接收单位</td>
					<td class="kv-content" colspan="5">南宫市李阳轿车修理厂</td>
					<td class="kv-label" colspan="2">发出单位</td>
					<td class="kv-content" colspan="5">北京国能电池科技有限公司</td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">收件人</td>
					<td class="kv-content" colspan="1">李阳</td>
					<td class="kv-label" colspan="1">电话</td>
					<td class="kv-content" colspan="3">13171852108</td>
					<td class="kv-label" colspan="2">发出日期</td>
					<td class="kv-content" colspan="5">2016/12/4</td>
				</tr>
				<tr>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >项目日期</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >报单数量<br>(张)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >核单数量<br>(张)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >报工时<br>(个)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >核工时<br>(个)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >单价<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >拖车费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >配件费<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >材料费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >辅料费<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >话费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >其他<br>(元)</td>		
					<td class="kv-label" style="text-align: center;padding:0px 0;" >拟合计<br>金额<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >备注</td>															
				</tr>	
				<tr>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >10月</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >4</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >4</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >78</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >78</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >18</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >0</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >0</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >0</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >0</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >0</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >1417.5</td>		
					<td class="kv-label" style="text-align: center;padding:0px 0;" >2821.5</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >1417.5外出人员补助</td>															
				</tr>					
				<tr>
					<td class="kv-label" colspan="2">扣款项</td>
					<td class="kv-content" colspan="5"></td>
					<td class="kv-label" colspan="2">扣款金额</td>
					<td class="kv-content" colspan="5"></td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">合计金额</td>
					<td class="kv-content" colspan="5">2821.50</td>
					<td class="kv-label" colspan="2">大写金额</td>
					<td class="kv-content" colspan="5">贰仟捌佰壹拾壹元五角整</td>
				</tr>		
				<tr>
					<td class="kv-label" colspan="1">编制</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">部门经理</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">分管副总</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">财务审核</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">财务总监</td>
					<td class="kv-content" colspan="2"></td>
					<td class="kv-label" colspan="1">总裁</td>
					<td class="kv-content" colspan="2"></td>										
				</tr>	
				<tr>
					<td class="kv-label" colspan="1">注：</td>
					<td class="kv-content" colspan="13">请贵公司尽快回执</td>
				</tr>	
				<tr>
					<td class="kv-label" colspan="3">国能电池索赔结算专员</td>
					<td class="kv-content" colspan="2">刘瑞燕</td>
					<td class="kv-label" colspan="3">联系电话</td>
					<td class="kv-content" colspan="2">15810287053</td>
					<td class="kv-label" colspan="2">邮箱</td>
					<td class="kv-content" colspan="3">chpower_lry@163.com</td>										
				</tr>	
			</tbody>
		</table>	
	</div>

	<div id="CreateSettlementDlg" class="easyui-dialog" title="创建维修站费用结算单" data-options="" closed="true" style="width:1200px;height:500px;padding:10px;">		
		<table id="CreateSettlementTable" class="kv-table">
			<tbody>
				<tr>
					<td colspan="14" class="kv-label" style="text-align: center;font-size: 20px" width="100%">结算单</td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">接收单位</td>
					<td class="kv-content" colspan="5">南宫市李阳轿车修理厂</td>
					<td class="kv-label" colspan="2">发出单位</td>
					<td class="kv-content" colspan="5">北京国能电池科技有限公司</td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">收件人</td>
					<td class="kv-content" colspan="1">李阳</td>
					<td class="kv-label" colspan="1">电话</td>
					<td class="kv-content" colspan="3">13171852108</td>
					<td class="kv-label" colspan="2">发出日期</td>
					<td class="kv-content" colspan="5">2016/12/4</td>
				</tr>
				<tr>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >项目日期</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >报单数量<br>(张)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >核单数量<br>(张)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >报工时<br>(个)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >核工时<br>(个)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >单价<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >拖车费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >配件费<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >材料费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >辅料费<br>(元)</td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" >话费<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >其他<br>(元)</td>		
					<td class="kv-label" style="text-align: center;padding:0px 0;" >拟合计<br>金额<br>(元)</td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" >备注</td>															
				</tr>	
				<tr>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" editor='numberbox'></td>		
					<td class="kv-label" style="text-align: center;padding:0px 0;" editor='numberbox'></td>
					<td class="kv-content" style="text-align: center;padding:0px 0;" data-options="editor:'text'"></td>															
				</tr>					
				<tr>
					<td class="kv-label" colspan="2">扣款项</td>
					<td class="kv-content" colspan="5"></td>
					<td class="kv-label" colspan="2">扣款金额</td>
					<td class="kv-content" colspan="5"></td>
				</tr>
				<tr>
					<td class="kv-label" colspan="2">合计金额</td>
					<td class="kv-content" colspan="5">2821.50</td>
					<td class="kv-label" colspan="2">大写金额</td>
					<td class="kv-content" colspan="5">贰仟捌佰壹拾壹元五角整</td>
				</tr>		
				<tr>
					<td class="kv-label" colspan="1">编制</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">部门经理</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">分管副总</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">财务审核</td>
					<td class="kv-content" colspan="1"></td>
					<td class="kv-label" colspan="1">财务总监</td>
					<td class="kv-content" colspan="2"></td>
					<td class="kv-label" colspan="1">总裁</td>
					<td class="kv-content" colspan="2"></td>										
				</tr>	
				<tr>
					<td class="kv-label" colspan="1">注：</td>
					<td class="kv-content" colspan="13">请贵公司尽快回执</td>
				</tr>	
				<tr>
					<td class="kv-label" colspan="3">国能电池索赔结算专员</td>
					<td class="kv-content" colspan="2">刘瑞燕</td>
					<td class="kv-label" colspan="3">联系电话</td>
					<td class="kv-content" colspan="2">15810287053</td>
					<td class="kv-label" colspan="2">邮箱</td>
					<td class="kv-content" colspan="3">chpower_lry@163.com</td>										
				</tr>	
			</tbody>
		</table>	
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
                pageSize:10">
            <thead>
                <tr href="#">
                    <th field="receiveUnit" width="10%">接收单位</th>
                    <th field="sendUnit" width="10%">发出单位</th>
                    <th field="receiver" width="5%">接收人</th>
                    <th field="call" width="10%">电话</th>
                    <th field="theme" width="53%">主题</th>
                    <th field="date" width="10%">日期</th>
                </tr>
            </thead>
        </table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <span class="con-span">接收单位: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">发出单位: </span><input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">日期: </span><input class="easyui-datebox" style="width:166px;height:35px;line-height:35px;">		            
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
            <a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="CreateSettlement()">新增</a>                        
        </div>
        <div class="conditions hide">
            <span class="con-span">接收人: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">电话: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
            <span class="con-span">主题: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
        </div>
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


                    // <th field="receiveUnit" width="10%">接收单位</th>
                    // <th field="sendUnit" width="10%">发出单位</th>
                    // <th field="receiver" width="5%">接收人</th>
                    // <th field="call" width="10%">电话</th>
                    // <th field="theme" width="53%">主题</th>
                    // <th field="date" width="10%">日期</th>

        function getData(){
            var rows = [];

            rows.push({
                receiveUnit: '南宫市李阳轿车修理厂',
                sendUnit: '北京国能电池科技有限公司',
                receiver: '李阳',
                call: '13171852100',
                theme: '关于保定邢台南宫市李阳轿车修理厂2016年1月维修费用结算事宜',
                date: '2016/12/4'
            });
            rows.push({
                receiveUnit: '南宫市李阳轿车修理厂',
                sendUnit: '北京国能电池科技有限公司',
                receiver: '李阳',
                call: '13171852100',
                theme: '关于保定邢台南宫市李阳轿车修理厂2016年2月维修费用结算事宜',
                date: '2016/12/4'
            });
            rows.push({
                receiveUnit: '南宫市李阳轿车修理厂',
                sendUnit: '北京国能电池科技有限公司',
                receiver: '李阳',
                call: '13171852100',
                theme: '关于保定邢台南宫市李阳轿车修理厂2016年3月维修费用结算事宜',
                date: '2016/12/4'
            });

            return rows;
        }
		$('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    method:'get',  
		    striped: true,  
		    title: "员工列表",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		            // alert('code:' + row.code + "\n LoginID:" + row.name);  
		            $('#showSettlementDlg').dialog('open');
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
                    text: '探针检测仪3月份使用时间统计',
                    subtext: ''
                },
                tooltip : {
                    trigger: 'axis'
                },
                toolbox: {
                    show : true,
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
                            formatter: '{value} 分钟'
                        }
                    }
                ],
                series : [
                    {
                        name:'时长',
                        type:'line',
                        data:function (){
                            var list = [];
                            for (var i = 1; i <= 30; i++) {
                                list.push(Math.round(Math.random()* 30));
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
<script type="text/javascript">
	function CreateSettlement()
	{
		$('#CreateSettlementDlg').dialog('open');
	}
</script>
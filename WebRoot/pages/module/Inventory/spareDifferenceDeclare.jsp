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
    <title>文件审批</title> 

<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers1.css"> -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/process.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/js/umeditor/themes/default/css/umeditor.css">
<!-- <link href="js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet"> -->

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>/pages/js/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/pages/js/umeditor/umeditor.config.js"></script>


	<style type="text/css">
	    html, body{ margin:0; height:100%; }
	</style>
</head> 
<body>
<!-- 审批窗口 -->
	<div id="dlgApproval" class="easyui-dialog" title="勘查审批" data-options="closed:true,closed:true,buttons:'#dlg-buttons'" 
		style="width:600px;height:430px;padding:10px;overflow: hidden;" >
		<div class="conditions">
			<span class="con-span">&#12288;申请人:</span>
			<!-- <span class="con-span" style="width:120px;height:35px;line-height:35px;">王瑞明</span> -->
			<input class="easyui-textbox" type="text" name="code" style="width:120px;height:35px;line-height:35px;" readonly="true" value="王瑞明"></input>           
			<span class="con-span">申请时间: </span>
			<!-- <span class="con-span" style="width:120px;height:35px;line-height:35px;">2016/11/26 10:13</span> -->
			<input class="easyui-textbox" type="text" name="code" style="width:160px;height:35px;line-height:35px;" readonly="true" value="2016/11/26 10:13"></input>         			
		</div>   
		<div class="conditions" style="margin-top: 10px">
			<span class="con-span">审批描述:</span>
			<input 	class="easyui-textbox" data-options="multiline:true" 
					value="由于之前丢失了100个m6 螺丝，目前库存只有400颗。"
					readonly="true" 
					style="width:500px;height:100px"
					></input>           			
		</div>  		 		
		<div class="conditions" style="margin-top: 10px">
			<span class="con-span">&#12288;审批人:</span>
			<input class="easyui-textbox" type="text" name="code" style="width:120px;height:35px;line-height:35px;"></input>           
			<span class="con-span">&#12288;&#12288;审批:</span>
			<input class="easyui-switchbutton" onText="通过" offText="驳回" name="unitState" style="width:120px;height:35px;line-height:35px;">        			
        </div>    
        <div class="conditions" style="margin-top: 10px">
        	<div class="con-span">审批意见: </div>
        	<div class="con-span" style="margin-top: 10px"></div>
        </div>
        <div class="conditions" style="margin-top: 10px;margin-left: 55px">
			<!-- <div style="width: 500px;height: 150px;margin-left:150px" id="editor-state-approval" class="editor-state"></div>	         -->
			<input class="easyui-textbox" data-options="multiline:true" value="" style="width:500px;height:100px"></input>           						
		</div>
	</div>
	<div id="dlg-buttons">
		<table cellpadding="0" cellspacing="0" style="width:100%">
			<tr>
				<td style="text-align:right">
					<a id="btnCreatSave" href="#" class="easyui-linkbutton" iconCls="icon-save">提交</a>
					<a id="btnCreatCancel" href="#" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
				</td>
			</tr>
		</table>
	</div>




	<div id="newApprovalDialog" class="easyui-dialog" title="新建申请" data-options="closed:true" style="width:700px;height:490px;padding:10px;">
		<div class="conditions">
            <span class="con-span">申请人: </span><input class="easyui-textbox" type="text" name="code" style="width:80px;height:35px;line-height:35px;"></input>           
			<span class="con-span">审批人: </span><select class="easyui-combobox" name="language" style="height:35px;width:80px;"><option>领导1</option><option>领导2</option></select>            
<!-- 			<span class="con-span">选择文件: </span><input class="easyui-filebox" name="file1" buttonText="选择文件" data-options="prompt:'选择文件'" style="width:166px;height:35px;"> -->
			<span class="con-span">日期: </span><input class="easyui-textbox" type="text" name="code" style="width:120px;height:35px;line-height:35px;" prompt="2016/11/26 10:13"></input>           
        </div>        
        <div class="conditions" style="margin-top: 30px">
        	<div class="con-span">审批描述: </div>
        	<div class="con-span" style="margin-top: 10px"></div>
        	<div id="editor-state" class="editor-state" style="width: 670px"></div>	        		
        </div>   
        <div class="conditions" style="margin-top: 30px">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">确定</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-reload">取消</a>       		
        </div>  					
	</div>
	<div id="dlg" class="easyui-dialog" title="审批日志查看" data-options="closed:true" style="width:720px;height:490px;padding:10px;">
		<div class="time-line">
			<div class="time-item date">
				<div class="content-left first">
					<span>2016-04-25</span>
					<label><span class="dot"></span><i class="line"></i></label>
				</div>
			</div>
			<div class="time-item time">
				<div class="content-left">
					<span>15:58:34</span>
					<label><i class="line"></i><span class="dot"></span></label>
				</div>
				<div class="content-right">
					<span class="left-arrow"></span>
					<div class="detail-outer">
						<div class="detail">
							<div>
								<span class="name">申请</span>
								<label></label>
								<span class="status"></span>
							</div>
							<div>
								<span class="name"></span>
								<label>申请人:</label>
								<span class="status">李默</span>
							</div>
							<div>
								<span class="name"></span>
								<label>审批人:</label>
								<span class="status">夏明</span>
							</div>
							<div>
								<span class="name"></span>
								<label>文件名:</label>
								<span class="status">《关于建立企业文化的规定》</span>
							</div>	
							<div>
								<span class="name"></span>
								<label>描述&nbsp;&nbsp;&nbsp;:</label>
								<span class="status">《关于建立企业文化的规定》：对于企业文化规定的2016年修订版。</span>
							</div>																						
						</div>
					</div>
				</div>
			</div>
			<div class="time-item time important">
				<div class="content-left">
					<span>17:00:21</span>
					<label><i class="line"></i><span class="dot"></span></label>
				</div>
				<div class="content-right">
					<span class="left-arrow"></span>
					<div class="detail-outer">
						<div class="detail">
							<div>
								<span class="name">驳回</span>
								<label></label>
								<span class="status"></span>
							</div>
							<div>
								<span class="name"></span>
								<label>驳回意见：</label>
								<span class="status">描述不够清晰</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="time-item date">
				<div class="content-left">
					<span>2016-04-26</span>
					<label><span class="dot"></span><i class="line"></i></label>
				</div>
			</div>
			<div class="time-item time">
				<div class="content-left">
					<span>09:21:14</span>
					<label><i class="line"></i><span class="dot"></span></label>
				</div>
				<div class="content-right">
					<span class="left-arrow"></span>
					<div class="detail-outer">
						<div class="detail">
							<div>
								<span class="name">申请</span>
								<label></label>
								<span class="status"></span>
							</div>
							<div>
								<span class="name"></span>
								<label>申请描述：</label>
								<span class="status">重新更改了实施的详细方法。</span>
							</div>							
						</div>
					</div>
				</div>
			</div>
			<div class="time-item last">
				<div class="content-left">
					<label><i class="line"></i><span class="dot"></span></label>
				</div>
			</div>
		</div>
	</div>
	<!-- <div id="tt">
		<a href="javascript:void(0)" class="icon-add" ></a>
	</div>		 -->
	<div class="easyui-panel" style="width: 100%;height:100%">
		<table id="dg" style="width:100%;height:100%" title="全体供应商列表" data-options="
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
		        <tr>
		            <th field="id" width="110">编号</th>
		            <th field="fileName" width="226">差异申报主题</th>
		            <th field="sponsor" width="112">申请人</th>
		            <th field="leader" width="112">审批人</th>
		            <th field="status" width="170">审批状态</th>
		            <th field="date" width="130">时间</th>
		            <th field="t7" width="120">审批</th>		        
		            <th field="t8" width="120">日志</th>		  
		            <th field="t9" width="120">修改</th>		            
		            <!-- <th field="operate" width="136">操作</th> -->
<!-- 		            <th field="note" width="105">备注</th> -->
		        </tr>
		    </thead>
		</table>
		<div id="tb" style="padding:0 30px;">
			文件名: <input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
			申请人: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
			<a href="#" class="easyui-linkbutton" onclick="create()">新建申请</a>
		</div>
	</div>

</body> 
</html>
    
<script type="text/javascript">
	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });

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
            id: '20160908',
            fileName: '2016年9月份备件差异申请表',
            sponsor: '李默',
            leader: '夏明',
            status: '待审',
            date: '2013-09-09 15:05',
            t7: "<a href='#' onclick='approval()'>审批</a>",
            t8: "<a href='#' onclick='view()'>查看</a>",
            t9: "<a href='#' onclick='modify()'>修改</a>"
        });
		rows.push({
            id: '20130907',
            fileName: '2016年10月份备件差异申请表',
            sponsor: '王琦',
            leader: '夏明',
            status: '待审',
            date: '2013-09-08 14:02',
            t7: "<a href='#' onclick='approval()'>审批</a>",
            t8: "<a href='#' onclick='view()'>查看</a>",
            t9: "<a href='#' onclick='modify()'>修改</a>"
        });
		rows.push({
            id: '20130906',
            fileName: '2016年11月份备件差异申请表',
            sponsor: '王琦',
            leader: '刘洋',
            status: '待审',
            date: '2013-09-07 13:16',
            t7: "<a href='#' onclick='approval()'>审批</a>",
            t8: "<a href='#' onclick='view()'>查看</a>",
            t9: "<a href='#' onclick='modify()'>修改</a>"
        });
		rows.push({
            id: '20130905',
            fileName: '2016年12月份备件差异申请表',
            sponsor: '夏明',
            leader: '李默',
            status: '待审',
            date: '2013-09-06 10:36',
            t7: "<a href='#' onclick='approval()'>审批</a>",
            t8: "<a href='#' onclick='view()'>查看</a>",
            t9: "<a href='#' onclick='modify()'>修改</a>"
        });
		rows.push({
            id: '20130904',
            fileName: '2016年8月份备件差异申请表',
            sponsor: '张扬',
            leader: '李默',
            status: '待审',
            date: '2013-09-05 13:25',
            t7: "<a href='#' onclick='approval()'>审批</a>",
            t8: "<a href='#' onclick='view()'>查看</a>",
            t9: "<a href='#' onclick='modify()'>修改</a>"
        });                                
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
	            // $('#dlg').dialog('open');
	        }  
	    }  
	})
	$(function(){
	    $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
	});    

	$(".more").click(function(){
	    $(this).closest(".conditions").siblings().toggleClass("hide");
	});      


	function create()
	{
		$('#newApprovalDialog').dialog({"title":"新建申请"});
		$('#newApprovalDialog').dialog('open');
	}
	function approval()
	{
		console.info("approval");
		$('#dlgApproval').dialog('open');
	}
	function view()
	{
		console.info("view");
		$('#dlg').dialog('open');
	}
	function modify()
	{
		console.info("modify");
		$('#newApprovalDialog').dialog({"title":"修改申请"});
		$('#newApprovalDialog').dialog('open');
	}
	newApprovalDialog
</script>
<script type="text/javascript">
	var stateApproval = UM.getEditor('editor-state-approval');
	stateApproval.setWidth("98%");
	$(".edui-body-container").css("width", "98%");

	function selectUser()
	{
		$('#dlgSelectUser').dialog('open');
	}
	$('#cc').combotree('loadData', [{ id: 1, text: 'Languages', children: [{ id: 11, text: 'Java' },{ id: 12, text: 'C++' }] }]); 
	// $('#cc').combotree('loadData', ${treeData});
</script>
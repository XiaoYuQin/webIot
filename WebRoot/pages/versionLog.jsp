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
    html, body{ margin:0; height:100%;}


    /*企业简介样式*/
	.jianjie02{width:730px;margin:5px auto;background-color:#FFF;float:right;padding-bottom:10px;}
	.jianjie{width:940px;margin: 0 auto;background-color:#FFF; padding-bottom:5px;}

	.scr_tit01{width:935px; height:32px; float:left; text-align:left;margin-left:5px;}
	.scr_tit01 img{width:5px;float:left;margin-top:11px;margin-right:10px;}
	.scr_tit01 h4{font-family:"微软雅黑"; font-size:14px; font-weight:bold; height:38px; line-height:38px;}
	.scr_con01{margin:3px 5px; line-height:21px; text-align:left;}

	/*#dg .datagrid-header{position: absolute;visibility: hidden;}*/
</style>


<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

<!-- <style type="text/css">
    #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style> -->

</head> 
<body style="overflow: hidden;">
    <div class="container" style="width: 100%;height: 100%">
		<div class="easyui-panel" title="" style="width: 100%;height: 100%">

			<div class="jianjie">
		        <div class="scr_tit01">
		        	<img style="height: 30px;width: 10px" src="<%=basePath%>/pages/images/biaoqian02.jpg"/>
		        	<h4 style="font-size: 23px;font-weight: bold">V0.0.3</h4><br/>
		        </div>
		        <div class="scr_con01">
		        	<h4 style="font-size: 20px;margin-left: 20px;">2016/12/15 00:54</h4><br/>		        
			        <div style="font-size: 17px;">- 增加即时通讯页面；</div><br/>
                    <div style="font-size: 17px;">- 修改设备地图界面，增加电池包各组温度及电压的详情情况，增加数据曲线查看窗口；</div><br/>
		        </div> 
		    </div>	


			<div class="jianjie">
		        <div class="scr_tit01">
		        	<img style="height: 30px;width: 10px" src="<%=basePath%>/pages/images/biaoqian02.jpg"/>
		        	<h4 style="font-size: 23px;font-weight: bold">V0.0.2</h4><br/>
		        </div>
		        <div class="scr_con01">
		        	<h4 style="font-size: 20px;margin-left: 20px;">2016/12/11 12:13</h4><br/>		        
			        <div style="font-size: 17px;">- 修正报修界面下新增按钮无效的bug；</div><br/>
		        </div> 
		    </div>		    

			<div class="jianjie">
		        <div class="scr_tit01">
		        	<img style="height: 30px;width: 10px" src="<%=basePath%>/pages/images/biaoqian02.jpg"/>
		        	<h4 style="font-size: 23px;font-weight: bold">V0.0.1</h4><br/>
		        </div>
		        <div class="scr_con01">
		        	<h4 style="font-size: 20px;margin-left: 20px;">2016/12/10 17:35</h4><br/>		        
			        <div style="font-size: 17px;">- 增加版本日志界面；</div><br/>
	                <div style="font-size: 17px;">- 增加维修单表格界面，可以通过维修单页面查看；</div><br/>
	                <div style="font-size: 17px;">- 增加维修审批界面；</div><br/>
	                <div style="font-size: 17px;">- 增加维修界面；</div><br/>
	                <div style="font-size: 17px;">- 增加维修单界面，用来查看所有维修单</div><br/>
		        </div> 
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

        function getData(){
            var rows = [];

            rows.push({
                code: '东风神宇车辆有限公司'
            });
            rows.push({
                code: '东风柳州汽车有限公司'
            });
            rows.push({
                code: '丹东市金盾专用汽车有限公司'
            });
            rows.push({
                code: '大庆汽车改装厂'
            }); 
            rows.push({
                code: '大连叉车有限责任公司'
            }); 
			rows.push({
                code: '大港油田集团有限责任公司'
            }); 
			rows.push({
                code: '滁州市广通汽车有限公司'
            }); 
			rows.push({
                code: '成都王牌汽车集团股份有限公司'
            }); 
			rows.push({
                code: '成都市天马汽车有限责任公司'
            }); 
			rows.push({
                code: '成都华锐特种车辆有限公司'
            }); 
			rows.push({
                code: '长沙中联四星客车有限公司'
            }); 
			rows.push({
                code: '长沙芙蓉汽车制造厂'
            }); 
			rows.push({
                code: '长春恒力专用汽车制造有限公司'
            }); 
            rows.push({
                code: '湖北江南专用特种汽车有限公司'
            }); 
            rows.push({
                code: '东风杭州汽车有限公司客车厂'
            }); 
            rows.push({
                code: '大庆春圆汽车改装有限公司'
            }); 
            rows.push({
                code: '承德陆上先锋工业有限责任公司'
            }); 
            rows.push({
                code: '常州兰陵特种汽车制造有限公司'
            }); 
            rows.push({
                code: '长城汽车股份有限公司'
            }); 
            rows.push({
                code: '长春扶桑汽车改装有限公司'
            }); 
            rows.push({
                code: '北京中城汽机械设备制造有限公司'
            }); 

            return rows;
        }
        
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });  

         $('#dg').datagrid({  
		    // url: 'Handler.ashx',  
		    // method:'get',  
		    striped: true,  
		    // title: "文件审批",  
		    onClickRow: function (rowIndex)  
		    {  
		        var row = $('#dg').datagrid('getSelected');  
		        if (row) {  
		            // alert('code:' + row.code);  
		            // $('#dlg').dialog({title:row.t3});
		            // $('#dlg').dialog('open');
		            
		            $('#qiyemingcheng').text(row.code);
		            if(row.code=="东风神宇车辆有限公司")
		            {
		            	$('#jianJieNeiRong').html('&nbsp;&nbsp;&nbsp; 东风神宇车辆有限公司成立于1998年4月，是中国四大汽车工业集团之一东风汽车公司的子公司，是东风经济型商用车业务的主力军。<br/>&nbsp;&nbsp;&nbsp; 公司总部位于湖北省十堰市茅箭区东环路东益大道6号，注册资本2.687亿元，员工1100多人，占地面积77.67万平方米。主要生产阵地有神宇工厂、华神工厂、技术中心、零部件分公司，拥有3条整车生产线、3条整车检测线，年单班产能3.5万辆。<br/>&nbsp;&nbsp;&nbsp; 公司主要产品是东风牌、神宇牌、华神牌重、中、轻、微全系列经济型商用车。建立了完善的营销体系和售后服务体系，产品远销海内外29个省3个直辖市及东南亚、南美、中东、欧洲等十几个国家，年销售收入20余亿元。零部件产品主要有横向稳定杆、吊耳、散热器等，为东风公司及社会汽车企业配套。 <br/>&nbsp;&nbsp;&nbsp; 公司自成立以来，秉承东风文化，肩负“奉献神宇精品，传递永恒价值”企业使命，坚持 “市场为源，客户为本，诚信为基，员工为根”经营理念，不懈追求管理上档次、生产上规模、质量上台阶，致力于打造东风商用车第三极，成为东风商用车第二品牌建设的主力军。');
		            }
		           	if(row.code=="东风柳州汽车有限公司")			            
		            $('#jianJieNeiRong').html("&nbsp;&nbsp;&nbsp;<p>&nbsp;&nbsp;&nbsp; 中国大型商用车、乘用车股份公司——东风柳州汽车有限公司，成立于20世纪50年代初，是广西第一家老字号汽车企业。公司旗下品牌包括“东风霸龙”、“东风龙卡”、“东风风行”、“东风乘龙”。<br/>&nbsp;<br/>&nbsp;&nbsp;&nbsp; 作为东风汽车集团成员之一，东风柳汽率先建立现代化企业制度。公司拥有完善的生产配套设施、计算机辅助设计、以及制造系统，其产品研发和制造水平得到持续提升。同时东风柳汽重视国内外先进的管理经验、先进的汽车设计技术和理念的引进，不断破旧立新汽车产品，其中，独具人性化设计的东风风行多功能商旅车引领时代风向。</p><p>&nbsp;&nbsp;&nbsp; 东风柳汽拥有88万平米的经营基地，及三千余人的员工队伍，总资产近24亿，商用车和乘用车年产能共达11万余台。产品生产分为东风霸龙、东风龙卡等系列，涉及牵引车、仓栏车、自卸车、载货汽车、专用车等多元化类别。其中商用车研产以轻型和重型车型为主。公司多项类产品荣获国家专利，公司先后荣获“消费者十大满意品牌”、“中国MPV市场品质信誉第一品牌”等称号。<br/>&nbsp;<br/>&nbsp;&nbsp;&nbsp; 多年来，东风柳州注重把脉市场、以市场需求为导向，不断推陈出新，开发出引领市场需求的高附加值商用车和乘用车产品，营销网络覆盖全国市场，并辐射海外市场。秉承“服务客户，造福社会”的企业经营理念，东风柳汽正在海内外群雄逐鹿的市场竞争中，整合资源、锐意变革，突飞猛进，谱写辉煌。");
		        }  
		    }  
		})      
    </script>
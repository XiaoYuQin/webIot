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
    <title>工作台</title> 

<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">
<link rel="stylesheet" href="css/workbench.css">
<!-- <link rel="stylesheet" href="css/basic_info.css" > -->

<!-- <style type="text/css">
    #banbenrizhi-headerCls{font-weight: bold}}
</style> -->

</head> 
<body>
    <div class="container">
        <div id="hd">
            
        </div>

        <div id="bd">
            <div class="bd-content">
                <div class="right-zone">
                    <div class="inform item-box">
                        <div class="inform-hd">
                            <label>最新文件</label>
                            <a href="javascript:;">更多<span>&gt;</span></a>
                        </div>
                        <ul>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">信息管理办法<i></i></a>
                                <label>04-13</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">2016年值班表<i></i></a>
                                <label>04-12</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">库房管理制度</a>
                                <label>04-11</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">人员档案管理制度</a>
                                <label>04-10</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">车辆管理制度</a>
                                <label>04-09</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">消防安全管理制度</a>
                                <label>04-08</label>
                            </li>
                        </ul>
                    </div>
                    <div class="price item-box">
                        <div class="inform-hd">
                            <label>最新公告</label>
                            <a href="javascript:;">更多<span>&gt;</span></a>
                        </div>
                        <ul>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">国庆放假通知</a>
                                <label>04-13</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">新工作服发放通知</a>
                                <label>04-12</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">统计办公室损坏桌椅</a>
                                <label>04-11</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">公司升级电脑的通知</a>
                                <label>04-10</label>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">库房年终盘点提醒</a>
                                <label>04-09</label>
                            </li>     
                        </ul>
                    </div>
                    <div class="attached item-box">
                        <div class="inform-hd">
                            <label>常用附件下载</label>
                            <a href="javascript:;">更多<span>&gt;</span></a>
                        </div>
                        <div class="attached-tab">
                            <a href="javascript:;" class="current item-left" attached="public-attached">公开附件</a>
                            <a href="javascript:;" class="item-right" attached="inner-attached">内部附件</a>
                        </div>
                        <ul class="public-attached">
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">公司产品名录</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">公司文件版权规定</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">意见建议反馈内容模版</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">申请用户的办法</a>
                            </li>
                        </ul>
                        <ul class="inner-attached hide">
                           <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">意见建议反馈内容模版</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">这里显示的不同内容</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">界面设计作品PSD源文件免费下载</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">系统错误修复文档下载分布</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">采集信息管理系统后台界面</a>
                            </li>
                            <li>
                                <span></span>
                                <a href="javascript:;" class="ellipsis">用户管理信息文件同步</a>
                            </li>
                        </ul>
                    </div>     
                </div>
                <div class="center-part">
                    <div class="center-items todo">
                        <div class="calendar-part">
                             <div class="easyui-calendar" style="width:205px;height:231px;"></div>
                        </div>
                        <ul class="work-items clearfix">
                            <li>
                                <div class="work-inner">
                                    <div class="work-item green">
                                        <i class="iconfont">&#xe63c;</i>
                                        <span class="num">2&nbsp;<span class="unit">个</span></span>
                                        <label>待审批文件</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item red">
                                         <i class="iconfont">&#xe9b9;</i>
                                        <span class="num">6&nbsp;<span class="unit">条</span></span>
                                        <label>预警信息未读</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item yellow">
                                         <i class="iconfont">&#xe60f;</i>
                                        <span class="num">9&nbsp;<span class="unit">封</span></span>
                                        <label>邮件未读</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item blue">
                                         <i class="iconfont">&#xe64e;</i>
                                        <span title="2000,00万" class="num">3&nbsp;<span class="unit">个</span></span>
                                        <label>新入职员工</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item purple">
                                         <i class="iconfont">&#xe76e;</i>
                                        <span title="2000,00万" class="num">2&nbsp;<span class="unit">个</span></span>
                                        <label>待进行试验</label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="work-inner">
                                    <div class="work-item gray">
                                         <i class="iconfont">&#xe618;</i>
                                        <span class="num">10&nbsp;<span class="unit">个</span></span>
                                        <label>新接入设备</label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="center-items chart0 clearfix">
                        <div class="chart0-item">
                            <div class="item-inner">
                                <div class="item-content">
                                    <div class="content-hd">仪器使用率</div>
                                    <div class="chart-chart" id="chart0"></div>
                                </div>
                            </div>
                        </div>
                        <div class="chart0-item">
                            <div class="item-inner">
                                <div class="item-content">
                                    <div class="content-hd">设备使用时间</div>
                                    <div class="chart-chart" id="chart1"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="center-items chart1">
                        <div class="chart1-inner">
                            <div class="item-hd" >版本日志</div>
                            <div class="chart1-chart" id="chart3"></div>
<!--                                 <div id="banbenrizhi" class="easyui-panel" title="版本日志" style="width: 100%;height: 100%;">
                                    <div style="font-size: 20px;font-weight: bold">v4.4</div> 
                                    <div style="font-size: 17px;">- 新增期货(保证金)监控中心实盘交易记录自动下载功能，并支持对下载记录进行复盘分析；</div>
                                    <div style="font-size: 17px;">- 新增交易数据文件导入功能，支持导入文华、快期、通达信等主流交易软件的导出记录；</div>
                                    <div style="font-size: 17px;">- 增强的交易统计分析功能，支持按年、月及品种进行交易统计；</div>
                                    <div style="font-size: 17px;">- 新增醒目大箭头用于图表交易指示，且用户可根据偏好设置显示大/小交易箭头；</div>
                                    <div style="font-size: 17px;">- 新增只读属性账户，用户可新建仅用于导入并分析交易记录的账户；</div>
                                    <div style="font-size: 17px;">- 期间选择窗口起始时间新增夜盘开盘时间选项；</div>
                                    <div style="font-size: 17px;">- 修正了上一版本个别bug。</div>
                                    <br />
                                </div>       -->                                                                      
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="ft"></div>
    </div>
    <div class="todo-panel">
         <div class="todo-title">
            <i class="iconfont">&#xe61f;</i>
            <span class="num">14&nbsp;<span class="unit">个</span></span>
            <label>待办未处理</label>
        </div>
        <div class="todo-items">
            <ul>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis"><span></span>《实验室设备使用制度》<i></i></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis"><span></span>《2016测试费用详单》<i></i></a></a>
                    <label>04-13</label>
                </li>
                <!-- <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>0条</span>供应商开发申请未处理，请及时审批<i></i></a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>1条</span>供应商开发申请未处理，请及时审批</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>4条</span>供应商开发申请未处理，请及时审批</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>6条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，会导致失效</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批，未处理</a></a>
                    <label>04-13</label>
                </li>
                <li>
                    <span></span>
                    <a href="javascript:;" class="ellipsis">您有<span>2条</span>供应商开发申请未处理，请及时审批</a></a>
                    <label>04-13</label>
                </li> -->
            </ul>
        </div>
        
    </div>
    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
    <!-- <script type="text/javascript" src="js/menu.js"></script> -->
    <script type="text/javascript" src="js/echarts-all.js"></script>
    
  

    
    <script type="text/javascript">
    //chart0

    $(document).ready(function(){
        var option0 = {
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data:['压力测试仪','震动测试仪','充电测试仪','针刺实验台','跌落实验室'],
                show:true
            },
            toolbox: {
                show : false,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true, 
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'center',
                                max: 1548
                            }
                        }
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'实验设备',
                    type:'pie',
                    radius : ['50%', '70%'],
                    itemStyle : {
                        normal : {
                            label : {
                                show : false
                            },
                            labelLine : {
                                show : false
                            }
                        },
                        emphasis : {
                            label : {
                                show : true,
                                position : 'center',
                                textStyle : {
                                    fontSize : '30',
                                    fontWeight : 'bold'
                                }
                            }
                        }
                    },
                    data:[
                        {value:335, name:'压力测试仪'},
                        {value:310, name:'震动测试仪'},
                        {value:234, name:'充电测试仪'},
                        {value:135, name:'针刺实验台'},
                        {value:1548, name:'跌落实验室'}
                    ]
                }
            ]
        };

      var myChart0 = echarts.init(document.getElementById('chart0'));
      myChart0.setOption(option0);

      //chart1
     var option1 = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['使用时间统计'],
                show:true
            },
            toolbox: {
                show : false,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['第一周','第二周','第三周','第四周','第五周','第六周','第七周']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'使用时间统计',
                    type:'line',
                    stack: '总量',
                    data:[120, 132, 101, 134, 90, 230, 210]
                }
            ]
        };
        var myChart1 = echarts.init(document.getElementById('chart1'));
        myChart1.setOption(option1);

        var option3 = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['蒸发量'],
                show:false
            },
            toolbox: {
                show : false,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'工作量',
                    type:'bar',
                    data:[60, 45, 73, 23, 37, 2, 1],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };

        var myChart3 = echarts.init(document.getElementById('chart3'));
        myChart3.setOption(option3);         
          
        //我的待办点击事件
        $(document).on('click','.work-item.green',function(event){
            var width = (2 * $(this).width()) + 10;
            $(".todo-panel").width(width -2).css({top:$(this).offset().top,left:$(this).offset().left}).show();
            event.stopPropagation();
        });  
        $(".todo-panel").click(function(){
             event.stopPropagation();
        });    
        $(document).click(function(){
            $(".todo-panel").hide();
        });      

    });
        
    //公开附件tab事件处理
    $(".attached-tab").on("click","a",function(){
        $(this).closest(".attached-tab").find("a").removeClass("current");
        $(this).addClass("current");
        $(this).closest(".attached").find("ul").addClass("hide");   
        $(this).closest(".attached").find("ul." + $(this).attr("attached")).removeClass("hide");    
    })
                    
    </script>
</body> 
</html>

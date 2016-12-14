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
    <title>信息管理系统</title> 
    <link href="css/base.css" rel="stylesheet">
    <link href="css/platform.css" rel="stylesheet">
    <link rel="stylesheet" href="../custom/uimaker/easyui.css">
    <link href="../pages/js/layim/css/layim.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>


    <script src="../pages/js/layim/lay/layer/layer.min.js"></script>
    <script src="../pages/js/layim/lay/lib.js"></script>
    <script src="../pages/js/layim/lay/layim.js"></script>

</head> 
<body style="overflow: hidden;">
    <div class="container">
        <div id="pf-hd">
            <div class="pf-logo">
                <img src="images/main/main_logo.png" alt="logo">
            </div>
            <div class="pf-nav-wrap">
              <div class="pf-nav-ww">
                <ul class="pf-nav">
                  <li class="pf-nav-item manger current" data-menu="pur-source" onclick="addTabs('工作台','workbench.jsp')">
                      <a href="javascript:;">
                          <span class="iconfont">&#xe611;</span>
                          <span class="pf-nav-title">工作台</span>
                      </a>
                  </li>
                  <li class="pf-nav-item manger" data-menu="pur-source" onclick="addTabs('版本日志','versionLog.jsp')">
                      <a href="javascript:;">
                        <span class="iconfont">&#xe61a;</span>
                        <span class="pf-nav-title">版本日志</span>
                      </a>
                  </li>                  
                  <li class="pf-nav-item manger" data-menu="pur-source" onclick="addTabs('即时通讯','../pages/js/layim/demo.html')">
                      <a href="javascript:;">
                        <span class="iconfont">&#xe608;</span>
                        <span class="pf-nav-title">即时通讯</span>
                      </a>
                  </li>                                  
                </ul>
              </div>
            </div>
            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="images/main/user.png" alt="">
                </div>
                <h4 class="pf-user-name ellipsis">
                  <% 
                    out.println(request.getSession().getAttribute("username")+"");
                  %>
                </h4>
                <i class="iconfont xiala">&#xe616;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li>
                            <a href="javascript:;">
                                <!--<i class="iconfont">&#xe617;</i>-->
                                <span class="pf-opt-name">用户信息</span>
                            </a>
                        </li>
                        <li class="pf-modify-pwd">
                            <a href="http://www.uimaker.com">
                                <!--<i class="iconfont">&#xe636;</i>-->
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li class="pf-logout">
                            <a href="login.html">
                                <!--<i class="iconfont">&#xe601;</i>-->
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

        <div id="pf-bd">
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <!-- <span class="iconfont">&#xe64a;</span> -->
                    <span class="pf-name">业务</span>
                    <span class="toggle-icon"></span>
                </h2>

                <ul class="sider-nav">
                    <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe641;</span>
                            <span class="sider-nav-title">远程监控</span>
                            <i class="iconfont">&#xe619;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <li><a href="#" onclick="addTabs('设备地图','<%=basePath%>/pages/module/Iot/iotMap.jsp')">设备地图</a></li>
                           <li><a href="#" onclick="addTabs('设备列表','<%=basePath%>/pages/module/Iot/iotThingList.jsp')">设备列表</a></li>
                           <li><a href="#" onclick="addTabs('实时数据','<%=basePath%>/pages/module/Iot/iotRealTimeData.jsp')">实时数据</a></li>
                           <li><a href="#" onclick="addTabs('历史数据','<%=basePath%>/pages/module/Iot/iotHistoryData.jsp')">历史数据</a></li>
                           <li><a href="#" onclick="addTabs('报警设置','<%=basePath%>/pages/module/Iot/iotHistoryData.jsp')">报警设置(x)</a></li>
                        </ul>
                     </li>
                    <li>
                      <a href="javascript:;" onclick="addTabs('客户档案','<%=basePath%>/pages/module/Account/accountManage.jsp')">
                        <span class="iconfont sider-nav-icon">&#xe60e;</span>
                        <span class="sider-nav-title">客户档案</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="addTabs('用户管理','<%=basePath%>/pages/module/FinalUser/userManage.jsp')">
                            <span class="iconfont sider-nav-icon">&#xe65f;</span>
                            <span class="sider-nav-title">用户管理</span>
                            <i class="iconfont">&#xe619;</i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe610;</span>
                            <span class="sider-nav-title">维修派工</span>
                            <i class="iconfont">&#xe619;</i>
                        </a>                        
                        <ul class="sider-nav-s">
                          <li ><a href="#" onclick="addTabs('报修','<%=basePath%>/pages/module/Maintenance/repairs.jsp')">报修</a></li>
                          <li ><a href="#" onclick="addTabs('任务指派','<%=basePath%>/pages/module/Maintenance/taskAssign.jsp')">任务指派</a></li>
                          <li ><a href="#" onclick="addTabs('现场勘查','<%=basePath%>/pages/module/Maintenance/sceneExploration.jsp')">现场勘查</a></li>
                          <li ><a href="#" onclick="addTabs('勘查审批','<%=basePath%>/pages/module/Maintenance/explorationApproval.jsp')">勘查审批</a></li>                        
                          <li ><a href="#" onclick="addTabs('维修','<%=basePath%>/pages/module/Maintenance/maintenance.jsp')">维修</a></li>
                          <li ><a href="#" onclick="addTabs('维修审批','<%=basePath%>/pages/module/Maintenance/maintenanceApproval.jsp')">维修审批</a></li>
                          <li ><a href="#" onclick="addTabs('维修单','<%=basePath%>/pages/module/Maintenance/maintenanceOrderList.jsp')">维修单</a></li>                        
                        </ul>                        
                    </li>                    
                    <li>
                      <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe693;</span>
                        <span class="sider-nav-title">办公</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                      <ul class="sider-nav-s">
                        <li ><a href="#" onclick="addTabs('通讯录','<%=basePath%>/pages/module/Office/contacts.jsp')">通讯录</a></li>
                        <li ><a href="#" onclick="addTabs('文件审批','<%=basePath%>/pages/module/Office/fileApproval.jsp')">文件审批</a></li>
                        <li ><a href="#" onclick="addTabs('知识管理','<%=basePath%>/pages/module/Office/knowledgeManage.jsp')">知识管理</a></li>
                        <li ><a href="#" onclick="addTabs('工作日报','<%=basePath%>/pages/module/Office/dailyWorkReport.jsp')">工作日报</a></li>
                        <li ><a href="#" onclick="addTabs('邮箱','oaFileApproval.jsp')">邮箱(x)</a></li>
                        <li ><a href="#" onclick="addTabs('公告发布','<%=basePath%>/pages/module/Office/noticeManage.jsp')">公告发布</a></li>                        
                      </ul>
                    </li>    
                    <li>
                      <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe600;</span>
                        <span class="sider-nav-title">备件管理</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                      <ul class="sider-nav-s">
                        <li ><a href="#" onclick="addTabs('备件仓库','<%=basePath%>/pages/module/Inventory/InventoryMange.jsp')">备件仓库</a></li>
                        <li ><a href="#" onclick="addTabs('备件申请','<%=basePath%>/pages/module/Inventory/spareApplication.jsp')">备件申请</a></li>
                        <li ><a href="#" onclick="addTabs('备件补充','<%=basePath%>/pages/module/Inventory/spareSupplement.jsp')">备件补充</a></li>
                        <li ><a href="#" onclick="addTabs('备件计划','oaFileApproval.jsp')">备件计划(x)</a></li>                      
                        <li ><a href="#" onclick="addTabs('运单管理','<%=basePath%>/pages/module/Inventory/waybillnMange.jsp')">运单管理</a></li>
                        <li ><a href="#" onclick="addTabs('计划发货','oaFileApproval.jsp')">计划发货(x)</a></li>
                        <li ><a href="#" onclick="addTabs('投运通知单','oaFileApproval.jsp')">投运通知单(x)</a></li>                        
                        <li ><a href="#" onclick="addTabs('备件盘点','<%=basePath%>/pages/module/Inventory/spareInventory.jsp')">备件盘点</a></li>
                        <li ><a href="#" onclick="addTabs('备件差异申报','oaFileApproval.jsp')">备件差异申报(x)</a></li>
                      </ul>
                    </li>    
                    <li>
                        <a href="javascript:;" onclick="addTabs('运单管理','<%=basePath%>/pages/module/Inventory/waybillnMange.jsp')">
                            <span class="iconfont sider-nav-icon">&#xe602;</span>
                            <span class="sider-nav-title">运单管理</span>
                            <i class="iconfont">&#xe619;</i>
                        </a>
                    </li>   
                    <li>
                      <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe626;</span>
                        <span class="sider-nav-title">工具管理</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                      <ul class="sider-nav-s">
                        <li ><a href="#" onclick="addTabs('工具仓库','<%=basePath%>/pages/module/Inventory/toolMange.jsp')">工具仓库</a></li>                      
                        <li ><a href="#" onclick="addTabs('工具盘点','<%=basePath%>/pages/module/Inventory/toolInventory.jsp')">工具盘点</a></li>
                        <li ><a href="#" onclick="addTabs('工具差异申报','oaFileApproval.jsp')">工具差异申报(x)</a></li>
                      </ul>
                    </li>                        
                    <li>
                      <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe683;</span>
                        <span class="sider-nav-title">统计结算</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                      <ul class="sider-nav-s">
                        <li ><a href="#" onclick="addTabs('质量统计','<%=basePath%>/pages/module/StatisicalSettlement/qualityStatistics.jsp')">质量统计</a></li>
                        <li ><a href="#" onclick="addTabs('费用统计','oaFileApproval.jsp')">费用统计(x)</a></li>
                        <li ><a href="#" onclick="addTabs('供应商质量问题反索赔','oaFileApproval.jsp')">供应商质量问题反索赔(x)</a></li>
                        <li ><a href="#" onclick="addTabs('服务器费用结算','<%=basePath%>/pages/module/StatisicalSettlement/serverStationCostSettlement.jsp')">服务站费用结算</a></li>
                        <li ><a href="#" onclick="addTabs('服务人员费用结算','oaFileApproval.jsp')">服务人员费用结算</a></li>
                      </ul>
                    </li>   
                    <li>
                      <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe61c;</span>
                        <span class="sider-nav-title">系统管理</span>
                        <i class="iconfont">&#xe619;</i>
                      </a>
                      <ul class="sider-nav-s">
                        <li ><a href="#" onclick="addTabs('系统用户','<%=basePath%>/pages/module/System/sysUserManage.jsp')">系统用户</a></li>
                        <li ><a href="#" onclick="addTabs('数据字典','<%=basePath%>/pages/module/DatebaseDictionary/databaseDictionary.jsp')">数据字典</a></li>
                        <li ><a href="#" onclick="addTabs('权限管理','<%=basePath%>/pages/module/DatebaseDictionary/databaseDictionary.jsp')">权限管理</a></li>                      
                      </ul>
                    </li>                                                                                             
                 </ul> 
            </div>

            <div id="pf-page">
                <div id="tt" class="easyui-tabs1"  fit="true" border="false" plain="true" style="width:100%;height:100%;">       
                  <div title="工作台" style="padding:10px 5px 5px 10px;">
                    <iframe class="page-iframe" src="workbench.jsp" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
                  </div>                               
                </div>
            </div>
        </div>

        <div id="pf-ft">
            <div class="system-name">
              <i class="iconfont">&#xe6fe;</i>
              <span>信息管理系统&nbsp;v0.0.1</span>
            </div>
            <div class="copyright-name">
              <span>CopyRight&nbsp;2016&nbsp;&nbsp;shuohe-tech.com&nbsp;版权所有</span>
              <i class="iconfont" >&#xe6ff;</i>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
    <!-- <script type="text/javascript" src="js/menu.js"></script> -->
    <script type="text/javascript" src="js/main.js"></script>
    <!--[if IE 7]>
      <script type="text/javascript">
        $(window).resize(function(){
          $('#pf-bd').height($(window).height()-76);
        }).resize();
        
      </script>
    <![endif]-->  

    
    <script type="text/javascript">
      $('.easyui-tabs1').tabs({
        tabHeight: 44,
        onSelect:function(title,index){
          var currentTab = $('.easyui-tabs1').tabs("getSelected");
          if(currentTab.find("iframe") && currentTab.find("iframe").size()){
              currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
          }
        }
      })
      $(window).resize(function(){
            $('.tabs-panels').height($("#pf-page").height()-46);
            $('.panel-body').height($("#pf-page").height()-76)
      }).resize();

      var page = 0,
          pages = ($('.pf-nav').height() / 70) - 1;

      if(pages === 0){
        $('.pf-nav-prev,.pf-nav-next').hide();
      }
      $(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){


        if($(this).hasClass('disabled')) return;
        if($(this).hasClass('pf-nav-next')){
          page++;
          $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
          if(page == pages){
            $(this).addClass('disabled');
            $('.pf-nav-prev').removeClass('disabled');
          }else{
            $('.pf-nav-prev').removeClass('disabled');
          }
          
        }else{
          page--;
          $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
          if(page == 0){
            $(this).addClass('disabled');
            $('.pf-nav-next').removeClass('disabled');
          }else{
            $('.pf-nav-next').removeClass('disabled');
          }
          
        }
      })

      // setTimeout(function(){
      //    $('.tabs-panels').height($("#pf-page").height()-46);
      //    $('.panel-body').height($("#pf-page").height()-76)
      // }, 200)
    </script>
</body> 
</html>
    <script type="text/javascript">
   

      function addTabs(title,href)
      {
          var jq = top.jQuery;    
      
          if (jq("#tt").tabs('exists', title)){    
              jq("#tt").tabs('select', title);    
          } else {  
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';     
                 jq("#tt").tabs('add',{    
                                    title:title,    
                                    content:content,    
                                    closable:true    
                                  });    
           }    
      }
</script>


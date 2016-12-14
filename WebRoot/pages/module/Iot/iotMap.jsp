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
    <title>设备列表</title> 


<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">


<style type="text/css">
    .icon-battery{
        background:url('/images/icon/battery.png') no-repeat center center;
    }
    .icon-datagraid{
        background:url('/images/icon/datagraid.png') no-repeat center center;
    }
    .icon-littleWindows{
        background:url('/images/icon/littleWindows.png') no-repeat center center;
    }
    .icon-location{
        background:url('/images/icon/location.png') no-repeat center center;
    }
    .icon-wave{
        background:url('/images/icon/wave.png') no-repeat center center;
    }
    .icon-wifi{
        background:url('/images/icon/wifi.png') no-repeat center center;
    }        
</style>


<style type="text/css">
    html, body{ margin:0; height:100%;width: 100% }
    .con-span{font-size: 15px}
    .kv-content{border:1px #cacaca solid;}
    /*新增/修改用户时，是否管理员样式保持与easyui一致*/
    .radioSpan {
      position: relative;
      /*border: 1px solid #95B8E7;*/
      background-color: #fff;
      vertical-align: middle;
      display: inline-block;
      overflow: hidden;
      white-space: nowrap;
      margin: 0;
      padding: 0;
      -moz-border-radius: 5px 5px 5px 5px;
      -webkit-border-radius: 5px 5px 5px 5px;
      /*border-radius: 5px 5px 5px 5px;*/
      display:block;
    }

    .easyui-combobox .combobox-item{font-size:4px}
    .easyui-combobox .combo .combo-text{font-size:4px}
</style>



<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SP7yzbUEjZyftws3bxA2eBuhlT03b0cn"></script>

<script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>


</head> 
<body>
    <div class="container" style="width: 100%;height: 100%">
        <div class="left-tree" style="height: 100%;width: 20%;position:relative" >
             <table id="dg" style="height:100%;width: 100%" title="" data-options="
                rownumbers:false,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                fitColumns:false,
                striped:false,
                checkOnSelect:true,
                selectOnCheck:false,
                collapsible:false,
                toolbar:'#tb',
                pageSize:20,
                autoRowHeight:true,
                ">
<!--                 <thead>
                    <tr>
                        <th field="code" width="110">设备编码</th>
                    </tr>
                </thead> -->
            </table>
            <div id="tb" style="padding:0 0px;">
                <select class="easyui-combobox">
                    <option>整车编号</option>
                    <option>按VIN码</option>
                    <option>按车牌</option>
                </select>                            
                <input class="easyui-textbox" type="text" name="code"></input>           
                <!-- 供应商名称: <input class="easyui-textbox" type="text" name="name" style="width:166px;height:35px;line-height:35px;"></input> -->
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true" ></a>
                <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-reload" style="width: 50%">重置</a> -->
            </div>
        </div>
        <div class="content" style="position:absolute;left:20%;top: 0;width: 80%;height: 100%">
            <div id="allmap" style="height:100%;width: 100%">
        </div>

<!-- 审批窗口 -->
        <div id="chartxyz" class="easyui-dialog" title="曲线" data-options="closed:true,closed:true" 
            style="width:700px;height:290px;padding:10px;overflow: hidden;" >
            <!-- <div class="conditions"> -->
                <div class="chart-chart" id="chart1" style="width:700px;height:260px;"></div>
            <!-- </div> -->
        </div>


        <!-- 审批窗口 -->
        <div id="newApprovalDialog" class="easyui-dialog" title="电池电量" data-options="closed:true,closed:true" 
            style="width:700px;height:490px;padding:10px;overflow: hidden;" >
            <div class="conditions">
                <span class="con-span" style="font-size: 17px;">总电压:</span>
                <span class="con-span" style="font-size: 17px;color: red">527.2(V)</span>
                <span class="con-span" style="font-size: 17px;margin-left: 150px">总电流:</span>
                <span class="con-span" style="font-size: 17px;color: red">0.5(A)</span>
                <span class="con-span" style="font-size: 17px;margin-left: 150px">SOC容量:</span>
                <span class="con-span" style="font-size: 17px;color: red">58%(A)</span>
            </div>
            <div class="conditions" style="margin-top: 10px">
                <span class="con-span" style="font-size: 17px;">单体最高电压:</span>
                <span class="con-span" style="font-size: 17px;color: red">第一箱第11节3.18(V)</span>
<!--             </div>
            <div class="conditions" style="margin-top: 10px"> -->
                <span class="con-span" style="font-size: 17px;margin-left: 135px">单体最低电压:</span>
                <span class="con-span" style="font-size: 17px;color: red">第一箱第1节3.16(V)</span>
            </div>
             <div class="conditions" style="margin-top: 10px">
                <span class="con-span" style="font-size: 17px;">单体最高温度:</span>
                <span class="con-span" style="font-size: 17px;color: red">12(℃)</span>        
<!--              </div>
             <div class="conditions" style="margin-top: 10px"> -->
                <span class="con-span" style="font-size: 17px;margin-left: 363px">单体最低温度:</span>
                <span class="con-span" style="font-size: 17px;color: red">0(℃)</span>             
             </div>     
            <div class="conditions" style="margin-top: 10px">
                <div class="easyui-panel" style="width: 680px;height: 350px">
                    <table id="showSettlementTable" class="kv-table">
                        <tbody>
                            <tr>
                                <td colspan="12" class="kv-label">第1箱 箱体最高电压：3.45V 箱体最低电压3.43V 温度 15 15 15 13</td>
                            </tr>
                            <tr>
                                <td class="kv-label">1</td>
                                <td class="kv-label">2</td>
                                <td class="kv-label">3</td>
                                <td class="kv-label">4</td>
                                <td class="kv-label">5</td>
                                <td class="kv-label">6</td>
                                <td class="kv-label">7</td>
                                <td class="kv-label">8</td>
                                <td class="kv-label">9</td>
                                <td class="kv-label">10</td>
                                <td class="kv-label">11</td>
                                <td class="kv-label">12</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                            </tr> 
                            <tr>
                                <td class="kv-label">13</td>
                                <td class="kv-label">14</td>
                                <td class="kv-label">15</td>
                                <td class="kv-label">16</td>
                                <td class="kv-label">17</td>
                                <td class="kv-label">18</td>
                                <td class="kv-label">19</td>
                                <td class="kv-label">20</td>
                                <td class="kv-label">21</td>
                                <td class="kv-label">22</td>
                                <td class="kv-label">23</td>
                                <td class="kv-label">24</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td> 
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                            </tr>                                                 
                        </tbody>
                    </table>     
                    <table id="showSettlementTable" class="kv-table">
                        <tbody>
                            <tr>
                                <td colspan="12" class="kv-label">第2箱 箱体最高电压：3.45V 箱体最低电压3.43V 温度 15 15 15 13</td>
                            </tr>
                            <tr>
                                <td class="kv-label">1</td>
                                <td class="kv-label">2</td>
                                <td class="kv-label">3</td>
                                <td class="kv-label">4</td>
                                <td class="kv-label">5</td>
                                <td class="kv-label">6</td>
                                <td class="kv-label">7</td>
                                <td class="kv-label">8</td>
                                <td class="kv-label">9</td>
                                <td class="kv-label">10</td>
                                <td class="kv-label">11</td>
                                <td class="kv-label">12</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                            </tr> 
                            <tr>
                                <td class="kv-label">13</td>
                                <td class="kv-label">14</td>
                                <td class="kv-label">15</td>
                                <td class="kv-label">16</td>
                                <td class="kv-label">17</td>
                                <td class="kv-label">18</td>
                                <td class="kv-label">19</td>
                                <td class="kv-label">20</td>
                                <td class="kv-label">21</td>
                                <td class="kv-label">22</td>
                                <td class="kv-label">23</td>
                                <td class="kv-label">24</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td> 
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                            </tr>                                                 
                        </tbody>
                    </table>    
                    <table id="showSettlementTable" class="kv-table">
                        <tbody>
                            <tr>
                                <td colspan="12" class="kv-label">第3箱 箱体最高电压：3.45V 箱体最低电压3.43V 温度 15 15 15 13</td>
                            </tr>
                            <tr>
                                <td class="kv-label">1</td>
                                <td class="kv-label">2</td>
                                <td class="kv-label">3</td>
                                <td class="kv-label">4</td>
                                <td class="kv-label">5</td>
                                <td class="kv-label">6</td>
                                <td class="kv-label">7</td>
                                <td class="kv-label">8</td>
                                <td class="kv-label">9</td>
                                <td class="kv-label">10</td>
                                <td class="kv-label">11</td>
                                <td class="kv-label">12</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                            </tr> 
                            <tr>
                                <td class="kv-label">13</td>
                                <td class="kv-label">14</td>
                                <td class="kv-label">15</td>
                                <td class="kv-label">16</td>
                                <td class="kv-label">17</td>
                                <td class="kv-label">18</td>
                                <td class="kv-label">19</td>
                                <td class="kv-label">20</td>
                                <td class="kv-label">21</td>
                                <td class="kv-label">22</td>
                                <td class="kv-label">23</td>
                                <td class="kv-label">24</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td> 
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                            </tr>                                                 
                        </tbody>
                    </table>      
                    <table id="showSettlementTable" class="kv-table">
                        <tbody>
                            <tr>
                                <td colspan="12" class="kv-label">第4箱 箱体最高电压：3.45V 箱体最低电压3.43V 温度 15 15 15 13</td>
                            </tr>
                            <tr>
                                <td class="kv-label">1</td>
                                <td class="kv-label">2</td>
                                <td class="kv-label">3</td>
                                <td class="kv-label">4</td>
                                <td class="kv-label">5</td>
                                <td class="kv-label">6</td>
                                <td class="kv-label">7</td>
                                <td class="kv-label">8</td>
                                <td class="kv-label">9</td>
                                <td class="kv-label">10</td>
                                <td class="kv-label">11</td>
                                <td class="kv-label">12</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                            </tr> 
                            <tr>
                                <td class="kv-label">13</td>
                                <td class="kv-label">14</td>
                                <td class="kv-label">15</td>
                                <td class="kv-label">16</td>
                                <td class="kv-label">17</td>
                                <td class="kv-label">18</td>
                                <td class="kv-label">19</td>
                                <td class="kv-label">20</td>
                                <td class="kv-label">21</td>
                                <td class="kv-label">22</td>
                                <td class="kv-label">23</td>
                                <td class="kv-label">24</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td> 
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                            </tr>                                                 
                        </tbody>
                    </table>  
                    <table id="showSettlementTable" class="kv-table">
                        <tbody>
                            <tr>
                                <td colspan="12" class="kv-label">第5箱 箱体最高电压：3.45V 箱体最低电压3.43V 温度 15 15 15 13</td>
                            </tr>
                            <tr>
                                <td class="kv-label">1</td>
                                <td class="kv-label">2</td>
                                <td class="kv-label">3</td>
                                <td class="kv-label">4</td>
                                <td class="kv-label">5</td>
                                <td class="kv-label">6</td>
                                <td class="kv-label">7</td>
                                <td class="kv-label">8</td>
                                <td class="kv-label">9</td>
                                <td class="kv-label">10</td>
                                <td class="kv-label">11</td>
                                <td class="kv-label">12</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                            </tr> 
                            <tr>
                                <td class="kv-label">13</td>
                                <td class="kv-label">14</td>
                                <td class="kv-label">15</td>
                                <td class="kv-label">16</td>
                                <td class="kv-label">17</td>
                                <td class="kv-label">18</td>
                                <td class="kv-label">19</td>
                                <td class="kv-label">20</td>
                                <td class="kv-label">21</td>
                                <td class="kv-label">22</td>
                                <td class="kv-label">23</td>
                                <td class="kv-label">24</td>
                            </tr>
                            <tr>
                                <td class="kv-content" style="background:#FFC0CB">3.45</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td>
                                <td class="kv-content" style="background:#FFC0CB">3.4</td> 
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                                <td class="kv-content" style="background:#E6E6FA"></td>
                            </tr>                                                 
                        </tbody>
                    </table>                                                          
                </div>                          
            </div>           
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
            rows.push({
                opt: '牌照号: 豫EGJ983<br/>\
                    VIN：LS8GDEB40F1003242<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });
            rows.push({
                opt: '牌照号: 豫EGJ971<br/>\
                    VIN：LS8GDEB43F1004370<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });
            rows.push({
                opt: '牌照号: 豫EGJ976<br/>\
                    VIN：LS8GDEB43F1004367<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });
            rows.push({
                opt: '牌照号: 豫EGJ978<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });
            rows.push({
                opt: '牌照号: 豫EGJ957<br/>\
                    VIN：LS8GDEB4XF1003300<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });
            rows.push({
                opt: '牌照号: 豫EGJ993<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });    
            rows.push({
                opt: '牌照号: 豫EGJ980<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            }); 
            rows.push({
                opt: '牌照号: 豫EGJ997<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            }); 
            rows.push({
                opt: '牌照号: 豫EGJ990<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });   
            rows.push({
                opt: '牌照号: 豫EGJ992<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });  
            rows.push({
                opt: '牌照号: 豫EGJ917<br/>\
                    VIN：LS8GDEB47F1003254<br/>\
                    使用单位：林州市天安公共交通有限责任公司<br/>\
                    车型：少林纯电动客车<br/>\
                    批次：2015-11\
                    '
            });        
            return rows;
        }
        
        $(function(){
            $('#dg').datagrid({data:getData()}).datagrid('clientPaging');
        });        


    $('#dg').datagrid({  
        columns:[[  
            {field:'opt',title:'车辆列表',width:'100%',
                formatter:function(value,rec){  
                    var btn = '<div style="font-size:15px">'+value+'</div>\
                                <a class="iconfont" onclick="ditu()">&#xe622;</a>\
                                <a class="iconfont" onclick="xiaopingmu()">&#xe604;</a>\
                                <a class="iconfont" onclick="dianchi()">&#xe603;</a>\
                                <a class="iconfont" onclick="quxian()">&#xe687;</a>';  
                    return btn;  
                }  
            }  
        ]],  
        onLoadSuccess:function(data){  
            $('.iconfont').linkbutton({
                });
        }  
    });  

    </script>
</body> 
</html>

<script type="text/javascript">

    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(113.820265,36.0604873333333);
    map.centerAndZoom(point, 12);
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放


    function ditu()
    {
        var rows = $('#dg').datagrid('getSelected');
        if(rows.opt)
        {
            var str1 = rows.opt;
            // console.info("start："+str1.indexOf("VIN："));
            // console.info("end"+str1.indexOf("<br/>                    使用单位"));
            var str2=str1.substring(str1.indexOf("牌照号：")+6,str1.indexOf("<br/>"));
            console.log(str2);
            console.info("ditu:::"+rows.opt);
            var str3=getPaizhaoByid2(str2);
            itemClicked(str3);
            get();
        }
    }
    function xiaopingmu()
    {
        console.info("xiaopingmu:::");
        get();
    }
    function dianchi()
    {
        console.info("dianchi:::");
        var rows = $('#dg').datagrid('getSelected');
        if(rows.opt)
        {
            var str1 = rows.opt;
            var str2=str1.substring(str1.indexOf("牌照号：")+6,str1.indexOf("<br/>"));
            $('#newApprovalDialog').dialog({title: str2+"电池电量"});
            $('#newApprovalDialog').dialog("open");
        }
    }
    function quxian()
    {
        console.info("quxian:::");
        $('#chartxyz').dialog("open");
        
    }

    var carArry = new Array();
    var selectCar;
    var isInit = false;
    var ajax =
    {
        abort : function()
        {
        } //定义一个空的方法, 是为了下面ajax.abort()不报错
    };
    function get()
    {
        console.info("get()");
        ajax.abort();
        //每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
        ajax = $.ajax(
        {
            url : "http://shuohe-tech.imwork.net:8080/iot/business/getShaolinBuses.jsp"//请求的url
            ,
            async : false,
            dataType : "jsonp"
            //传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            ,
            jsonp : "callback"
            //自定义的jsonp回调函数名称"jsonpCallback"，返回的json也必须有这个函数名称
            ,
            jsonpCallback : "jsonpCallback"

        });
    }
    function jsonpCallback(data)//回调函数
    {
        var cars = jQuery.parseJSON(JSON.stringify(data));
        carArry.splice(0,carArry.length);//清空数组
        for (var i = 0; i < cars.length; i++)
        {       
            car = new Object();
            car.carid = cars[i].carid;
            car.gpsSignal = cars[i].gpsSignal;
            car.soc = cars[i].soc;
            car.batteryVoltage = cars[i].batteryVoltage;
            car.batteryCurrent = cars[i].batteryCurrent;
            car.gpsLongitude = cars[i].gpsLongitude;
            car.gpsLatitude = cars[i].gpsLatitude;
            carArry.push(car);
        }
        if(isInit == false)
        {
            isInit=true;
            initMarkers();
        }
    }


    get();
    function getx()
    {
        get();
        setMarkers();
        //changeInfowindowsContent();
    }
    var t1 = window.setInterval("getx()", 10000);


    var markerInfoWindow;
    // initMarkers();
    var opts = {
            width : 80,     // 信息窗口宽度
            height: 100,     // 信息窗口高度
            // title : "信息窗口" , // 信息窗口标题
            enableMessage:true//设置允许信息窗发送短息
        };
    function initMarkers()
    {
        console.info("initMarkers()");

        // 将获取到的点赋予地图的marker
        console.info("carArry.length="+carArry.length);
        for (var i = 0; i < carArry.length; i++)
        {
            var pointTmp = new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude);
            var marker = new BMap.Marker(pointTmp);  // 创建标注

            marker.setTitle("车辆编号: "+getCarPaizhaoById(carArry[i].carid));
            var content = "车辆编号: "+getCarPaizhaoById(carArry[i].carid) + "<br>"
                        + "GPS信号强度: " + carArry[i].gpsSignal + "<br>"
                        + "SOC: " + carArry[i].soc + "<br>"
                        + "电池电压: " + carArry[i].batteryVoltage + "<br>"
                        + "电池电流: " + carArry[i].batteryCurrent + "<br>";

            map.addOverlay(marker);              // 将标注添加到地图中
            addClickHandler(content,marker);    
        }
        function addClickHandler(content,marker){
            marker.addEventListener("click",function(e){
                openInfo(content,e)}
            );
        }                               
    }
    function openInfo(content,e){
        p = e.target;
        markerInfoWindow = e.target;
        // selectCar = p.getTitle()；
        console.info("title = "+p.getTitle());
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
        map.openInfoWindow(infoWindow,point); //开启信息窗口
    }
    function getCarPaizhaoById(id)
    {
        if(id == "50007445")        return "豫EGJ983";
        else if(id == "50007556")   return "豫EGJ971";
        else if(id == "50007555")   return "豫EGJ976";
        else if(id == "50007550")   return "豫EGJ978";
        else if(id == "50007450")   return "豫EGJ957";
        else if(id == "50007444")   return "豫EGJ993";
        else if(id == "50007449")   return "豫EGJ980";
        else if(id == "50007447")   return "豫EGJ997";
        else if(id == "50007446")   return "豫EGJ990";
        else if(id == "50007443")   return "豫EGJ992";
        else if(id == "50007438")   return "豫EGJ917";
    }
    function getPaizhaoByid(id)
    {
        if(id == "车辆编号: 豫EGJ983")       return "50007445";
        else if(id == "车辆编号: 豫EGJ971")  return "50007556";
        else if(id == "车辆编号: 豫EGJ976")  return "50007555";
        else if(id == "车辆编号: 豫EGJ978")  return "50007550";
        else if(id == "车辆编号: 豫EGJ957")  return "50007450";
        else if(id == "车辆编号: 豫EGJ993")  return "50007444";
        else if(id == "车辆编号: 豫EGJ980")  return "50007449";
        else if(id == "车辆编号: 豫EGJ997")  return "50007447";
        else if(id == "车辆编号: 豫EGJ990")  return "50007446";
        else if(id == "车辆编号: 豫EGJ992")  return "50007443";
        else if(id == "车辆编号: 豫EGJ917")  return "50007438";                              
    }
    function getPaizhaoByid2(id)
    {
        if(id == "豫EGJ983")       return "50007445";
        else if(id == "豫EGJ971")  return "50007556";
        else if(id == "豫EGJ976")  return "50007555";
        else if(id == "豫EGJ978")  return "50007550";
        else if(id == "豫EGJ957")  return "50007450";
        else if(id == "豫EGJ993")  return "50007444";
        else if(id == "豫EGJ980")  return "50007449";
        else if(id == "豫EGJ997")  return "50007447";
        else if(id == "豫EGJ990")  return "50007446";
        else if(id == "豫EGJ992")  return "50007443";
        else if(id == "豫EGJ917")  return "50007438";                              
    }
    function setMarkers()
    {
        var makers = map.getOverlays();
        console.info("makers length = "+makers.length);
        for (var i = 0; i < makers.length; i++)
        {
            var id = getPaizhaoByid(makers[i].getTitle());
            console.info("makers id = "+id);
            for (var x = 0; x < carArry.length; x++)
            {       
                if((carArry[x].carid) == id)
                {
                    makers[i].setPosition(new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude));
                    console.info("makers "+i+" setPosition("+carArry[i].gpsLongitude+","+carArry[i].gpsLongitude+");"); 

                    break;          
                }
            }
        }
    }
    
    function changeInfowindowsContent()
    {
        console.info("changeInfowindowsContent");
        console.info("markerInfoWindow = "+markerInfoWindow.getTitle());
        // console.info("selectCar = "+selectCar.getTitle());
        
        for (var x = 0; x < carArry.length; x++)
        {       
            console.info("selectCar = "+selectCar);
            console.info("carArry[x].carid = "+carArry[x].carid);
            if((carArry[x].carid) == getPaizhaoByid(markerInfoWindow.getTitle()))
            {                                       
    
                var content = "车辆编号: "+getCarPaizhaoById(carArry[x].carid) + "<br>"
                        + "GPS信号强度: " + carArry[x].gpsSignal + "<br>"
                        + "SOC: " + carArry[x].soc + "<br>"
                        + "电池电压: " + carArry[x].batteryVoltage + "<br>"
                        + "电池电流: " + carArry[x].batteryCurrent + "<br>";
                console.info(content);
                map.getInfoWindow().setContent(content);
                break;          
            }
        }
    }
    function itemClicked(e){
        console.info("itemClicked = "+e);

        for (var i = 0; i < carArry.length; i++)
        {       
            if((carArry[i].carid) == e)
            {
                var point = new BMap.Point(carArry[i].gpsLongitude,carArry[i].gpsLatitude);
                var content = "车辆编号: "+getCarPaizhaoById(carArry[i].carid) + "<br>"
                        + "GPS信号强度: " + carArry[i].gpsSignal + "<br>"
                        + "SOC: " + carArry[i].soc + "<br>"
                        + "电池电压: " + carArry[i].batteryVoltage + "<br>"
                        + "电池电流: " + carArry[i].batteryCurrent + "<br>";

                var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
                map.openInfoWindow(infoWindow,point); //开启信息窗口
                console.info("itemClickeditemClicked");
                break;          
            }
        }
    }
</script>
<script>
    $(function(){
        var lastIndex;
        $('#df').datagrid({
        });
    });
    function getDfData()
    {
        var rows = [];


        rows.push({
            t1: 'LS8GDEB47F1003299',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '20.1'
        });  
                rows.push({
            t1: 'LS8GDEB45F1003236',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '20.1'
        });  
                rows.push({
            t1: 'LS8GDEB43F1003218',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '20.5'
        });  
                rows.push({
            t1: 'LS8GDEB44F1003230',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '21'
        });      
                rows.push({
            t1: 'LS8GDEB47F1003240',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '22.9'
        });         
                        rows.push({
            t1: 'LS8GDEB47F1003237',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '23.6'
        });
        rows.push({
            t1: 'LS8GDEB47F1003223',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '24.1'
        });
        rows.push({
            t1: 'LS8GDEB41F1003251',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '24.2'
        });
                rows.push({
            t1: 'LS8GDEB49F1003238',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '24.7'
        });

        rows.push({
            t1: 'LS8GDEB44F1003261',
            t2: '少林纯电动客车',
            t3: '2015-6',
            t4: '25.2'
        });


        return rows;
    }     
     $(function(){
        $('#df').datagrid({data:getDfData()}).datagrid('clientPaging');
    });      
</script>
<script type="text/javascript">

      //chart1
     var option1 = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['使用时间统计'],
                show:false
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
                    boundaryGap : true,
                    data : ['1','2','3','4','5','6','7','8','9','10'
                    ,'11','12','13','14','15','16','17','18','19','20'
                    ,'21','22','23','24','25','26','27','28','29','30'
                    ,'31','32','33','34','35','36','37','38','39','40'
                    ,'41','42','43','44','45','46','47','48','49','50'
                    ,'51','52','53','54','55','56','57','58','59','60']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'电池电压',
                    type:'line',
                    stack: '总量',
                    data:[   520, 525, 522, 523, 524, 525, 526,527,528,529
                            ,530, 535, 532, 533, 534, 535, 536,537,538,539
                            ,540, 545, 542, 543, 544, 545, 546,547,548,549
                            ,550, 555, 552, 553, 554, 555, 556,557,558,559
                            ,560, 565, 562, 563, 564, 565, 566,567,568,569
                            ,570, 575, 572, 573, 574, 575, 576,577,578,579]
                }
            ]
        };
        var myChart1 = echarts.init(document.getElementById('chart1'));
        myChart1.setOption(option1);

        function functionName(data)
        {
            var serie = [];
            for(var i = 0; i < 7; i++)
            {
                var item = {
                    name:i+"",
                    type: 'line',
                    data: i
                }
                serie.push(item );
            }
            return serrie;
        }

        function setDataxxx()
        {
            myChart.setOption({series: functionName(data)})
        }
        setDataxxx();
</script>
<script type="text/javascript">
    //获取某辆车的100条最新参数
    var carBatterParams = new Array();
    function getCarBatteryParam(carId)
    {
        console.info("get()");
        ajax.abort();
        //每次提交前, 先放弃上一次ajax的提交, 这样就不会同时有多个ajax正在请求, 卡死浏览器
        ajax = $.ajax(
        {
            url : "http://localhost:8000/iot/business/getShaolinBusBatteryParamById.jsp"//请求的url
            ,async : false
            ,dataType : "jsonp"         
            ,jsonp : "callback"//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            ,jsonpCallback : "CarBatteryParamJsonpCallback"
            ,data:  { "carId": carId}
        });
    }
    function CarBatteryParamJsonpCallback(data)//回调函数
    {
        console.info("CarBatteryParamJsonpCallback");
        var cars = jQuery.parseJSON(JSON.stringify(data));
        carBatterParams.splice(0,carBatterParams.length);//清空数组
        for (var i = 0; i < cars.length; i++)
        {       
            carInfo = new Object();
            carInfo.gpsSignal = cars[i].gpsSignal;
            carInfo.soc = cars[i].soc;
            carInfo.batteryVoltage = cars[i].batteryVoltage;
            carInfo.batteryCurrent = cars[i].batteryCurrent;
            carInfo.date = cars[i].date;
            carBatterParams.push(carInfo);
        }
        // itemClicked(initCarId);
        // refshCarInfoWindw(initCarId);
        // carBatteryDataChart();

        console.info("x = "+carBatterParams[10].date);
    }


    $('.easyui-combobox').attr({
            "panelHeight":"auto",
            "style":"font-size:10px; width:100px; height:28px;line-height:28px;"            
            });
    $('.easyui-textbox').attr({
            "style":"font-size:10px; width:100px; height:28px;line-height:28px;"            
            });    
    $('.easyui-linkbutton').attr({
            "style":"font-size:10px; height:28px;line-height:28px;"            
            });  


</script>
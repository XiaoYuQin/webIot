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
    <title>实时数据</title> 

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/base.css" >
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/custom/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/pages/css/providers.css">

    <script type="text/javascript" src="<%=basePath%>/custom/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/custom/easyui-lang-zh_CN.js"></script>

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


</head> 
<body>
	<div id="dlg" class="easyui-dialog" title="电池电量" data-options="closed:true,closed:true" 
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
    <div class="container" style="width: 100%;height: 100%">
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
                pageSize:10">
            <thead>
                <tr href="#">
                    <th field="t1" width="13%">VIN码</th>
                    <th field="t2" width="6%">总电压</th>
                    <th field="t3" width="6%">总电流</th>
                    <th field="t4" width="6%">SOC容量</th>
                    <th field="t5" width="13%">单体最高电压</th>
                    <th field="t6" width="13%">单体最低电压</th>
                    <th field="t7" width="13%">单体最高温度</th>
                    <th field="t8" width="13%">单体最低温度</th>
                </tr>
            </thead>
        </table>
      <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <span class="con-span">VIN码: </span>
            <input class="easyui-textbox" type="text" name="code" style="width:166px;height:28px;line-height:35px;"></input>
            <!-- <span class="con-span">设备名称: </span>
            <input class="easyui-textbox" type="text" name="name" style="width:166px;height:28px;line-height:35px;"></input> -->
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
            <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> -->
            <!-- <a href="#" class="easyui-linkbutton more" iconCls="icon-more">更多</a> -->
            <!-- <a href="#" class="easyui-linkbutton" data-options="selected:true">新增</a> -->
            <a href="#" class="easyui-linkbutton">导出</a>            
        </div>
<!--         <div class="conditions hide">
            <span class="con-span">责任人: </span><input class="easyui-textbox" type="text" name="code" style="width:166px;height:35px;line-height:35px;"></input>
            <span class="con-span">所在地区: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>北京</option><option>武汉</option><option>西安</option></select>
            <span class="con-span">使用状况: </span><select class="easyui-combobox" name="language" style="height:35px;width:166px;"><option>正常</option><option>维护</option><option>维修</option></select>
            <span class="con-span">发布时间: </span><input class="easyui-datetimebox" style="width:166px;height:35px;line-height:35px;">
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
            for(var i=1; i<=200; i++){
                rows.push({
                    t1: 'LS8GDEB44F1003261',
                    t2: '527.2(V)',
                    t3: '0.5(A)',
                    t4: '58%',
                    t5: '第一箱第11节3.18(V)',
                    t6: '第一箱第1节3.16(V)',
                    t7:' 12(℃) ',
                    t8: '0(℃)'
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

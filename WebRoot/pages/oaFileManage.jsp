<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>文件审批</title> 
    <link href="css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../custom/uimaker/easyui.css">
    <link href="css/process.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
	<link href="css/style.css" rel="stylesheet" type="text/css" />    
	
    <link href="js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="js/umeditor/lang/zh-cn/zh-cn.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    <li><a href="#">首页</a></li>
	    <li><a href="#">文件管理</a></li>
	    </ul>
    </div>
    
    <div class="comtitle">
    <span><img src="images/clist.png" /></span>
    <h2>资料(5)</h2>
    <div class="rline"></div>
    </div>
    
    
    <ul class="disklist">
    
    <li>
    <a href="filelist.html">
    <div class="dleft1"></div>    
    <div class="dright">
    <h2>信息文档(25)</h2>
    <div class="dinfo"><span style="width:100px;"></span></div>
    <p>34 MB 空间,共 253 个文件</p>    
    </div>
    </a>
    </li>
    
    <li>
    <div class="dleft"></div>    
    <div class="dright">
    <h2>图片(30)</h2>
    <div class="dinfo"><span style="width:50px;"></span></div>
    <p>120 MB 空间,共 5100 个文件</p>    
    </div>
    </li>
    
    <li>
    <div class="dleft"></div>    
    <div class="dright">
    <h2>软件资料(43)</h2>
    <div class="dinfo"><span style="width:38px;"></span></div>
    <p>500 MB 空间,共 12 个文件</p>    
    </div>
    </li>
    
    <li>
    <div class="dleft"></div>    
    <div class="dright">
    <h2>系统资料(25)</h2>
    <div class="dinfo"><span style="width:60px;"></span></div>
    <p>125 MB 空间,共 3585 个文件</p>    
    </div>
    </li>
    
    <li class="selected">
    <div class="dleft"></div>    
    <div class="dright">
    <h2>uimaker(89)</h2>
    <div class="dinfo"><span style="width:40px;"></span></div>
    <p>10 MB 空间,共 25 个文件</p>    
    </div>
    </li>
    
    <li>
    <div class="dleft"></div>    
    <div class="dright">
    <h2>其他(10)</h2>
    <div class="dinfo"><span style="width:15px;"></span></div>
    <p>2 MB 空间,共 53 个文件</p>    
    </div>
    </li>
    
    
    </ul>
    
    
    
    <div class="comtitle">
    <span><img src="images/clist.png" /></span>
    <h2>其他(1)</h2>
    <div class="rline"></div>
    </div>
    
    
    <ul class="disklist">
    <li>
    <div class="dleft2"></div>    
    <div class="dright">
    <h3>相关信息资料</h3>
    <p>文件夹</p>    
    </div>
    </li>  
    </ul>
    
    
</body>
</html>
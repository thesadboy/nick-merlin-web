<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--suppress ALL, CheckValidXmlInScriptTagBody -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
  <meta HTTP-EQUIV="Expires" CONTENT="-1">
  <link rel="shortcut icon" href="images/favicon.png">
  <link rel="icon" href="images/favicon.png">
  <title></title>
	<style type="text/css">
		body { background: #2A3539; padding: 5px 6px; margin: 0; color: #FFFFFF; font-size: 13px; font-family: Arial, Helvetica, sans-serif; }
		a { text-decoration: none; color: #ffffff; }
		.float-left { float: left; }
		.float-right { float: right; }
		.clear { display: block; float: none; clear: both; }
		.hide {display: none;}
		.main-contain { width: 308px; position: relative; min-height: 400px;}
		.nav-tab { height: 28px; overflow: hidden;}
		.nav-tab ul { margin: 0; left: 0; padding: 0; }
		.nav-tab ul li { float: left; width: 33.3%; list-style: none; padding: 0; height: 28px; display: none;}
		.nav-tab ul li a { background: #354448; display: block; height: 24px; margin: 0 2px 4px 2px; line-height: 28px; text-align: center; font-weight: bolder; border-radius: 5px 5px 0 0; }
		.nav-tab ul li a:hover{ background: #4d595d;}
		.nav-tab ul .first a { margin-left: 0; }
		.nav-tab ul .last a { margin-right: 0 }
		.nav-tab ul .active { }
		.nav-tab ul .active a { margin-bottom: 0; height: 28px; background: #4d595d; }
		.items { font-size: 12px; }
		.items .item { background: #4d595d; padding: 5px; margin-bottom: 5px; }
		.item .item-title { font-size: 16px; font-weight: bolder; text-align: center; height: 30px; line-height: 32px; }
		.item .item-title-line { height: 1px; background: #2A3539; border-bottom: 1px solid #6a7c80; margin-bottom: 5px; }
		.item .item-container { padding: 0 14px 5px 14px; }
		.item .percentage { height: 20px; margin: 10px 0; line-height: 20px; }
		.item .percentage .progress { width: 154px; height: 16px; background: #000; border-radius: 20px; float: left; margin: 2px 0; }
		.item .percentage .progress .progress-width { margin: 2px; height: 12px; width: 0; border-radius: 20px; background: #0096FF; float: left; }
		.item .percentage .text { float: left; margin-left: 10px; }
		.item .percentage .pct { float: right; margin-right: 30px; }
		.item .diagram { height: 100px; width: 270px; background: #000; }
		.item .info-third, .item .info-half { width: 100%; margin: 10px 0; height: 32px; }
		.item .info-third .on-third, .item .info-half .half { width: 33.3%; float: left; text-align: center }
		.item .info-third .on-third div, .item .info-half .half div { line-height: 16px; }
		.item .info-half .half { width: 50%; }
		.item .row { width: 100%; line-height: 16px; margin-top: 10px; }
		.item .row .row-title { font-weight: bolder; margin-bottom: 2px; }
		.item .row .row-info { min-height: 16px;}
		.item .color-ffcc00 { color: #FFCC00; }
		.item .color-1cfe16 { color: #1cfe16; }
		.info-set{ position: absolute; right:5px; bottom:5px; width:15px; height:15px; border:1px solid #FFFFFF; border-radius: 20px; text-align: center; line-height: 15px; cursor: pointer;}
		.show-select{ position: absolute; right:0; bottom:0; left:0; top:0; background: #4d595d; z-index: 100; padding:10px; display: none; }
		.show-select input{margin-right:5px;}
		.show-select .level-2{padding-left: 25px;}
		.show-select .list{margin: 5px 0;}
		.show-select .select-title{font-size: 16px; line-height: 30px; border-bottom: 1px dotted #6a7c80; margin-bottom: 10px;}
		.show-select .btns{border-top: 1px dotted #6a7c80; margin-top: 10px; padding: 10px 0;}
		.show-select .btns .btn{ float: left; width: 65px; height:32px; background: #2A3539; margin-left: 30px; line-height: 32px; text-align: center; border-radius: 5px;}
	</style>
</head>
<body>
<div class="main-contain">
	<iframe name="hidden_frame" id="hidden_frame" width="0" height="0" frameborder="0"></iframe>
	<form method="post" name="form" id="form" action="/start_apply2.htm">
		<input type="hidden" name="current_page" value="device-map/router_status.asp">
		<input type="hidden" name="next_page" value="">
		<input type="hidden" name="action_mode" value="">
		<input type="hidden" name="action_script" value="">
		<input type="hidden" name="action_wait" value="">
		<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
		<input type="hidden" name="wl_unit" value="<% nvram_get("wl_unit"); %>">
		<input type="hidden" name="wl_subunit" value="-1">
	</form>
	<div class="nav-tab">
		<ul>
			<li id="t0" class="first"><a href="javascript:tabclickhandler(0);">2.4GHz</a></li>
			<li id="t1"><a href="javascript:tabclickhandler(1);">5GHz</a></li>
			<li id="t2"><a href="javascript:tabclickhandler(2);">5GHz-2</a></li>
			<li id="t3" class="float-right last active"><a href="javascript:tabclickhandler(3);">状态</a></li>
		</ul>
	</div>
	<div class="items">
		<div id="mod-cpu" class="item hide">
			<div class="item-title">处理器</div>
			<div class="item-title-line"></div>
			<div class="item-container">
        <div id="cpu-pct"></div>
				<div class="diagram">
          <svg width="270px" height="100px">
            <g>
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
            </g>
            <g>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="96%">0%</text>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="55%">50%</text>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="12%">100%</text>
            </g>
            <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="0" y1="0%" x2="0" y2="100%" id="tick1" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="30" y1="0%" x2="30" y2="100%" id="tick2" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="60" y1="0%" x2="60" y2="100%" id="tick3" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="90" y1="0%" x2="90" y2="100%" id="tick4" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="120" y1="0%" x2="120" y2="100%" id="tick5" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="150" y1="0%" x2="150" y2="100%" id="tick6" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="180" y1="0%" x2="180" y2="100%" id="tick7" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="210" y1="0%" x2="210" y2="100%" id="tick8" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="240" y1="0%" x2="240" y2="100%" id="tick9" />
            <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="270" y1="0%" x2="270" y2="100%" id="tick10" />
            <polyline id="cpu0_graph" style="fill:none;stroke:#FF9000;stroke-width:1;width:200px;" points=""></polyline>
            <polyline id="cpu1_graph" style="fill:none;stroke:#3CF;stroke-width:1;width:200px;display:none;" points=""></polyline>
            <polyline id="cpu2_graph" style="fill:none;stroke:#FC0;stroke-width:1;width:200px;display:none;" points=""></polyline>
            <polyline id="cpu3_graph" style="fill:none;stroke:#FF44FF;stroke-width:1;width:200px;display:none;" points=""></polyline>
          </svg>
				</div>
			</div>
		</div>
		<div id="mod-ram" class="item hide">
			<div class="item-title">内存</div>
			<div class="item-title-line"></div>
			<div class="item-container">
				<div class="info-third">
					<div class="on-third">
						<div>已用</div>
						<div id="ram-used">0MB</div>
					</div>
					<div class="on-third">
						<div>空闲</div>
						<div id="ram-free">0MB</div>
					</div>
					<div class="on-third">
						<div>总共</div>
						<div id="ram-total">0MB</div>
					</div>
				</div>
				<div class="percentage" id="ram-pct">
					<div class="progress">
						<div class="progress-width"></div>
					</div>
					<div class="pct">0%</div>
				</div>

				<div class="diagram">
          <svg width="270px" height="100px">
            <g>
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
              <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
            </g>
            <g>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="96%">0%</text>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="55%">50%</text>
              <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="12%">100%</text>
            </g>
            <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="0" y1="0%" x2="0" y2="100%" id="tick1" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="30" y1="0%" x2="30" y2="100%" id="tick2" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="60" y1="0%" x2="60" y2="100%" id="tick3" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="90" y1="0%" x2="90" y2="100%" id="tick4" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="120" y1="0%" x2="120" y2="100%" id="tick5" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="150" y1="0%" x2="150" y2="100%" id="tick6" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="180" y1="0%" x2="180" y2="100%" id="tick7" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="210" y1="0%" x2="210" y2="100%" id="tick8" />
            <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="240" y1="0%" x2="240" y2="100%" id="tick9" />
            <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="270" y1="0%" x2="270" y2="100%" id="tick10" />
            <polyline id="ram_graph" style="fill:none;stroke:#0096FF;stroke-width:1;width:200px;" points=""></polyline>
          </svg>
				</div>
			</div>
		</div>
		<div id="mod-net" class="item hide">
			<div class="item-title">网络</div>
			<div class="item-title-line"></div>
			<div class="item-container">
				<div class="info-half">
					<div class="half">
						<div>下载</div>
						<div style="color: #FF9000;" id="download_speed">0KB/s</div>
					</div>
					<div class="half">
						<div>上传</div>
						<div style="color: #3CF;" id="upload_speed">0KB/s</div>
					</div>
				</div>
				<div class="diagram">
          <svg width="270px" height="100px">
          <g>
            <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
            <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
            <line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
          </g>
          <g>
            <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="96%">0 KB/s</text>
            <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="55%" id="speed_half">25 KB/s</text>
            <text font-family="Verdana" fill="#FFFFFF" font-size="12" x="2" y="12%" id="speed_max">50 KB/s</text>
          </g>
          <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="0" y1="0%" x2="0" y2="100%" id="tick1" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="30" y1="0%" x2="30" y2="100%" id="tick2" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="60" y1="0%" x2="60" y2="100%" id="tick3" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="90" y1="0%" x2="90" y2="100%" id="tick4" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="120" y1="0%" x2="120" y2="100%" id="tick5" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="150" y1="0%" x2="150" y2="100%" id="tick6" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="180" y1="0%" x2="180" y2="100%" id="tick7" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="210" y1="0%" x2="210" y2="100%" id="tick8" />
          <line stroke-width="1" stroke-opacity="0.3" stroke="rgb(40,255,40)" x1="240" y1="0%" x2="240" y2="100%" id="tick9" />
          <line stroke-width="1" stroke-opacity="1" stroke="rgb(0,0,121)" x1="270" y1="0%" x2="270" y2="100%" id="tick10" />
          <polyline id="download_graph" style="fill:#FF9000;stroke:#FF9000;stroke-width:1;width:200px;fill-opacity: 0.5" points=""></polyline>
          <polyline id="upload_graph" style="fill:#3CF;stroke:#3CF;stroke-width:1;width:200px;fill-opacity:0.5;" points=""></polyline>
          </svg>
				</div>
			</div>
		</div>
		<div id="mod-ss" class="item hide">
			<div class="item-title">影梭</div>
			<div class="item-title-line"></div>
			<div class="item-container">
				<div class="row">
					<div class="row-info">国外 <span class="color-ffcc00 ss_basic_state" id="ss_basic_state_foreign"> [ 2016-09-15 19:36:00 ] 故障咯 o(╯□╰)o</span></div>
				</div>
				<div class="row">
					<div class="row-info">国内 <span class="color-ffcc00 ss_basic_state" id="ss_basic_state_china"> [ 2016-09-15 19:36:00 ] 正常滴 O(∩_∩)O~</span></div>
				</div>
			</div>
		</div>
		<div id="mod-sys" class="item hide">
			<div class="item-title">系统</div>
			<div class="item-title-line"></div>
			<div class="item-container">
				<div id="mod-uptime" class="row hide">
					<div class="row-title">开机时间</div>
					<div class="row-info">
						<span class="color-ffcc00" id="boot_days">0</span> 天 <span class="color-ffcc00" id="boot_hours">0</span> 时 <span class="color-ffcc00" id="boot_minutes">0</span> 分 <span class="color-ffcc00" id="boot_seconds"> 0 </span>秒
					</div>
				</div>
				<div id="mod-temp" class="row hide">
					<div class="row-title">温度</div>
					<div class="row-info" id="temp_info">读取中。。。</div>
				</div>
				<div id="mod-cpu-freq" class="row hide">
					<div class="row-title">处理器频率</div>
					<div class="row-info">
						<span class="color-ffcc00"><% sysinfo("cpu.freq"); %></span> MHz
					</div>
				</div>
				<div id="mod-cpu-load" class="row hide">
					<div class="row-title">处理器负载 (1, 5, 15 分钟)</div>
					<div class="row-info">
						<span class="color-ffcc00"><% sysinfo("cpu.load.1"); %></span>,
						<span class="color-ffcc00"><% sysinfo("cpu.load.5"); %></span>,
						<span class="color-ffcc00"><% sysinfo("cpu.load.15"); %></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<span id="info-set" class="info-set hide" title="点击我自定义哦~~~">i</span>
	<div id="show-select" class="show-select">
	  <div class="select-title">请勾选需要显示的项目</div>
	  <div class="level-1">
        <div class="list"><label><input name="mod-cpu" type="checkbox">处理器</label></div>
        <div class="list"><label><input name="mod-ram" type="checkbox">内存</label></div>
        <div class="list"><label><input name="mod-net" type="checkbox">网络</label></div>
        <div class="list"><label><input name="mod-ss" type="checkbox">影梭</label></div>
        <div class="list">
          <label><input name="mod-sys" type="checkbox">系统</label>
          <div class="level-2">
            <div class="list"><label><input name="mod-uptime" type="checkbox">开机时间</label></div>
            <div class="list"><label><input name="mod-temp" type="checkbox">温度</label></div>
            <div class="list"><label><input name="mod-cpu-freq" type="checkbox">处理器频率</label></div>
            <div class="list"><label><input name="mod-cpu-load" type="checkbox">处理器负载</label></div>
          </div>
        </div>
      </div>
	  <div class="btns">
		<a href="javascript:;" id="btn-select-save" class="btn">保存</a>
		<a href="javascript:;" id="btn-select-back" class="btn">返回</a>
		<div class="clear"></div>
	  </div>
    </div>
</div>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/tmmenu.js"></script>
<script type="text/javascript" src="/dbconf?p=ss_basic_install_status,ss_basic_state_china,ss_basic_state_foreign,ss_basic_enable"></script>
<script type="text/javascript">
<% backup_nvram("wan_ifname,lan_ifname,wl_ifname,wan_proto,web_svg,rstats_colors,cstats_enable"); %>
if(parent.location.pathname.search("index") === -1)
  top.location.href = "../index.asp";
vars = {
  core_num: '<%cpu_core_num();%>',
  cpu_info_old: [],
  cpu_usage_array:[],
  internet_speed : {
    upload: [],
    download: []
  },
  internet_prev: {
    INTERNET: [-1,-1],
    INTERNET1 : [-1,-1]
  },
  upload_speed: '0',
  download_speed: '0',
  timestamp: new Date().getTime(),
  ram_usage_array:[],
  array_size : 46,
  time_sec:0,
  ss_install_status:false,
  ss_enabled_status: false
};
/**
* tab切换
* @param wl_unit
*/
var tabclickhandler = function(wl_unit){
  if(wl_unit == 3){
    location.href = "router_status.asp";
  }
  else{
    if((parent.sw_mode == 2 || parent.sw_mode == 4) && '<% nvram_get("wlc_band"); %>' == wl_unit)
      document.form.wl_subunit.value = 1;
    else
      document.form.wl_subunit.value = -1;
    if(parent.wlc_express != '0')
      document.form.wl_subunit.value = 1;
      document.form.wl_unit.value = wl_unit;
      document.form.current_page.value = "device-map/router.asp";
      FormActions("/apply.cgi", "change_wl_unit", "", "");
      document.form.target = "hidden_frame";
      document.form.submit();
  }
},
/**
* 提交表单
* @param _Action
* @param _ActionMode
* @param _ActionScript
* @param _ActionWait
* @constructor
*/
FormActions = function(_Action, _ActionMode, _ActionScript, _ActionWait){
if(_Action != "")
  document.form.action = _Action;
if(_ActionMode != "")
  document.form.action_mode.value = _ActionMode;
if(_ActionScript != "")
  document.form.action_script.value = _ActionScript;
if(_ActionWait != "")
  document.form.action_wait.value = _ActionWait;
},
tab_reset = function(v){
  var tabs = $('.nav-tab li'),
      tab_width = 100 / (wl_info.wl_if_total+1);
      tabs.css('width', tab_width + '%');
      tabs.show();
  if(v == 0){
    $('#t0 a').html('2.4GHz')
    if(wl_info.band5g_2_support){
      $('#t1 a').html('5GHz-1');
      $('#t2 a').html('5GHz-2');
    }else{
      $('#t1 a').html('5GHz');
      $('#t1').hide();
    }
  }else if(v == 1){ //Smart Connect
    if(based_modelid == "RT-AC5300")
      $('#t0 a').html('2.4GHz, 5GHz-1 and 5GHz-2')
    else
      $('#t1').hide();
      $('#t2').hide();
      $('#t0 a').html('Tri-band Smart Connect')
      $('#t0 a').css('width',tab_width*wl_info.wl_if_total + '%');
  }
  else if(v == 2){ //5GHz Smart Connect
    $('#t0 a').html('2.4GHz');
    $('#t1 a').html('5GHz-1 and 5GHz-2').css('width', tab_width * 2 + 'px');
    $('#t2').hide();
  }
},
change_smart_connect = function(v){
  switch(v){
    case '0':
    tab_reset(0);
    break;
    case '1':
    tab_reset(1);
    break;
    case '2':
    tab_reset(2);
    break;
  }
},
/**
* 生成cpu的使用率列表
*/
generate_cpu_field = function(){
  var html = [];
  for(var i = 0; i < vars.core_num; i ++){
    html.push('<div class="percentage" id="cpu-pct-info-',i,'">');
    html.push('<div class="progress">');
    html.push('<div class="progress-width" style="background:',$(document.getElementById("cpu" + i + "_graph")).css('stroke'),'"></div>');
    html.push('</div>');
    html.push('<div class="text">核心[',parseInt(i+1),']</div>');
    html.push('<div class="pct">0 %</div>');
    html.push('</div>');
    document.getElementById('cpu'+i+'_graph').style.display = "";
  }
  $('#cpu-pct').html(html.join(''));
}

var init = function(){
  generate_cpu_field();
  //初始化变量
  //CPU数据初始化
  for(var i = 0; i < vars.core_num; i ++){
    vars.cpu_info_old[i] = {
      total: 0,
      usage: 0
    };
    vars.cpu_usage_array[i] = [];
    for(var j = 0; j < vars.array_size; j ++){
      vars.cpu_usage_array[i][j] = 101;
    }
  }
  //RAN数据初始化
  for(var i = 0; i < vars.array_size; i ++){
    vars.ram_usage_array[i] = 101;
  }
  //NET数据初始化
  for(i=0;i<vars.array_size;i++){
    vars.internet_speed.upload.push(-1);
    vars.internet_speed.download.push(-1);
  }
  //初始化变量完成
  if((parent.sw_mode == 2 || parent.sw_mode == 4) && '<% nvram_get("wlc_band"); %>' == '<% nvram_get("wl_unit"); %>'){
    document.form.wl_subunit.value = 1;
  }else{
    document.form.wl_subunit.value = -1;
  }
  $('#t3').show()
  //判断是否支持5G
  if(band5g_support){
    $('#t0').show()
    $('#t1').show()
    if(wl_info.band5g_2_support){
      tab_reset(0);
    }
    if(smart_connect_support && parent.sw_mode != 4){
      change_smart_connect('<% nvram_get("smart_connect_x"); %>');
    }
    if(parent.sw_mode == 4 && !localAP_support){
      for(var x=0; x<wl_info.wl_if_total;x++){
        if(x != '<% nvram_get("wlc_band"); %>'){
          $('#t' + parseInt(x)).hide();
        }
      }
    }
  }else{
    $('#t0').show();
  }
  if(parent.wlc_express == '1' && parent.sw_mode == '2'){
    $('#t0').hide();
  }else if(parent.wlc_express == '2' && parent.sw_mode == '2'){
    $('#t1').hide()
  }
  initSetInfoShow();
  checkSSStatus();
  updateInfos();
  resetParentHeight();
},
initSetInfoShow = function(){
  var show_select = $('#show-select');
  var mods = getShow();
  $.each(mods, function(index, mod){
    $('#' + mod).show();
    mod = show_select.find('input[name="'+mod+'"]').get(0);
    if(mod){
      mod.checked = true;
    }
  });
  $('.item:visible').last().css('border-radius','0 0 5px 5px')
  $('#info-set').show().on('click', function(){
    show_select.fadeIn();
    $(window.top.document.body).animate({scrollTop:0});
  });
  $('#btn-select-back').on('click', function(){
    show_select.fadeOut();
  });
  show_select.find('input[type="checkbox"]').on('change', function(){
    var that = $(this);
    if(that.parents('.level-2').length){
      if(that.get(0).checked){
        that.parents('.level-2').siblings('label').find('input[type="checkbox"]').get(0).checked = true;
      } else{
        var needUncheckedParent = true;
        that.parents('.list:first').siblings('.list').find('input[type="checkbox"]').each(function(){
          if(this.checked){
            needUncheckedParent = false;
          }
        });
        if(needUncheckedParent){
          that.parents('.level-2').siblings('label').find('input[type="checkbox"]').get(0).checked = false;
        }
      }
    }
    if(that.parent('label').siblings('.level-2').length && !that.get(0).checked){
      that.parent('label').siblings('.level-2').find('input[type="checkbox"]').each(function(){
        this.checked = false;
      })
    }else{
      that.parent('label').siblings('.level-2').find('input[type="checkbox"]').each(function(){
        this.checked = true;
      })
    }
  });
  $('#btn-select-save').on('click', function(){
    var selected = [];
    show_select.find('input[type="checkbox"]').each(function(){
      if(this.checked){
        selected.push($(this).attr('name'));
      }
    });
    setShow(selected.join(','));
    window.top.location.reload();
  });
},
checkSSStatus = function(){
  if(db_ss_basic_install_status['ss_basic_install_status'] == 0){
    vars.ss_install_status = true;
    if(db_ss_basic_enable['ss_basic_enable'] == 1){
      $('.ss_basic_state').html('刷新中，请稍后...');
      vars.ss_enabled_status = true;
    }
    else{
      $('.ss_basic_state').html('SS插件未启用！')
    }
  } else{
    $('.ss_basic_state').html('未安装SS插件，请到应用中心安装！')
  }
},
resetParentHeight = function(){
  var height = $(document.body).height() + parseInt($(document.body).css('padding-top'),10) * 2,
      parent = $(window.parent.document.body).find('#statusframe');
      while(parent.length && parent.get(0).nodeName.toLocaleLowerCase() != 'body'){
        if(parseInt(parent.css('height') || '0', 10) < height + 50){
          parent.css('height','');
        }
        parent.css('min-height', height + 'px');
        parent = parent.parent();
      }
},
updateInfos = function(){
  var mods = getShow();
  if(vars.time_sec % 2 == 0){
    //CPU和RAM单单独处理
    if(mods.indexOf('mod-cpu') > -1 || mods.indexOf('mod-ram') > -1){
      modFns['mod-cpu-ram'] && modFns['mod-cpu-ram'](mods.indexOf('mod-cpu') > -1, mods.indexOf('mod-ram') > -1);
    }
    $.each(mods, function(index, mod){
      if(['mod-cpu','mod-ram','mod-ss','mod-uptime'].indexOf(mod) < 0){
        modFns[mod] && modFns[mod]();
      }
    })
  }
  //影梭单独处理
  if(vars.time_sec % (cookie.get('status_restart') || 10) == 0){
    if(mods.indexOf('mod-ss') > -1){
      modFns['mod-ss'] && modFns['mod-ss']();
    }
  }
  //开启时间单独处理
  if(mods.indexOf('mod-uptime') > -1){
    modFns['mod-uptime'] && modFns['mod-uptime']();
  }
  vars.time_sec ++;
  setTimeout(updateInfos, 1000);
},
modFns = {
  'mod-cpu-ram' : function(cpu, ram){
    var cpu_info_new = [];
    $.ajax({
      url : '/cpu_ram_status.xml',
      dataType: 'xml',
      error: function(){
        modFns['mod-cpu-ram'](cpu, ram);
      },
      success: function(data){
        var cpu_object = data.getElementsByTagName('cpu'),
            mem_info = data.getElementsByTagName('mem_info')[0],
            mem_object = {
              total: mem_info.getElementsByTagName('total')[0].textContent,
              free: mem_info.getElementsByTagName('free')[0].textContent,
              used: mem_info.getElementsByTagName('used')[0].textContent,
            };
        for(var i = 0; i < vars.core_num; i ++){
          cpu_info_new[i] = {
          total: cpu_object[i].childNodes[1].textContent,
          usage: cpu_object[i].childNodes[3].textContent
          };
        }
        cpu && renderCPU(cpu_info_new);
        ram && renderRAM(mem_object.total, mem_object.free, mem_object.used);
      }
    })
  },
  'mod-net': function(){
    $.ajax({
      url : '/update.cgi',
      type: 'post',
      data: 'output=netdev&timestamp=' + new Date().getTime(),
      error: function(){
        modFns['mod-net']();
      },
      success : function(data){
        var c, n, download_speed = 0, upload_speed = 0;
        try{
          netdev = null
          $.globalEval(data);
          c = netdev['INTERNET'];
          if(c){
            if(vars.internet_prev.INTERNET[0] != -1 && vars.internet_prev.INTERNET[1] != -1){
              download_speed = (((c.rx < vars.internet_prev.INTERNET[0]) ? (c.rx + (0xFFFFFFFF - vars.internet_prev.INTERNET[0])) : (c.rx - vars.internet_prev.INTERNET[0])) / 1024 / (new Date().getTime() - timestamp) * 1000);
              upload_speed = (((c.tx < vars.internet_prev.INTERNET[1]) ? (c.tx + (0xFFFFFFFF - vars.internet_prev.INTERNET[1])) : (c.tx - vars.internet_prev.INTERNET[1])) / 1024 / (new Date().getTime() - timestamp) * 1000);
            }
            vars.internet_prev.INTERNET[0] = c.rx;
            vars.internet_prev.INTERNET[1] = c.tx;
          }
          //双拨的情况
          c = netdev['INTERNET1'];
          if(c){
            c = netdev['INTERNET1'];
            if(vars.internet_prev.INTERNET1[0] != -1 && vars.internet_prev.INTERNET1[1] != -1){
              download_speed += (((c.rx < vars.internet_prev.INTERNET1[0]) ? (c.rx + (0xFFFFFFFF - vars.internet_prev.INTERNET1[0])) : (c.rx - vars.internet_prev.INTERNET1[0])) / 1024 / (new Date().getTime() - timestamp) * 1000);
              upload_speed += (((c.tx < vars.internet_prev.INTERNET1[1]) ? (c.tx + (0xFFFFFFFF - vars.internet_prev.INTERNET1[1])) : (c.tx - vars.internet_prev.INTERNET1[1])) / 1024 / (new Date().getTime() - timestamp) * 1000);
            }
            vars.internet_prev.INTERNET1[0] = c.rx;
            vars.internet_prev.INTERNET1[1] = c.tx;
          }
          timestamp = new Date().getTime();
          $('#upload_speed').html(upload_speed.toFixed(2) + 'KB/s')
          $('#download_speed').html(download_speed.toFixed(2) + 'KB/s')
          render_Internet_Speed(upload_speed, download_speed);
        }catch(e){}
      }
    })
  },
  'mod-ss': function(){
    if(!vars.ss_install_status || !vars.ss_enabled_status){
      return;
    }
    $.ajax({
      url:'/ss_status',
      dataType: 'html',
      error: function(){},
      success: function(){
        $.ajax({
           url :'/dbconf?p=ss_basic_install_status,ss_basic_state_china,ss_basic_state_foreign,ss_basic_enable&_t=' + new Date().getTime(),
           dataType: 'html',
           error: function(){},
           success: function(response){
              $.globalEval(response);
              if(db_ss_basic_state_china && db_ss_basic_state_china['ss_basic_state_china'] && db_ss_basic_state_foreign && db_ss_basic_state_foreign['ss_basic_state_foreign']){
                $('#ss_basic_state_foreign').html(db_ss_basic_state_foreign['ss_basic_state_foreign'].replace('working...','正常滴 O(∩_∩)O~').replace('Waiting for first refresh...','刷新中，请稍后...').replace('Problem detected!','故障咯 o(╯□╰)o'));
                $('#ss_basic_state_china').html(db_ss_basic_state_china['ss_basic_state_china'].replace('working...','正常滴 O(∩_∩)O~').replace('Waiting for first refresh...','刷新中，请稍后...').replace('Problem detected!','故障咯 o(╯□╰)o'));
              } else{
                $('.ss_basic_state').html('刷新中，请稍后...');
              }
           }
        });
      }
    });
  },
  'mod-uptime': function(){
    Days = Math.floor(boottime / (60*60*24));
    Hours = Math.floor((boottime / 3600) % 24);
    Minutes = Math.floor(boottime % 3600 / 60);
    Seconds = Math.floor(boottime % 60);
    $("#boot_days").html(Days);
    $("#boot_hours").html(Hours);
    $("#boot_minutes").html(Minutes);
    $("#boot_seconds").html(Seconds);
    boottime += 1;
  },
  'mod-temp': function(){
    $.ajax({
      url: '/ajax_coretmp.asp',
      dataType: 'script',
      error: function(xhr){
        modFns['mod-temp']();
      },
      success: function(response){
        code = "<span class='color-1cfe16'>2.4 GHz:</span><span class='color-ffcc00'> " + curr_coreTmp_2_raw + "</span>";
        if (band5g_support) {
          code += " | <span class='color-1cfe16'>5 GHz:</span> <span class='color-ffcc00'>" + curr_coreTmp_5_raw + "</span>";
        }
        if ((based_modelid == "RT-N18U") || (based_modelid == "RT-AC56U") ||
        (based_modelid == "RT-AC56S") || (based_modelid == "RT-AC68U") ||
        (based_modelid == "RT-AC87U") || (based_modelid == "RT-AC68U") ||
        (based_modelid == "RT-AC3200") || (based_modelid == "RT-AC88U") ||
        (based_modelid == "RT-AC5300") || (based_modelid == "RT-AC3100") || (based_modelid == "EA6200") || (based_modelid == "EA6400") || (based_modelid == "EA6700") || (based_modelid == "EA6900") || (based_modelid == "EA9200") || (based_modelid == "R7000") || (based_modelid == "R6300V2")) {
          code +=" | <span class='color-1cfe16'>CPU:</span> <span class='color-ffcc00'>" + curr_coreTmp_cpu +"&deg;C</span>";
        }
        $('#temp_info').html(code);
      }
    });
  },
},
renderCPU = function(cpu_info_new){
  var pt;
  var percentage = 0;
  var total_diff = 0;
  var usage_diff = 0;
  for(var i = 0; i < vars.core_num; i ++){
    pt = "";
    total_diff = (vars.cpu_info_old[i].total == 0)? 0 : (cpu_info_new[i].total - vars.cpu_info_old[i].total);
    usage_diff = (vars.cpu_info_old[i].usage == 0)? 0 : (cpu_info_new[i].usage - vars.cpu_info_old[i].usage);
    if(total_diff == 0)
    percentage = 0;
    else
    percentage = parseInt(100*usage_diff/total_diff);
    $('#cpu-pct-info-' + i).find('.progress-width').width(150 * percentage / 100 + 'px');
    $('#cpu-pct-info-' + i).find('.pct').html(percentage + '%');
    vars.cpu_usage_array[i].push(100 - percentage);
    vars.cpu_usage_array[i].splice(0,1);
    for(var j = 0; j < vars.array_size; j ++){
      pt += j*6 +","+ vars.cpu_usage_array[i][j] + " ";
    }
    document.getElementById('cpu'+i+'_graph').setAttribute('points', pt);
    vars.cpu_info_old[i].total = cpu_info_new[i].total;
    vars.cpu_info_old[i].usage = cpu_info_new[i].usage;
  }
},
renderRAM = function(total, free, used){
  var pt = "";
  var used_percentage = 0;
  var total_MB = 0, free_MB = 0, used_MB =0;
  total_MB = Math.round(total/1024);
  free_MB = Math.round(free/1024);
  used_MB = Math.round(used/1024);
  $('#ram-total').html(total_MB + "MB")
  $('#ram-free').html(free_MB + "MB")
  $('#ram-used').html(used_MB + "MB")
  used_percentage = Math.round((used/total)*100);
  $('#ram-pct').find('.progress-width').css('width', 150 * used_percentage / 100 + 'px');
  $('#ram-pct').find('.pct').html(used_percentage +"%");
  vars.ram_usage_array.push(100 - used_percentage);
  vars.ram_usage_array.splice(0,1);
  for(i = 0;i < vars.array_size;i ++){
    pt += i*6 +","+ vars.ram_usage_array[i] + " ";
  }
  document.getElementById('ram_graph').setAttribute('points', pt);
},
render_Internet_Speed = function(upload, download){
  var max_speed = 0;
  vars.internet_speed.upload.push(upload);
  vars.internet_speed.download.push(download);
  vars.internet_speed.upload.splice(0,1);
  vars.internet_speed.download.splice(0,1);
  var max_upload = Math.max.apply(null, vars.internet_speed.upload);
  var max_download = Math.max.apply(null, vars.internet_speed.download);
  max_speed = max_upload;
  if(max_speed < max_download){
    max_speed = max_download;
  }
  if(max_speed < 50){
    max_speed = 50;
  }
  var upt = '-1,101 ',
      dpt = '-1,101 ';
  for(i = 0; i < vars.array_size; i ++){
    upt += i*6 + ',' + parseInt(vars.internet_speed.upload[i] == -1 ? 101 : (100 - vars.internet_speed.upload[i] / max_speed * 100), 10) + ' ';
    dpt += i*6 + ',' + parseInt(vars.internet_speed.download[i] == -1 ? 101 : (100 - vars.internet_speed.download[i] / max_speed * 100), 10) + ' ';
  }
  upt += i*6 + 1 +',101 ';
  dpt += i*6 + 1 +',101 ';
  document.getElementById('speed_max').firstChild.nodeValue = max_speed.toFixed(0) +' KB/s';
  document.getElementById('speed_half').firstChild.nodeValue = (max_speed / 2).toFixed(0) +' KB/s';
  document.getElementById('upload_graph').setAttribute('points', upt);
  document.getElementById('download_graph').setAttribute('points', dpt);
}
setShow = function(mods){
  cookie.set('mods-show', mods);
},
getShow = function(){
  var mods = cookie.get('mods-show') || 'mod-cpu,mod-ram,mod-net,mod-ss,mod-sys,mod-uptime,mod-temp,mod-cpu-freq,mod-cpu-load';
  return mods.split(',');
};

$(function(){
  init();
})
</script>
</body>
</html>
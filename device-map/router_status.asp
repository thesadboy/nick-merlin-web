<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title></title>
<link href="/NM_style.css" rel="stylesheet" type="text/css" />
<link href="/form_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/tmmenu.js"></script>
<style type="text/css">
.title{
font-size:16px;
text-align:center;
font-weight:bolder;
margin-bottom:5px;
}
.line_image{
margin:5px 0px 0px 10px;
*margin-top:-10px;
}
.ram_table{
height:30px;
text-align:center;
}
.ram_table td{
width:33%;
}
.loading_bar{
width:150px;
}
.loading_bar > div{
margin-left:5px;
background-color:black;
border-radius:15px;
padding:2px;
}
.status_bar{
height:12px;
border-radius:15px;
}
#ram_bar{
background-color:#0096FF;
}
#cpu0_bar{
background-color:#FF9000;
}
#cpu1_bar{
background-color:#3CF;
}
#cpu2_bar{
background-color:#FC0;
}
#cpu3_bar{
background-color:#FF44FF;
}
.percentage_bar{
width:60px;
text-align:center;
}
.cpu_div{
margin-top:-5px;
}
.status_bar{
-webkit-transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;
transition: all 0.5s ease-in-out;
}
.other_info_table td{
padding: 3px 5px;
}
.other_info_table .info_title{
font-size: 14px;
height: 18px;
line-height: 18px;
font-weight: bold;
padding: 0 5px;
}
.other_info_table .info_detail{
height: 14px;
line-height: 14px;
padding: 0 5px;
}
.other_info_table .info_detail b{font-weight: normal; color: #1cfe16;}
.other_info_table .info_detail span{color: #FFCC00;}
</style>
<script type="text/javascript">
<% backup_nvram("wan_ifname,lan_ifname,wl_ifname,wan_proto,web_svg,rstats_colors,cstats_enable"); %>
if(parent.location.pathname.search("index") === -1) top.location.href = "../index.asp";
/*Initialize array*/
var cpu_info_old = new Array();
var core_num = '<%cpu_core_num();%>';
var cpu_usage_array = new Array();
var internet_speed = {
  upload:[],
  download:[]
};
var array_size = 46;
for(i=0;i<core_num;i++){
cpu_info_old[i] = {
total:0,
usage:0
};
cpu_usage_array[i] = new Array();
for(j=0;j<array_size;j++){
cpu_usage_array[i][j] = 51;
}
}
var ram_usage_array = new Array(array_size);
for(i=0;i<array_size;i++){
ram_usage_array[i] = 51;
}

for(i=0;i<array_size;i++){
  internet_speed.upload.push(-1);
  internet_speed.download.push(-1);
}
/*End*/
function initial(){
generate_cpu_field();
if((parent.sw_mode == 2 || parent.sw_mode == 4) && '<% nvram_get("wlc_band"); %>' == '<% nvram_get("wl_unit"); %>')
document.form.wl_subunit.value = 1;
else
document.form.wl_subunit.value = -1;
if(band5g_support){
document.getElementById("t0").style.display = "";
document.getElementById("t1").style.display = "";
if(wl_info.band5g_2_support)
tab_reset(0);
if(smart_connect_support && parent.sw_mode != 4)
change_smart_connect('<% nvram_get("smart_connect_x"); %>');
if(parent.sw_mode == 4 && !localAP_support){
for(var x=0; x<wl_info.wl_if_total;x++){
if(x != '<% nvram_get("wlc_band"); %>')
document.getElementById('t'+parseInt(x)).style.display = 'none';
}
}
}
else{
document.getElementById("t0").style.display = "";
}
if(parent.wlc_express == '1' && parent.sw_mode == '2'){
document.getElementById("t0").style.display = "none";
}
else if(parent.wlc_express == '2' && parent.sw_mode == '2'){
document.getElementById("t1").style.display = "none";
}
detect_CPU_RAM();
showbootTime();
update_temperatures();
ref.start();
}
function tabclickhandler(wl_unit){
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
}
function render_RAM(total, free, used){
var pt = "";
var used_percentage = 0;
var total_MB = 0, free_MB = 0, used_MB =0;
total_MB = Math.round(total/1024);
free_MB = Math.round(free/1024);
used_MB = Math.round(used/1024);
document.getElementById('ram_total_info').innerHTML = total_MB + "MB";
document.getElementById('ram_free_info').innerHTML = free_MB + "MB";
document.getElementById('ram_used_info').innerHTML = used_MB + "MB";
used_percentage = Math.round((used/total)*100);
document.getElementById('ram_bar').style.width = used_percentage +"%";
document.getElementById('ram_bar').style.width = used_percentage +"%";
document.getElementById('ram_quantification').innerHTML = used_percentage +"%";
ram_usage_array.push((100 - used_percentage) / 2);
ram_usage_array.splice(0,1);
for(i=0;i<array_size;i++){
pt += i*6 +","+ ram_usage_array[i] + " ";
}
document.getElementById('ram_graph').setAttribute('points', pt);
}
function render_CPU(cpu_info_new){
var pt;
var percentage = 0;
var total_diff = 0;
var usage_diff = 0;
for(i=0;i<core_num;i++){
pt = "";
total_diff = (cpu_info_old[i].total == 0)? 0 : (cpu_info_new[i].total - cpu_info_old[i].total);
usage_diff = (cpu_info_old[i].usage == 0)? 0 : (cpu_info_new[i].usage - cpu_info_old[i].usage);
if(total_diff == 0)
percentage = 0;
else
percentage = parseInt(100*usage_diff/total_diff);
document.getElementById('cpu'+i+'_bar').style.width = percentage +"%";
document.getElementById('cpu'+i+'_quantification').innerHTML = percentage +"%"
cpu_usage_array[i].push((100 - percentage) / 2);
cpu_usage_array[i].splice(0,1);
for(j=0;j<array_size;j++){
pt += j*6 +","+ cpu_usage_array[i][j] + " ";
}
document.getElementById('cpu'+i+'_graph').setAttribute('points', pt);
cpu_info_old[i].total = cpu_info_new[i].total;
cpu_info_old[i].usage = cpu_info_new[i].usage;
}
}
function detect_CPU_RAM(){
$.ajax({
url: '/cpu_ram_status.xml',
dataType: 'xml',
error: function(xhr){
detect_CPU_RAM();
},
success: function(response){
var cpu_info_new = new Array();
data = response;
cpu_object = data.getElementsByTagName('cpu');
for(i=0;i<core_num;i++){
cpu_info_new[i] = {
total: cpu_object[i].childNodes[1].textContent,
usage: cpu_object[i].childNodes[3].textContent
};
}
mem_info = data.getElementsByTagName('mem_info')[0];
mem_object = {
total: mem_info.getElementsByTagName('total')[0].textContent,
free: mem_info.getElementsByTagName('free')[0].textContent,
used: mem_info.getElementsByTagName('used')[0].textContent,
}
render_CPU(cpu_info_new);
render_RAM(mem_object.total, mem_object.free, mem_object.used);
setTimeout("detect_CPU_RAM();", 2000);
}
});
}
function tab_reset(v){
var tab_array1 = document.getElementsByClassName("tab_NW");
var tab_array2 = document.getElementsByClassName("tabclick_NW");
var tab_width = Math.floor(270/(wl_info.wl_if_total+1));
var i = 0;
while(i < tab_array1.length){
tab_array1[i].style.width=tab_width+'px';
tab_array1[i].style.display = "";
i++;
}
if(typeof tab_array2[0] != "undefined"){
tab_array2[0].style.width=tab_width+'px';
tab_array2[0].style.display = "";
}
if(v == 0){
document.getElementById("span0").innerHTML = "2.4GHz";
if(wl_info.band5g_2_support){
document.getElementById("span1").innerHTML = "5GHz-1";
document.getElementById("span2").innerHTML = "5GHz-2";
}else{
document.getElementById("span1").innerHTML = "5GHz";
document.getElementById("t2").style.display = "none";
}
}else if(v == 1){ //Smart Connect
if(based_modelid == "RT-AC5300")
document.getElementById("span0").innerHTML = "2.4GHz, 5GHz-1 and 5GHz-2";
else
document.getElementById("span0").innerHTML = "Tri-band Smart Connect";
document.getElementById("t1").style.display = "none";
document.getElementById("t2").style.display = "none";
document.getElementById("t0").style.width = (tab_width*wl_info.wl_if_total+10) +'px';
}
else if(v == 2){ //5GHz Smart Connect
document.getElementById("span0").innerHTML = "2.4GHz";
document.getElementById("span1").innerHTML = "5GHz-1 and 5GHz-2";
document.getElementById("t2").style.display = "none";
document.getElementById("t1").style.width = "143px";
document.getElementById("span1").style.padding = "5px 4px 5px 7px";
}
}
function change_smart_connect(v){
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
}
function generate_cpu_field(){
var code = "";
for(i=0;i<core_num;i++){
code += "<tr><td><div class='cpu_div'><table>";
code += "<tr><td><div><table>";
code += "<tr>";
code += "<td class='loading_bar' colspan='2'>";
code += "<div>";
code += "<div id='cpu"+i+"_bar' class='status_bar'></div>";
code += "</div>";
code += "</td>";
code += "<td>";
code += "<div>Core "+parseInt(i+1)+"</div>";
code += "</td>";
code += "<td class='percentage_bar'>";
code += "<div id='cpu"+i+"_quantification'>0%</div>";
code += "</td>";
code += "</tr>";
code += "</table></div></td></tr>";
code += "</table></div></td></tr>";
document.getElementById('cpu'+i+'_graph').style.display = "";
}
if(getBrowser_info().ie == "9.0")
document.getElementById('cpu_field').outerHTML = code;
else
document.getElementById('cpu_field').innerHTML = code;
}
function showbootTime(){
Days = Math.floor(boottime / (60*60*24));
Hours = Math.floor((boottime / 3600) % 24);
Minutes = Math.floor(boottime % 3600 / 60);
Seconds = Math.floor(boottime % 60);
document.getElementById("boot_days").innerHTML = Days;
document.getElementById("boot_hours").innerHTML = Hours;
document.getElementById("boot_minutes").innerHTML = Minutes;
document.getElementById("boot_seconds").innerHTML = Seconds;
boottime += 1;
setTimeout("showbootTime()", 1000);
}

function update_temperatures(){
$.ajax({
url: '/ajax_coretmp.asp',
dataType: 'script',
error: function(xhr){
update_temperatures();
},
success: function(response){
code = "<b>2.4 GHz:</b><span> " + curr_coreTmp_2_raw + "</span>";
if (band5g_support) {
code += " | <b>5 GHz:</b> <span>" + curr_coreTmp_5_raw + "</span>";
}
if ((based_modelid == "RT-N18U") || (based_modelid == "RT-AC56U") ||
(based_modelid == "RT-AC56S") || (based_modelid == "RT-AC68U") ||
(based_modelid == "RT-AC87U") || (based_modelid == "RT-AC68U") ||
(based_modelid == "RT-AC3200") || (based_modelid == "RT-AC88U") ||
(based_modelid == "RT-AC5300") || (based_modelid == "RT-AC3100") || (based_modelid == "EA6200") || (based_modelid == "EA6400") || (based_modelid == "EA6700") || (based_modelid == "EA6900") || (based_modelid == "EA9200") || (based_modelid == "R7000") || (based_modelid == "R6300V2")) {
code +=" | <b>CPU:</b> <span>" + curr_coreTmp_cpu +"&deg;C</span>";
}
document.getElementById("temp_td").innerHTML = code;
setTimeout("update_temperatures();", 3000);
}
});
}
var prev = [-1,-1],
upload_speed = '0',
download_speed = '0',
timestamp = new Date().getTime();
AUTOLOGOUT_MAX_MINUTE = 0;
var ref = new TomatoRefresh('/update.cgi', 'output=netdev', 2);
ref.stop = function() {
this.timer.start(1000);
};
ref.refresh = function(text) {
var c, i, h, n, j, k;
try {
netdev = null;
eval(text);
n = (new Date()).getTime();
if (this.timeExpect) {
this.timeExpect += 2000;
this.refreshTime = MAX(this.timeExpect - n, 500);
}
else {
this.timeExpect = n + 2000;
}
c = netdev['INTERNET'];
if(prev[0] != -1 && prev[1] != -1){
upload_speed = (((c.rx < prev[0]) ? (c.rx + (0xFFFFFFFF - prev[0])) : (c.rx - prev[0])) / 1024 / (new Date().getTime() - timestamp) * 1000);
download_speed = (((c.tx < prev[1]) ? (c.tx + (0xFFFFFFFF - prev[1])) : (c.tx - prev[1])) / 1024 / (new Date().getTime() - timestamp) * 1000);
}
timestamp = new Date().getTime();
prev[0] = c.rx;
prev[1] = c.tx;
E('upload_speed').innerHTML = upload_speed.toFixed(2) + 'KB/s';
E('download_speed').innerHTML = download_speed.toFixed(2) + 'KB/s';
  render_Internet_Speed(upload_speed, download_speed);
}
catch (ex) {
}
--updating;
};
var max_speed = 0;
function render_Internet_Speed(upload, download){
  internet_speed.upload.push(upload);
  internet_speed.download.push(download);
  internet_speed.upload.splice(0,1);
  internet_speed.download.splice(0,1);
  var max_upload = Math.max.apply(null, internet_speed.upload);
  var max_download = Math.max.apply(null, internet_speed.download);
  max_speed = max_upload;
  if(max_speed < max_download){
    max_speed = max_download;
  }
  if(max_speed < 50){
    max_speed = 50;
  }
  var upt = '0,51 ',
      dpt = '0,51 ';
  for(i=0;i<array_size;i++){
    upt += i*6 + ',' + parseInt(internet_speed.upload[i] == -1 ? 51 : (50 - internet_speed.upload[i] / max_speed * 50), 10) + ' ';
    dpt += i*6 + ',' + parseInt(internet_speed.download[i] == -1 ? 51 : (50 - internet_speed.download[i] / max_speed * 50), 10) + ' ';
  }
  upt += i*6 + 1 +',51 ';
  dpt += i*6 + 1 +',51 ';
  document.getElementById('speed_max').innerHTML = max_speed.toFixed(2) +' KB/s';
  document.getElementById('speed_half').innerHTML = (max_speed / 2).toFixed(2) +' KB/s';
  document.getElementById('upload_graph').setAttribute('points', upt);
  document.getElementById('download_graph').setAttribute('points', dpt);
}
</script>
</head>
<body class="statusbody" onload="initial();">
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
<table border="0" cellpadding="0" cellspacing="0" style="padding-left:5px">
<tr>
<td>
<table width="100px" border="0" align="left" style="margin-left:8px;" cellpadding="0" cellspacing="0">
<td>
<div id="t0" class="tab_NW" align="center" style="font-weight: bolder;display:none; margin-right:2px; width:90px;" onclick="tabclickhandler(0)">
<span id="span0" style="cursor:pointer;font-weight: bolder;">2.4GHz</span>
</div>
</td>
<td>
<div id="t1" class="tab_NW" align="center" style="font-weight: bolder;display:none; margin-right:2px; width:90px;" onclick="tabclickhandler(1)">
<span id="span1" style="cursor:pointer;font-weight: bolder;">5GHz</span>
</div>
</td>
<td>
<div id="t2" class="tab_NW" align="center" style="font-weight: bolder;display:none; margin-right:2px; width:90px;" onclick="tabclickhandler(2)">
<span id="span2" style="cursor:pointer;font-weight: bolder;">5GHz-2</span>
</div>
</td>
<td>
<div id="t3" class="tabclick_NW" align="center" style="font-weight: bolder; margin-right:2px; width:90px;" onclick="tabclickhandler(3)">
<span id="span3" style="cursor:pointer;font-weight: bolder;">Status</span>
</div>
</td>
</table>
</td>
</tr>
<tr>
<td>
<div>
<table width="98%" border="1" align="center" cellpadding="4" cellspacing="0" class="table1px" id="cpu">
<tr>
<td >
<div class="title">CPU</div>
<img class="line_image" src="/images/New_ui/networkmap/linetwo2.png">
</td>
</tr >
<tr>
<td style="padding: 0 5px;">
<table id="cpu_field"></table>
</td>
</tr>
<tr style="height:50px;">
<td colspan="3">
<div style="margin:0px 11px 0px 11px;background-color:black;">
<svg width="270px" height="50px">
<g>
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="0%" x2="100%" y2="0%" />-->
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="100%" x2="100%" y2="100%" />-->
</g>
<g>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="95%">0%</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="55%">50%</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="15%">100%</text>
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
</td>
</tr>
<tr>
<td style="border-bottom:5px #2A3539 solid;padding:0px 10px 5px 10px;"></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td>
<div>
<table width="98%" border="1" align="center" cellpadding="4" cellspacing="0" class="table1px">
<tr>
<td colspan="3">
<div class="title">RAM</div>
<img class="line_image" src="/images/New_ui/networkmap/linetwo2.png">
</td>
</tr>
<tr class="ram_table">
<td>
<div>Used</div>
<div id="ram_used_info"></div>
</td>
<td>
<div>Free</div>
<div id="ram_free_info"></div>
</td>
<td>
<div>Total</div>
<div id="ram_total_info"></div>
</td>
</tr>
<tr>
<td colspan="3">
<div>
<table>
<tr>
<td class="loading_bar" colspan="2">
<div>
<div id="ram_bar" class="status_bar"></div>
</div>
</td>
<td>
<div style="width:39px;"></div>
</td>
<td class="percentage_bar">
<div id="ram_quantification">0%</div>
</td>
</tr>
</table>
</div>
</td>
</tr>
<tr style="height:50px;">
<td colspan="3">
<div style="margin:0px 11px 0px 11px;background-color:black;">
<svg width="270px" height="50px">
<g>
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="0%" x2="100%" y2="0%" />-->
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="100%" x2="100%" y2="100%" />-->
</g>
<g>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="95%">0%</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="55%">50%</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="15%">100%</text>
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
<polyline id="ram_graph" style="fill:none;stroke:#0096FF;stroke-width:1;width:200px;" points="">
</svg>
</div>
</td>
</tr>
<tr>
<td style="border-bottom:5px #2A3539 solid;padding:0px 10px 5px 10px;" colspan="3"></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td>
<div>
<table width="98%" border="1" align="center" cellpadding="4" cellspacing="0" class="table1px">
<tr>
<td colspan="2">
<div class="title">INTERNET</div>
<img class="line_image" src="/images/New_ui/networkmap/linetwo2.png">
</td>
</tr>
<tr class="ram_table">
<td>
<div>Upload</div>
<div id="upload_speed" style="color: #FF9000;">0 KB/s</div>
</td>
<td>
<div>Download</div>
<div id="download_speed" style="color: #3CF;">0 KB/</div>
</td>
</tr>
<tr style="height:50px;">
<td colspan="2">
<div style="margin:0px 11px 0px 11px;background-color:black;">
<svg width="270px" height="50px">
<g>
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="0%" x2="100%" y2="0%" />-->
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="25%" x2="100%" y2="25%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="50%" x2="100%" y2="50%" />
<line stroke-width="1" stroke-opacity="0.2" stroke="rgb(255,255,255)" x1="0" y1="75%" x2="100%" y2="75%" />
<!--<line stroke-width="1" stroke-opacity="1" stroke="rgb(255,255,255)" x1="0" y1="100%" x2="100%" y2="100%" />-->
</g>
<g>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="95%">0 KB/s</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="55%" id="speed_half">25 KB/s</text>
<text font-family="Verdana" fill="#FFFFFF" font-size="8" x="0" y="15%" id="speed_max">50 KB/s</text>
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
<polyline id="upload_graph" style="fill:#FF9000;stroke:#FF9000;stroke-width:1;width:200px;fill-opacity: 0.5" points=""></polyline>
<polyline id="download_graph" style="fill:#3CF;stroke:#3CF;stroke-width:1;width:200px;fill-opacity:0.5;" points=""></polyline>
</svg>
</div>
</td>
</tr>
<tr>
<tr class="other_info_table">
<td style="border-bottom:5px #2A3539 solid;padding:0 10px 5px 10px;" colspan="2">
</td>
</table>
</div>
</td>
</tr>
<tr>
<td>
<div>
<table width="98%" border="1" align="center" cellpadding="4" cellspacing="0" class="table1px">
<tr>
<td>
<div class="title">SYSTEM</div>
<img class="line_image" src="/images/New_ui/networkmap/linetwo2.png">
</td>
</tr>
<tr class="other_info_table">
<td>
<div class="info_title">Uptime</div>
<div class="info_detail"><span id="boot_days"></span> day(s) <span id="boot_hours"></span> hour(s) <span id="boot_minutes"></span> min(s) <span id="boot_seconds"></span> sec(s)</div>
</td>
</tr>
<tr class="other_info_table">
<td>
<div class="info_title">Temperatures</div>
<div class="info_detail" id="temp_td"></div>
</td>
</tr>
<tr class="other_info_table">
<td>
<div class="info_title">CPU Frequency</div>
<div class="info_detail"><span><% sysinfo("cpu.freq"); %></span> MHz</div>
</td>
</tr>
<tr class="other_info_table">
<td style="padding-bottom: 8px;">
<div class="info_title">CPU Load Average (1, 5, 15 mins)</div>
<div class="info_detail">
<span><% sysinfo("cpu.load.1"); %></span>,&nbsp;
<span><% sysinfo("cpu.load.5"); %></span>,&nbsp;
<span><% sysinfo("cpu.load.15"); %></span>
</div>
</td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</form>
</body>
</html>


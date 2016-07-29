<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
<meta HTTP-EQUIV="Expires" CONTENT="-1"/>
<link rel="shortcut icon" href="images/favicon.png"/>
<link rel="icon" href="images/favicon.png"/>
<title>脚本配置</title>
<link rel="stylesheet" type="text/css" href="index_style.css"/>
<link rel="stylesheet" type="text/css" href="form_style.css"/>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/validator.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<style>
#ClientList_Block_PC{
border:1px outset #999;
background-color:#576D73;
position:absolute;
*margin-top:26px;
margin-left:3px;
*margin-left:-129px;
width:255px;
text-align:left;
height:auto;
overflow-y:auto;
z-index:200;
padding: 1px;
display:none;
}
#ClientList_Block_PC div{
background-color:#576D73;
height:auto;
*height:20px;
line-height:20px;
text-decoration:none;
font-family: Lucida Console;
padding-left:2px;
}
#ClientList_Block_PC a{
background-color:#EFEFEF;
color:#FFF;
font-size:12px;
font-family:Arial, Helvetica, sans-serif;
text-decoration:none;
}
#ClientList_Block_PC div:hover, #ClientList_Block a:hover{
background-color:#3366FF;
color:#FFFFFF;
cursor:default;
}
</style>
<script>
var $G = function (id) {
return document.getElementById(id);
};
function key_event(evt){
if(evt.keyCode != 27 || isMenuopen == 0)
return false;
pullLANIPList(document.getElementById("pull_arrow"));
}
function onSubmitCtrl(o, s) {
}
function done_validating(action){
refreshpage(8);
}
function init(){
show_menu();
refresh_table();
script_sel();
}
var $j = jQuery.noConflict();
var _responseLen;
var noChange = 0;
var over_var = 0;
var isMenuopen = 0;
function hideClients_Block(evt){
if(typeof(evt) != "undefined"){
if(!evt.srcElement)
evt.srcElement = evt.target; // for Firefox
if(evt.srcElement.id == "pull_arrow" || evt.srcElement.id == "ClientList_Block"){
return;
}
}
$G("pull_arrow").src = "/images/arrow-down.gif";
$G('ClientList_Block_PC').style.display='none';
isMenuopen = 0;
}
function pullLANIPList(obj){
if(isMenuopen == 0){
obj.src = "/images/arrow-top.gif"
$G("ClientList_Block_PC").style.display = 'block';
isMenuopen = 1;
}
else
hideClients_Block();
}
function validForm(){
var is_ok = true;
return is_ok;
}
function openShutManager(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
var openTip = oOpenTip || "";
var shutTip = oShutTip || "";
if(targetObj.style.display!="none"){
if(shutAble) return;
targetObj.style.display="none";
if(openTip && shutTip){
sourceObj.innerHTML = shutTip;
}
} else {
targetObj.style.display="block";
if(openTip && shutTip){
sourceObj.innerHTML = openTip;
}
}
}
function refresh_html() {
var html = '';
var p1 = '__event__on';
var o = db___event__onwanstart;
for(var field in o) {
html = html + '<tr> <td width="20%">WANSTART</td> <td width="20%"></td> <td>'+o[field]+'</td> <td width="20%"><input id="'+field+'" class="remove_btn" onclick="remove_tr(this);" value=""/> </td></tr>';
}
var o = db___event__onnatstart;
for(var field in o) {
html = html + '<tr> <td width="20%">NATSTART</td> <td width="20%"></td> <td>'+o[field]+'</td> <td width="20%"><input id="'+field+'" class="remove_btn" onclick="remove_tr(this);" value=""/> </td></tr>';
}
var o = db___time__;
for(var field in o) {
var fs = o[field].split(" ");
html = html + '<tr> <td width="20%">定时时间</td> <td width="20%">'+fs[0]+'</td> <td>'+fs[1]+'</td> <td width="20%"><input id="'+field+'" class="remove_btn" onclick="remove_tr(this);" value=""/> </td></tr>';
}
var o = db___delay__;
for(var field in o) {
var fs = o[field].split(" ");
html = html + '<tr> <td width="20%">超时时间</td> <td width="20%">'+fs[0]+'</td> <td>'+fs[1]+'</td> <td width="20%"><input id="'+field+'" class="remove_btn" onclick="remove_tr(this);" value=""/> </td></tr>';
}
return html;
}
function remove_tr(el) {
var obj = $j(el);
id = obj.attr("id");
var o = {};
o[id] = "";
$j.ajax({
url: '/applydb.cgi?use_rm=1&p=__',
contentType: "application/x-www-form-urlencoded",
dataType: 'text',
data:$j.param(o),
error: function(xhr){
},
success: function(response){
refresh_table();
}
});
}
function refresh_table() {
$j("#conf_table").find("tr:gt(2)").remove();
$j.ajax({
url: '/dbconf?p=__event__onwanstart,__event__onnatstart,__delay__,__time__,event_common_index',
dataType: 'html',
error: function(xhr){
},
success: function(response){
$j.globalEval(response);
$j('#conf_table tr:last').after(refresh_html());
$j("#script_path").val("");
$j("#script_delay").val("");
$j("#script_time").val("");
}
});
}
function script_sel() {
var v = $j("#script_type").val();
if(v == "1" || v == "2") {
$j(".tr_script_time").hide();
$j(".tr_script_delay").hide();
} else if(v == "3") {
$j(".tr_script_time").show();
$j(".tr_script_delay").hide();
$j("#script_time").val("1");
} else if(v == "4") {
$j(".tr_script_time").hide();
$j(".tr_script_delay").show();
}
}
function add_script() {
var v = $j("#script_type").val();
var sh = $j("#script_path").val();
if(sh == "") {
alert("脚本不能为空");
return;
}
var o = {};
var db_index = 100;
var p = 'event_common_index,';
if(typeof db_event_common_index.event_common_index != "undefined") {
db_index = parseInt(db_event_common_index.event_common_index);
}
if(v == "1") {
o["__event__onwanstart_"+db_index] = sh;
p += '__event__';
} else if(v == "2") {
o["__event__onnatstart_"+db_index] = sh;
p += '__event__';
} else if(v == "3") {
otime = $j("#script_time").val();
if(otime.length == 1) {
otime = "0"+otime+":00:00 ";
} else {
otime = otime+":00:00 ";
}
p += '__time__';
o["__time__"+db_index] = otime+sh;
} else if(v == "4") {
otime = $j("#script_delay").val();
if(otime == "") {
alert("时间配置不能为空");
return;
}
p += '__delay__';
otime = "" + parseInt(otime)*10 + " ";
o["__delay__"+db_index] = otime+sh;
}
o["event_common_index"] = "" + (db_index+1);
$j.ajax({
url: '/applydb.cgi?p='+p,
contentType: "application/x-www-form-urlencoded",
dataType: 'text',
data:$j.param(o),
error: function(xhr){
alert("error");
},
success: function(response){
refresh_table();
}
});
}
</script>
</head>
<body onkeydown="key_event(event);" onclick="if(isMenuopen){hideClients_Block(event)}" onload="init();">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="GET" name="form" action="/apply.cgi" target="hidden_frame">
<input type="hidden" name="current_page" value="Main_Netstat_Content.asp"/>
<input type="hidden" name="next_page" value="Main_Netstat_Content.asp"/>
<input type="hidden" name="group_id" value=""/>
<input type="hidden" name="modified" value="0"/>
<input type="hidden" name="action_mode" value=""/>
<input type="hidden" name="action_script" value=""/>
<input type="hidden" name="action_wait" value=""/>
<input type="hidden" name="first_time" value=""/>
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>"/>
<input type="hidden" name="SystemCmd" onkeydown="onSubmitCtrl(this, ' Refresh ')" value=""/>
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>"/>
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td align="left" valign="top">
<table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
<tr>
<td bgcolor="#4D595D" colspan="3" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle">脚本配置</div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc" id="cmdDesc">参数信息</div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" >
<thead>
<tr>
<td colspan="2">参数配置</td>
</tr>
</thead>
<tr>
<th width="20%">类型</th>
<td>
<select id="script_type" name="script_type" style="width:165px;margin:0px 0px 0px 2px;" class="input_option" onchange="script_sel();" >
<option value="1">WAN-START</option>
<option value="2">NAT-START</option>
<option value="3">定时脚本</option>
<option value="4">超时脚本</option>
</select>
<input id="btn_add" class="add_btn" onclick="add_script();" value=""/>
</td>
</tr>
<tr class="tr_script_time">
<th width="20%">时间选择</th>
<td>
<select id="script_time" name="script_time" class="input_option">
<option value="0">00:00点</option>
<option value="1">01:00点</option>
<option value="2">02:00点</option>
<option value="3">03:00点</option>
<option value="4">04:00点</option>
<option value="5">05:00点</option>
<option value="6">06:00点</option>
<option value="7">07:00点</option>
<option value="8">08:00点</option>
<option value="9">09:00点</option>
<option value="10">10:00点</option>
<option value="11">11:00点</option>
<option value="12">12:00点</option>
<option value="13">13:00点</option>
<option value="14">14:00点</option>
<option value="15">15:00点</option>
<option value="16">16:00点</option>
<option value="17">17:00点</option>
<option value="18">18:00点</option>
<option value="19">19:00点</option>
<option value="20">20:00点</option>
<option value="21">21:00点</option>
<option value="22">22:00点</option>
<option value="23">23:00点</option>
</select>
</td>
</tr>
<tr class="tr_script_delay">
<th width="20%">超时时间</th>
<td><input type="text" class="input_ss_table" id="script_delay" name="script_delay" maxlength="100" placeholder="单位10s" value=""/>
<span> x10秒 </span>
</td>
</tr>
<tr>
<th width="20%">脚本配置</th>
<td><input type="text" class="input_ss_table" id="script_path" name="script_path" maxlength="100" value="" />
</td>
</tr>
</table>
<table id="conf_table" width="96%" border="1" align="left" cellpadding="4" cellspacing="0" class="FormTable_table">
<thead>
<tr>
<td colspan="4">配置汇总</td>
</tr>
</thead>
<tr>
<th>脚本类型</th>
<th>参数</th>
<th>脚本地址</th>
<th>操作</th>
</tr>
<tr>
</tr>
</table>
</div>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top"></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top"></td>
</tr>
</table>
</form>
<div id="footer"></div>
</body>
<script type="text/javascript">
<!--[if !IE]>-->
jQuery.noConflict();
(function($){
var i = 0;
})(jQuery);
<!--<![endif]-->
</script>
</html>


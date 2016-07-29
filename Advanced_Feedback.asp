<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:v>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#533#> - <#1465#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script>
var orig_page = '<% get_parameter("origPage"); %>';
function initial(){
show_menu();
if(dsl_support){
change_dsl_diag_enable(0);
document.getElementById("fb_desc1").style.display = "";
inputCtrl(document.form.fb_ptype, 0);
inputCtrl(document.form.fb_pdesc, 0);
}
else{
document.getElementById("fb_desc0").style.display = "";
inputCtrl(document.form.fb_ISP, 0);
inputCtrl(document.form.fb_Subscribed_Info, 0);
document.form.attach_syslog_id.checked = true;
document.form.attach_cfgfile_id.checked = true;
document.form.attach_iptables.checked = false;
document.form.attach_modemlog.checked = true;
document.getElementById("attach_iptables_span").style.display = "none";
inputCtrl(document.form.dslx_diag_enable[0], 0);
inputCtrl(document.form.dslx_diag_enable[1], 0);
inputCtrl(document.form.dslx_diag_duration, 0);
inputCtrl(document.form.fb_availability, 0);
gen_ptype_list(orig_page);
Reload_pdesc(document.form.fb_ptype,orig_page);
}
if(modem_support == -1){
document.form.attach_modemlog.checked = false;
document.getElementById("attach_modem_span").style.display = "none";
}
setTimeout("check_wan_state();", 300);
}
function check_wan_state(){
if(sw_mode != 3 && document.getElementById("connect_status").className == "connectstatusoff"){
document.getElementById("fb_desc_disconnect").style.display = "";
document.form.fb_country.disabled = "true";
document.form.fb_email.disabled = "true";
document.form.attach_syslog.disabled = "true";
document.form.attach_cfgfile.disabled = "true";
document.form.attach_modemlog.disabled = "true";
document.form.fb_comment.disabled = "true";
document.form.btn_send.disabled = "true";
if(dsl_support){
document.form.fb_ISP.disabled = "true";
document.form.fb_Subscribed_Info.disabled = "true";
document.form.attach_iptables.disabled = "true";
document.form.dslx_diag_enable[0].disabled = "true";
document.form.dslx_diag_enable[1].disabled = "true";
document.form.dslx_diag_duration.disabled = "true";
document.form.fb_availability.disabled = "true";
}
else{
document.form.fb_ptype.disabled = "true";
document.form.fb_pdesc.disabled = "true";
}
}
else{
document.getElementById("fb_desc_disconnect").style.display = "none";
document.form.fb_country.disabled = "";
document.form.fb_email.disabled = "";
document.form.attach_syslog.disabled = "";
document.form.attach_modemlog.disabled = "";
document.form.attach_cfgfile.disabled = "";
document.form.fb_comment.disabled = "";
document.form.btn_send.disabled = "";
if(dsl_support){
document.form.fb_ISP.disabled = "";
document.form.fb_Subscribed_Info.disabled = "";
document.form.attach_iptables.disabled = "";
document.form.dslx_diag_enable[0].disabled = "";
document.form.dslx_diag_enable[1].disabled = "";
document.form.dslx_diag_duration.disabled = "";
document.form.fb_availability.disabled = "";
}
else{
document.form.fb_ptype.disabled = "";
document.form.fb_pdesc.disabled = "";
}
}
setTimeout("check_wan_state();", 3000);
}
function gen_ptype_list(url){
ptypelist = new Array();
ptypelist.push(["<#473#> ...", "No_selected"]);
ptypelist.push(["<#1091#>", "Setting_Problem"]);
ptypelist.push(["<#1066#>", "Connection_or_Speed_Problem"]);
ptypelist.push(["<#1065#>", "Compatibility_Problem"]);
ptypelist.push(["<#1095#>", "Translated_Suggestion"]);
ptypelist.push(["<#570#>", "Other_Problem"]);
free_options(document.form.fb_ptype);
document.form.fb_ptype.options.length = ptypelist.length;
for(var i = 0; i < ptypelist.length; i++){
document.form.fb_ptype.options[i] = new Option(ptypelist[i][0], ptypelist[i][1]);
}
if(url) //with url : Setting Problem
document.form.fb_ptype.options[1].selected = "1";
}
function Reload_pdesc(obj, url){
free_options(document.form.fb_pdesc);
var ptype = obj.value;
desclist = new Array();
url_group = new Array();
desclist.push(["<#473#> ...","No_selected"]);
url_group.push(["select"]);//false value
if(ptype == "Setting_Problem"){
desclist.push(["<#275#>","QIS"]);
url_group.push(["QIS"]);
desclist.push(["<#182#>","Network Map"]);
url_group.push(["index"]);
desclist.push(["<#113#>","Guest Network"]);
url_group.push(["Guest_network"]);
desclist.push(["<#726#>","AiProtection"]);
url_group.push(["AiProtection"]);
desclist.push(["<#571#>","Adaptive QoS"]); //5
url_group.push(["AdaptiveQoS"]);
desclist.push(["<#1058#>","Traditional QoS"]);
url_group.push(["AiProtection"]);
desclist.push(["<#180#>","<#1915#>"]); /* untranslated */
url_group.push(["TrafficMonitor"]);
desclist.push(["<#256#>","Parental Ctrl"]);
url_group.push(["ParentalControl"]);
desclist.push(["<#181#>","USB Application"]);
url_group.push(["APP_", "AiDisk", "aidisk", "mediaserver", "PrinterServer", "TimeMachine"]);
desclist.push(["AiCloud","AiCloud"]); //10
url_group.push(["cloud"]);
desclist.push(["<#184#>","Wireless"]);
url_group.push(["ACL", "WAdvanced", "Wireless", "WMode", "WSecurity", "WWPS"]);
desclist.push(["<#195#>","WAN"]);
url_group.push(["WAN_", "PortTrigger", "VirtualServer", "Exposed", "NATPassThrough"]);
desclist.push(["<#91#>","Dual WAN"]);
url_group.push(["WANPort"]);
desclist.push(["<#191#>","LAN"]);
url_group.push(["LAN", "DHCP", "GWStaticRoute", "IPTV", "SwitchCtrl"]);
desclist.push(["<#205#>","USB dongle"]); //15
url_group.push(["Modem"]);
desclist.push(["Download Master","DM"]);
url_group.push(["DownloadMaster"]);//false value
desclist.push(["<#200#>","DDNS"]);
url_group.push(["DDNS"]);
desclist.push(["IPv6","IPv6"]);
url_group.push(["IPv6"]);
desclist.push(["VPN","VPN"]);
url_group.push(["VPN"]);
desclist.push(["<#206#>","Firewall"]); //20
url_group.push(["Firewall", "KeywordFilter", "URLFilter"]);
desclist.push(["<#212#>","Administration"]);
url_group.push(["OperationMode", "System", "SettingBackup"]);
desclist.push(["<#488#>","System Log"]);
url_group.push(["VPN"]);
desclist.push(["<#1586#>","Network Tools"]);
url_group.push(["Status_"]);
desclist.push(["Rescue Mode","Rescue"]);
url_group.push(["Rescue"]);//false value
desclist.push(["With other network devices","Other Devices"]); //25
url_group.push(["Other_Device"]);//false value
desclist.push(["Cannot access firmware page","Fail to access"]);
url_group.push(["GUI"]);//false value
desclist.push(["<#216#>","FW update"]);
url_group.push(["FirmwareUpgrade"]);
}
else if(ptype == "Connection_or_Speed_Problem"){
desclist.push(["Slow wireless speed","Wireless speed"]);
desclist.push(["Slow wired speed","Wired speed"]);
desclist.push(["Unstable connection problem","Unstable connection"]);
desclist.push(["Router reboot automatically","Router reboot"]);
}
else if(ptype == "Compatibility_Problem"){
desclist.push(["with modem","Compatible Problem"]);
desclist.push(["with other router","Compatible Problem"]);
desclist.push(["On OS or Application","Compatible Problem"]);
desclist.push(["with printer","Compatible Problem"]);
desclist.push(["with USB modem","Compatible Problem"]);
desclist.push(["with external hardware disk","Compatible Problem"]);
desclist.push(["with other network devices","Compatible Problem"]);
}
else if(ptype == "Translated_Suggestion"){
desclist.splice(0,1);
desclist.push(["Translated Suggestion","Translation"]);
}
else{ //Other_Problem
desclist.splice(0,1);
desclist.push(["<#570#>","others"]);
}
document.form.fb_pdesc.options.length = desclist.length;
if(obj.value == "Setting_Problem" && url){
for(var i = 0; i < url_group.length; i++){
document.form.fb_pdesc.options[i] = new Option(desclist[i][0], desclist[i][1]);
for(var j = 0; j < url_group[i].length; j++){
if(url.search(url_group[i][j]) >= 0){
document.form.fb_pdesc.options[i].selected = "1";
}
}
}
}
else{
for(var i = 0; i < desclist.length; i++){
document.form.fb_pdesc.options[i] = new Option(desclist[i][0], desclist[i][1]);
}
}
}
function updateUSBStatus(){
if(allUsbStatus.search("storage") == "-1"){
document.getElementById("storage_ready").style.display = "none";
document.getElementById("be_lack_storage").style.display = "";
}
else{
document.getElementById("storage_ready").style.display = "";
document.getElementById("be_lack_storage").style.display = "none";
}
}
function redirect(){
document.location.href = "Feedback_Info.asp";
}
function applyRule(){
if(sw_mode != 3 && document.getElementById("connect_status").className == "connectstatusoff"){
alert("<#2030#>");
return false;
}
else{
/*if(document.form.feedbackresponse.value == "3"){
alert("Feedback report daily maximum(10) send limit reached.");
return false;
}*/
if(document.form.attach_syslog.checked == true)
document.form.PM_attach_syslog.value = 1;
else
document.form.PM_attach_syslog.value = 0;
if(document.form.attach_cfgfile.checked == true)
document.form.PM_attach_cfgfile.value = 1;
else
document.form.PM_attach_cfgfile.value = 0;
if(document.form.attach_modemlog.checked == true)
document.form.PM_attach_modemlog.value = 1;
else
document.form.PM_attach_modemlog.value = 0;
if(dsl_support){
if(document.form.attach_iptables.checked == true)
document.form.PM_attach_iptables.value = 1;
else
document.form.PM_attach_iptables.value = 0;
}
if(document.form.fb_email.value == ""){
if(!confirm("<#1073#>")){
document.form.fb_email.focus();
return false;
}
}
else{ //validate email
if(!isEmail(document.form.fb_email.value)){
alert("<#1072#>");
document.form.fb_email.focus();
return false;
}
}
document.form.fb_browserInfo.value = navigator.userAgent;
if(dsl_support){
if(document.form.dslx_diag_enable[0].checked == true){
document.form.action_wait.value="120";
showLoading(120);
}else
showLoading(60);
}
else
showLoading(60);
document.form.submit();
}
}
function isEmail(strE) {
if (strE.search(/^[A-Za-z0-9]+((-[A-Za-z0-9]+)|(\.[A-Za-z0-9]+)|(_[A-Za-z0-9]+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/) != -1)
return true;
else
return false;
}
function textCounter(field, cnt, upper) {
if (field.value.length > upper)
field.value = field.value.substring(0, upper);
else
cnt.value = upper - field.value.length;
}
function change_dsl_diag_enable(value) {
if(value) {
if(allUsbStatus.search("storage") == "-1"){
alert("USB disk required in order to store the debug log, please plug-in a USB disk to <#534#> and Enable DSL Line Diagnostic again.");
document.form.dslx_diag_enable[1].checked = true;
return;
}
else{
alert("While debug log capture in progress, please do not unplug the USB disk as the debug log would be stored in the disk. UI top right globe icon flashing in yellow indicating that debug log capture in progress. Click on the yellow globe icon could cancel the debug log capture. Please note that xDSL line would resync in one minute after Feedback form submitted.");
}
showhide("dslx_diag_duration",1);
}
else {
showhide("dslx_diag_duration",0);
}
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();">
<div id="TopBanner"></div>
<div id="hiddenMask" class="popup_bg">
<table cellpadding="5" cellspacing="0" id="dr_sweet_advise" class="dr_sweet_advise" align="center">
<tr>
<td>
<div class="drword" id="drword" style="height:110px;"><#174#> <#171#>...
<br/>
<br/>
</div>
<div class="drImg"><img src="/images/alertImg.png"></div>
<div style="height:70px;"></div>
</td>
</tr>
</table>
</div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="current_page" value="Advanced_Feedback.asp">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_sendmail">
<input type="hidden" name="action_wait" value="60">
<input type="hidden" name="PM_attach_syslog" value="">
<input type="hidden" name="PM_attach_cfgfile" value="">
<input type="hidden" name="PM_attach_iptables" value="">
<input type="hidden" name="PM_attach_modemlog" value="">
<input type="hidden" name="feedbackresponse" value="<% nvram_get("feedbackresponse"); %>">
<input type="hidden" name="fb_experience" value="<% nvram_get("fb_experience"); %>">
<input type="hidden" name="fb_browserInfo" value="">
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
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top" >
<div>&nbsp;</div>
<div class="formfonttitle"><#212#> - <#1465#></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div id="fb_desc0" class="formfontdesc" style="display:none;"><#1069#></div>
<div id="fb_desc1" class="formfontdesc" style="display:none;"><#1070#></div>
<div id="fb_desc_disconnect" class="formfontdesc" style="display:none;color:#FC0;">Now this function can't work, because your ASUS Router isn't connected to the Internet. Please send your Feedback to this email address : <a href="mailto:router_feedback@asus.com?Subject=<%nvram_get("productid");%>" target="_top" style="color:#FFCC00;">router_feedback@asus.com </a></div><table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<tr>
<th width="30%"><#1068#> *</th>
<td>
<input type="text" name="fb_country" maxlength="30" class="input_25_table" value="" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th><#1080#> *</th>
<td>
<input type="text" name="fb_ISP" maxlength="40" class="input_25_table" value="" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th>Subscribed Plan/Service/Package *</th> <td>
<input type="text" name="fb_Subscribed_Info" maxlength="50" class="input_25_table" value="" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th><#1071#> *</th>
<td>
<input type="text" name="fb_email" maxlength="50" class="input_25_table" value="" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th><#1074#> *</th>
<td>
<input type="checkbox" class="input" name="attach_syslog" id="attach_syslog_id"><label for="attach_syslog_id"><#488#></label>&nbsp;&nbsp;&nbsp;
<input type="checkbox" class="input" name="attach_cfgfile" id="attach_cfgfile_id"><label for="attach_cfgfile_id"><#1090#></label>&nbsp;&nbsp;&nbsp;
<span id="attach_iptables_span" style="color:#FFFFFF;"><input type="checkbox" class="input" name="attach_iptables" id="attach_iptables_id"><label for="attach_iptables_id"><#1079#></label></span>
<span id="attach_modem_span" style="color:#FFFFFF;"><input type="checkbox" class="input" name="attach_modemlog" id="attach_modemlog_id"><label for="attach_modemlog_id">3G/4G log</label></span>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(25,11);">Enable DSL Line Diagnostic *</a></th>
<td>
<input type="radio" name="dslx_diag_enable" class="input" value="1" onclick="change_dsl_diag_enable(1);"><#65#>
<input type="radio" name="dslx_diag_enable" class="input" value="0" onclick="change_dsl_diag_enable(0);" checked><#64#>
<br>
<span id="storage_ready" style="display:none;color:#FC0">* USB disk is ready.</span>
<span id="be_lack_storage" style="display:none;color:#FC0">* No USB disk plug-in.</span>
</td>
</tr>
<tr id="dslx_diag_duration">
<th>Diagnostic debug log capture duration *</th>
<td>
<select id="" class="input_option" name="dslx_diag_duration">
<option value="0" selected><#40#></option>
<option value="3600">1 <#1223#></option>
<option value="18000">5 <#1223#></option>
<option value="43200">12 <#1223#></option>
<option value="86400">24 <#1223#></option>
</select>
</td>
</tr>
<tr>
<th><#1067#></th>
<td>
<select class="input_option" name="fb_availability">
<option value="Not_selected"><#473#> ...</option>
<option value="Stable_connection"><#1092#></option>
<option value="Occasional_interruptions"><#1086#></option>
<option value="Frequent_interruptions"><#1078#></option>
<option value="Unavailable"><#1096#></option>
</select>
</td>
</tr>
<tr>
<th><#1089#></th>
<td>
<select class="input_option" name="fb_ptype" onChange="Reload_pdesc(this);">
</select>
</td>
</tr>
<tr>
<th><#1088#></th>
<td>
<select class="input_option" name="fb_pdesc">
</select>
</td>
</tr>
<tr>
<th>
<#1064#> *
</th>
<td>
<textarea name="fb_comment" maxlength="2000" cols="55" rows="8" style="font-family:'Courier New', Courier, mono; font-size:13px;background:#475A5F;color:#FFFFFF;" onKeyDown="textCounter(this,document.form.msglength,2000);" onKeyUp="textCounter(this,document.form.msglength,2000)"></textarea>
<span style="color:#FC0"><#1081#> : </span>
<input type="text" class="input_6_table" name="msglength" id="msglength" maxlength="4" value="2000" autocorrect="off" autocapitalize="off" readonly>
</td>
</tr>
<tr>
<td colspan="2">
<div><#1087#></div>
<input class="button_gen" style="margin-left: 305px;" name="btn_send" onclick="applyRule()" type="button" value="Send"/>
</td>
</tr>
<tr>
<td colspan="2">
<strong><#1173#></strong>
<ul>
<li><#1083#></li>
<li><#1084#></li>
<li><#1085#></li>
</ul>
</td>
</tr>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</form>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</body>
</html>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</body>
</html>


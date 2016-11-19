﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:v>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#548#> - <#219#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="css/confirm_block.css"></script>
<style>
.FormTable{
margin-top:10px;
}
.Bar_container{
width:85%;
height:21px;
border:1px inset #999;
margin:0 auto;
margin-top:20px \9;
background-color:#FFFFFF;
z-index:100;
}
#proceeding_img_text{
position:absolute;
z-index:101;
font-size:11px; color:#000000;
line-height:21px;
width: 83%;
}
#proceeding_img{
height:21px;
background:#C0D1D3 url(/images/proceeding_img.gif);
}
.button_helplink{
font-weight: bolder;
text-shadow: 1px 1px 0px black;
text-align: center;
vertical-align: middle;
background: transparent url(/images/New_ui/contentbt_normal.png) no-repeat scroll center top;
_background: transparent url(/images/New_ui/contentbt_normal_ie6.png) no-repeat scroll center top;
border:0;
color: #FFFFFF;
height:33px;
width:122px;
font-family:Verdana;
font-size:12px;
overflow:visible;
cursor:pointer;
outline: none; /* for Firefox */
hlbr:expression(this.onFocus=this.blur()); /* for IE */
white-space:normal;
}
.button_helplink:hover{
font-weight: bolder;
background:url(/images/New_ui/contentbt_over.png) no-repeat scroll center top;
height:33px;
width:122px;
cursor:pointer;
outline: none; /* for Firefox */
hlbr:expression(this.onFocus=this.blur()); /* for IE */
}
</style>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/validator.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/confirm_block.js"></script>
<script language="JavaScript" type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
<script>
var webs_state_update = '<% nvram_get("webs_state_update"); %>';
var webs_state_upgrade = '<% nvram_get("webs_state_upgrade"); %>';
var webs_state_error = '<% nvram_get("webs_state_error"); %>';
var webs_state_info = '<% nvram_get("webs_state_info"); %>';
var webs_state_info_beta = '<% nvram_get("webs_state_info_beta"); %>';
var confirm_show = '<% get_parameter("confirm_show"); %>';
var webs_release_note= "";
var varload = 0;
var helplink = "";
var dpi_engine_status = <%bwdpi_engine_status();%>;
function initial(){
show_menu();
if(bwdpi_support){
if(dpi_engine_status.DpiEngine == 1)
document.getElementById("sig_ver_field").style.display="";
else
document.getElementById("sig_ver_field").style.display="none";
var sig_ver = '<% nvram_get("bwdpi_sig_ver"); %>';
if(sig_ver == "")
document.getElementById("sig_ver_word").innerHTML = "1.008";
else
document.getElementById("sig_ver_word").innerHTML = sig_ver;
}
if(!live_update_support || !HTTPS_support){
document.getElementById("update").style.display = "none";
document.getElementById("linkpage_div").style.display = "";
document.getElementById("linkpage").style.display = "";
helplink = "http://xvtx.ru/xwrt/download.htm";
document.getElementById("linkpage").href = helplink;
}
else{
document.getElementById("update").style.display = "";
document.getElementById("linkpage_div").style.display = "none";
change_firmware_path(document.getElementById("beta_firmware_path").checked==true);
if(confirm_show == 1){
do_show_confirm(webs_state_info, 0, current_firmware_path); //Show formal path result
}
}
/* Viz remarked 2016.06.17
if(!live_update_support || !HTTPS_support || exist_firmver[0] == 9){
document.getElementById('auto_upgrade_setting').style.display = "none";
}
else{
document.firmware_form.upgrade_date_x_Sun.checked = getDateCheck(document.firmware_form.fw_schedule.value, 0);
document.firmware_form.upgrade_date_x_Mon.checked = getDateCheck(document.firmware_form.fw_schedule.value, 1);
document.firmware_form.upgrade_date_x_Tue.checked = getDateCheck(document.firmware_form.fw_schedule.value, 2);
document.firmware_form.upgrade_date_x_Wed.checked = getDateCheck(document.firmware_form.fw_schedule.value, 3);
document.firmware_form.upgrade_date_x_Thu.checked = getDateCheck(document.firmware_form.fw_schedule.value, 4);
document.firmware_form.upgrade_date_x_Fri.checked = getDateCheck(document.firmware_form.fw_schedule.value, 5);
document.firmware_form.upgrade_date_x_Sat.checked = getDateCheck(document.firmware_form.fw_schedule.value, 6);
document.firmware_form.upgrade_time_x_hour.value = getfirmwareTimeRange(document.firmware_form.fw_schedule.value, 0);
document.firmware_form.upgrade_time_x_min.value = getfirmwareTimeRange(document.firmware_form.fw_schedule.value, 1);
document.getElementById('auto_upgrade_setting').style.display = "";
hide_upgrade_option('<% nvram_get("fw_schedule_enable"); %>');
}
*/
if(based_modelid == "RT-AC68R"){ //MODELDEP //id: asus_link is in string tag #FW_desc0#
document.getElementById("asus_link").href = "http://www.asus.com/us/supportonly/RT-AC68R/";
document.getElementById("asus_link").innerHTML = "http://www.asus.com/us/supportonly/RT-AC68R/";
}
if(based_modelid == "RT-AC68A"){ //MODELDEP : Spec special fine tune
document.getElementById("fw_note2").style.display = "none";
document.getElementById("fw_note3").style.display = "none";
inputCtrl(document.form.file, 0);
inputCtrl(document.form.upload, 0);
}
else{
inputCtrl(document.form.file, 1);
inputCtrl(document.form.upload, 1);
}
document.getElementById("fw_note3").style.display = "none";
var extendno = "<% nvram_get("extendno"); %>";
var firmver_info = "<% nvram_get("buildno"); %>";
if ((extendno != "") && (extendno != "0"))
firmver_info += "_" + extendno;
document.getElementById("firmver_table").value = firmver_info;
if ("<% nvram_get("jffs2_enable"); %>" == "1") document.getElementById("jffs_warning").style.display="";
}
var dead = 0;
var note_display=0; //formal path
function detect_firmware(flag){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
error: function(xhr){
dead++;
if(dead < 30)
setTimeout("detect_firmware();", 1000);
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#870#>";
}
},
success: function(){
if(webs_state_update==0){
setTimeout("detect_firmware();", 1000);
}
else{ // got fw info
if(webs_state_error == "1"){ //1:wget fail
document.getElementById('update_scan').style.display="none";
if(document.start_update.firmware_path.value==1){ //Beta Firmware not available yet
document.getElementById('update_states').innerHTML="No beta firmware available now."; /* untranslated */
}
else{
document.getElementById('update_states').innerHTML="<#870#>";
}
}
else if(webs_state_error == "3"){ //3: FW check/RSA check fail
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').innerHTML="<#106#><br><#1202#>";
}
else{
var check_webs_state_info = webs_state_info;
if(document.start_update.firmware_path.value==1){ //check beta path
check_webs_state_info = webs_state_info_beta;
note_display=1;
}
else{
note_display=0;
}
do_show_confirm(check_webs_state_info, document.start_update.firmware_path.value, current_firmware_path);
}
}
}
});
}
function do_show_confirm(FWVer, CheckPath, CurrentPath){
if(isNewFW(FWVer, CheckPath, CurrentPath)){ //check_path, current_path
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').style.display="none";
if(note_display==1){ //for beta
confirm_asus({
title: "Beta Firmware Available",
contentA: "The beta firmware lets users try pre-release features. The feedback on quality and usability helps us identify issues and make firmware even better. Please note that beta firmware may contain errors or may not function as well as formally release firmware. Install only on devices that are not business critical. If you want to back to formally released version, please uncheck <b>get beta firmware</b> then click check button to get the formally released firmware. When changed to formally released firmware, some new features in beta firmware may lose.<br>", /* untranslated */
contentC: "<br><#603#> <#178#>",
left_button: "<#75#>",
left_button_callback: function(){confirm_cancel();},
left_button_args: {},
right_button: "<#219#>",
right_button_callback: function(){
document.start_update.action_mode.value="apply";
document.start_update.firmware_path.value=1;
document.start_update.action_script.value="start_webs_upgrade";
document.start_update.submit();
},
right_button_args: {},
iframe: "get_release_note1.asp",
margin: "100px 0px 0px 25px",
note_display_flag: note_display
});
}
else{
confirm_asus({
title: "New Firmware Available",
contentA: "<#98#><br>",
contentC: "<br><#603#> <#178#>",
left_button: "<#75#>",
left_button_callback: function(){confirm_cancel();},
left_button_args: {},
right_button: "<#219#>",
right_button_callback: function(){
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_upgrade";
document.start_update.submit();
},
right_button_args: {},
iframe: "get_release_note0.asp",
margin: "100px 0px 0px 25px",
note_display_flag: note_display
});
}
}
else{
document.getElementById('update_scan').style.display="none";
if(note_display==1 && FWVer.length < 5){ //for beta path, length should be longer than 17 (e.g. 3004_380_0-g123456)
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="No beta firmware available now."; /* untranslated */
}
else{
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#135#>";
}
}
}
function detect_update(firmware_path){
if(sw_mode != "1" || (link_status == "2" && link_auxstatus == "0") || (link_status == "2" && link_auxstatus == "2")){
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_update";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#850#>";
document.getElementById('update_scan').style.display="";
document.start_update.submit();
}
else if(dualwan_enabled &&
((first_link_status == "2" && first_link_auxstatus == "0") || (first_link_status == "2" && first_link_auxstatus == "2")) ||
((secondary_link_status == "2" && secondary_link_auxstatus == "0") || (secondary_link_status == "2" && secondary_link_auxstatus == "2"))){
document.start_update.action_mode.value="apply";
document.start_update.action_script.value="start_webs_update";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#850#>";
document.getElementById('update_scan').style.display="";
document.start_update.submit();
}
else{
document.getElementById('update_scan').style.display="none";
document.getElementById('update_states').style.display="";
document.getElementById('update_states').innerHTML="<#870#>";
return false;
}
}
var dead = 0;
function detect_httpd(){
$.ajax({
url: '/httpd_check.xml',
dataType: 'xml',
timeout: 1500,
error: function(xhr){
if(dead > 5){
document.getElementById('loading_block1').style.display = "none";
document.getElementById('loading_block2').style.display = "none";
document.getElementById('loading_block3').style.display = "";
document.getElementById('loading_block3').innerHTML = "<div><#108#></div>";
}
else{
dead++;
}
setTimeout("detect_httpd();", 1000);
},
success: function(){
location.href = "index.asp";
}
});
}
var rebooting = 0;
function isDownloading(){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
timeout: 1500,
error: function(xhr){
rebooting++;
if(rebooting < 30){
setTimeout("isDownloading();", 1000);
}
else{
document.getElementById("drword").innerHTML = "<#870#>";
return false;
}
},
success: function(){
if(webs_state_upgrade == 0){
setTimeout("isDownloading();", 1000);
}
else{ // webs_upgrade.sh is done
if(webs_state_error == 1){
document.getElementById("drword").innerHTML = "<#870#>";
return false;
}
else if(webs_state_error == 2){
document.getElementById("drword").innerHTML = "Memory space is NOT enough to upgrade on internet. Please wait for rebooting.<br><#1202#>"; /* untranslated */ //Untranslated.fw_size_higher_mem
return false;
}
else if(webs_state_error == 3){
document.getElementById("drword").innerHTML = "<#106#><br><#1202#>";
return false;
}
else{ // start upgrading
document.getElementById("hiddenMask").style.visibility = "hidden";
showLoadingBar(270);
setTimeout("detect_httpd();", 272000);
return false;
}
}
}
});
}
function startDownloading(){
disableCheckChangedStatus();
dr_advise();
document.getElementById("drword").innerHTML = "&nbsp;&nbsp;&nbsp;<#1203#>...";
isDownloading();
}
function check_zip(obj){
var reg = new RegExp("^.*.(zip|ZIP|rar|RAR|7z|7Z)$", "gi");
if(reg.test(obj.value)){
alert("<#1210#>");
obj.focus();
obj.select();
return false;
}
else
return true;
}
function submitForm(){
if(!check_zip(document.form.file))
return;
else
onSubmitCtrlOnly(document.form.upload, 'Upload1');
}
function sig_version_check(){
$("#sig_check").hide();
$("#sig_status").show();
document.sig_update.submit();
$("#sig_status").html("Signature checking ...");
setTimeout("sig_check_status();", 12000);
}
function sig_check_status(){
$.ajax({
url: '/detect_firmware.asp',
dataType: 'script',
timeout: 3000,
error: function(xhr){
setTimeout("sig_check_status();", 1000);
},
success: function(){
$("#sig_status").show();
if(sig_state_flag == 0){ // no need upgrade
$("#sig_status").html("Signature is up to date");
$("#sig_check").show();
}
else if(sig_state_flag == 1){
if(sig_state_error != 0){ // update error
$("#sig_status").html("Signature update failed");
$("#sig_check").show();
}
else{
if(sig_state_upgrade == 1){ //update complete
$("#sig_status").html("Signature update completely");
$("#sig_ver").html(sig_ver);
$("#sig_check").show();
}
else{ //updating
$("#sig_status").html("Signature is updating");
setTimeout("sig_check_status();", 1000);
}
}
}
}
});
}
function check_Timefield_checkbox(){ // To check Date checkbox checked or not and control Time field disabled or not
if( document.firmware_form.upgrade_date_x_Sun.checked == true
|| document.firmware_form.upgrade_date_x_Mon.checked == true
|| document.firmware_form.upgrade_date_x_Tue.checked == true
|| document.firmware_form.upgrade_date_x_Wed.checked == true
|| document.firmware_form.upgrade_date_x_Thu.checked == true
|| document.firmware_form.upgrade_date_x_Fri.checked == true
|| document.firmware_form.upgrade_date_x_Sat.checked == true ){
inputCtrl(document.firmware_form.upgrade_time_x_hour,1);
inputCtrl(document.firmware_form.upgrade_time_x_min,1);
}
else{
inputCtrl(document.firmware_form.upgrade_time_x_hour,0);
inputCtrl(document.firmware_form.upgrade_time_x_min,0);
}
}
function hide_upgrade_option(flag){
document.firmware_form.upgrade_date_x_Sun.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Mon.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Tue.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Wed.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Thu.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Fri.disabled = (flag == 1) ? false : true;
document.firmware_form.upgrade_date_x_Sat.disabled = (flag == 1) ? false : true;
(flag == 1) ? inputCtrl(document.firmware_form.upgrade_time_x_hour,1) : inputCtrl(document.firmware_form.upgrade_time_x_hour,0);
(flag == 1) ? inputCtrl(document.firmware_form.upgrade_time_x_min,1) : inputCtrl(document.firmware_form.upgrade_time_x_min,0);
if(flag==1)
check_Timefield_checkbox();
}
function getfirmwareTimeRange(str, pos)
{
if (pos == 0)
return str.substring(7,9);
else if (pos == 1)
return str.substring(9,11);
}
function setfirmwareTimeRange(rd, rh, rm)
{
return(rd.value+rh.value+rm.value);
}
function updateDateTime()
{
if(document.firmware_form.fw_schedule_enable.value == "1"){
document.firmware_form.fw_schedule.value = setDateCheck(
document.firmware_form.upgrade_date_x_Sun,
document.firmware_form.upgrade_date_x_Mon,
document.firmware_form.upgrade_date_x_Tue,
document.firmware_form.upgrade_date_x_Wed,
document.firmware_form.upgrade_date_x_Thu,
document.firmware_form.upgrade_date_x_Fri,
document.firmware_form.upgrade_date_x_Sat);
document.firmware_form.fw_schedule.value = setfirmwareTimeRange(
document.firmware_form.fw_schedule,
document.firmware_form.upgrade_time_x_hour,
document.firmware_form.upgrade_time_x_min);
}
}
function applyRule(){
if(validForm()){
if(live_update_support){
updateDateTime();
}
showLoading();
document.firmware_form.submit();
}
}
function validForm(){
if(live_update_support){
if(!document.firmware_form.upgrade_date_x_Sun.checked && !document.firmware_form.upgrade_date_x_Mon.checked &&
!document.firmware_form.upgrade_date_x_Tue.checked && !document.firmware_form.upgrade_date_x_Wed.checked &&
!document.firmware_form.upgrade_date_x_Thu.checked && !document.firmware_form.upgrade_date_x_Fri.checked &&
!document.firmware_form.upgrade_date_x_Sat.checked && document.firmware_form.fw_schedule_enable.value == "1")
{
alert(Untranslated.filter_lw_date_valid);
document.firmware_form.upgrade_date_x_Sun.focus();
return false;
}
else
return true;
}
else
return true;
}
function change_firmware_path(flag){
if(flag)
document.start_update.firmware_path.value = 1; //beta path
else
document.start_update.firmware_path.value = 0; //stable path
}
</script>
</head>
<body onload="initial();">
<div id="TopBanner"></div>
<div id="LoadingBar" class="popup_bar_bg">
<table cellpadding="5" cellspacing="0" id="loadingBarBlock" class="loadingBarBlock" align="center">
<tr>
<td height="80">
<div id="loading_block1" class="Bar_container">
<span id="proceeding_img_text"></span>
<div id="proceeding_img"></div>
</div>
<div id="loading_block2" style="margin:5px auto; width:85%;"><#107#><br><#178#></div>
<div id="loading_block3" style="margin:5px auto;width:85%; font-size:12pt;"></div>
</td>
</tr>
</table>
<!--[if lte IE 6.5]><iframe class="hackiframe"></iframe><![endif]-->
</div>
<div id="Loading" class="popup_bg"></div><div id="hiddenMask" class="popup_bg">
<table cellpadding="5" cellspacing="0" id="dr_sweet_advise" class="dr_sweet_advise" align="center" style="height:100px;">
<tr>
<td>
<div class="drword" id="drword" style="">&nbsp;&nbsp;&nbsp;&nbsp;<#177#> <#174#>...</div>
</td>
</tr>
</table>
<!--[if lte IE 6.5]><iframe class="hackiframe"></iframe><![endif]-->
</div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" action="upgrade.cgi" name="form" target="hidden_frame" enctype="multipart/form-data">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
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
<td align="left" valign="top" >
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top" >
<div>&nbsp;</div>
<div class="formfonttitle"><#215#> - <#219#></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc"><strong><#1209#></strong>
<ol>
<li id="jffs_warning" style="display:none; color:#FFCC00;">WARNING: you have JFFS enabled. Make sure you have a backup of its content, as upgrading your firmware MIGHT overwrite it!</li>
<li><#1207#></li>
<li><#111#></li>
<li id="fw_note2"><#1208#></li>
<li id="fw_note3"><#1201#></li>
</ol>
</div>
<div class="formfontdesc">
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WKWAWNE4ZWE54" target="_blank"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" alt="PayPal - The safer, easier way to pay online!"></a>
</div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#1205#></td>
</tr>
</thead>
<tr>
<th><#1204#></th>
<td><#549#></td>
</tr>
<tr id="sig_ver_field" style="display:none">
<th>Signature Version</th>
<td >
<div id="sig_ver_word" style="padding-top:5px;"></div>
<div>
<div id="sig_check" class="button_helplink" style="margin-left:330px;margin-top:-25px;" onclick="sig_version_check();"><a target="_blank"><div style="padding-top:5px;"><#1474#></div></a></div>
<div>
<span id="sig_status" style="display:none"></span>
</div>
</div>
</td>
</tr>
<tr>
<th><#1205#></th>
<td>
<input type="text" name="firmver_table" id="firmver_table" class="input_20_table" value="<% nvram_get("firmver"); %>.<% nvram_get("buildno"); %>_<% nvram_get("extendno"); %>" readonly="1" autocorrect="off" autocapitalize="off">&nbsp&nbsp&nbsp<input type="button" id="update" name="update" class="button_gen" style="display:none;" onclick="detect_update(document.start_update.firmware_path.value);" value="<#1474#>" />
<div id="linkpage_div" class="button_helplink" style="margin-left:330px;margin-top:-25px;display:none;"><a id="linkpage" target="_blank"><div style="padding-top:5px;"><#1474#></div></a></div>
<div id="check_states">
<span id="update_states"></span>
<img id="update_scan" style="display:none;" src="images/InternetScan.gif" />
</div>
</td>
</tr>
<tr>
<th><#1206#></th>
<td>
<input type="file" name="file" class="input" style="color:#FFCC00;*color:#000;width: 324px;">
<input type="button" name="upload" class="button_gen" onclick="submitForm()" value="<#904#>" />
</td>
</tr>
</table>
</form>
<form method="post" name="firmware_form" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="flag" value="">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_time">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="fw_schedule_enable" value="<% nvram_get("fw_schedule_enable"); %>">
<input type="hidden" name="fw_schedule" value="<% nvram_get("fw_schedule"); %>">
<table id="auto_upgrade_setting" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="display:none;">
<thead>
<tr>
<td colspan="2">Auto Upgrade Setting</td> </tr>
</thead>
<tr>
<th>Instal Newer Ofiicial Firmware Automatically</th> <td>
<div class="left" style="width:94px; float:left; cursor:pointer;" id="radio_firmware_schedule_enable"></div>
<script type="text/javascript">
$('#radio_firmware_schedule_enable').iphoneSwitch('<% nvram_get("fw_schedule_enable"); %>',
function() {
document.firmware_form.fw_schedule_enable.value = 1;
hide_upgrade_option(1);
},
function() {
document.firmware_form.fw_schedule_enable.value = 0;
hide_upgrade_option(0);
}
);
</script>
</td>
</tr>
<tr>
<th>Day To Install</th> <td>
<input type="checkbox" name="upgrade_date_x_Sun" class="input" onclick="check_Timefield_checkbox();"><#914#>
<input type="checkbox" name="upgrade_date_x_Mon" class="input" onclick="check_Timefield_checkbox();"><#912#>
<input type="checkbox" name="upgrade_date_x_Tue" class="input" onclick="check_Timefield_checkbox();"><#916#>
<input type="checkbox" name="upgrade_date_x_Wed" class="input" onclick="check_Timefield_checkbox();"><#917#>
<input type="checkbox" name="upgrade_date_x_Thu" class="input" onclick="check_Timefield_checkbox();"><#915#>
<input type="checkbox" name="upgrade_date_x_Fri" class="input" onclick="check_Timefield_checkbox();"><#911#>
<input type="checkbox" name="upgrade_date_x_Sat" class="input" onclick="check_Timefield_checkbox();"><#913#>
</td>
</tr>
<tr>
<th>Time To Install</th> <td>
<input type="text" maxlength="2" class="input_3_table" name="upgrade_time_x_hour" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 0);" autocorrect="off" autocapitalize="off"> :
<input type="text" maxlength="2" class="input_3_table" name="upgrade_time_x_min" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 1);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr align="center">
<td colspan="2" >
<input type="button" name="apply" class="button_gen" onclick="applyRule()" value="<#73#>" />
</td>
</tr>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
<div id="footer"></div>
</form>
<form method="post" name="start_update" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="flag" value="liveUpdate">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
<input type="hidden" name="firmware_path" value="0">
</form>
<form method="post" name="sig_update" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="next_page" value="Advanced_FirmwareUpgrade_Content.asp">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="start_sig_check">
<input type="hidden" name="action_wait" value="">
</form>
</body>
</html>


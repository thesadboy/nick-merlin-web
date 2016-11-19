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
<title><#548#> - <#218#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="pwdmeter.css">
<link rel="stylesheet" type="text/css" href="device-map/device-map.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<script language="JavaScript" type="text/javascript" src="/validator.js"></script>
<script language-"JavaScript" type="text/javascript" src="/merlin.js"></script>
<script>
time_day = uptimeStr.substring(5,7);//Mon, 01 Aug 2011 16:25:44 +0800(1467 secs since boot....
time_mon = uptimeStr.substring(9,12);
time_time = uptimeStr.substring(18,20);
dstoffset = '<% nvram_get("time_zone_dstoff"); %>';
var isFromHTTPS = false;
if((location.href.search('https://') >= 0) || (location.href.search('HTTPS://') >= 0)){
isFromHTTPS = true;
}
var orig_http_clientlist = decodeURIComponent("<% nvram_char_to_ascii("","http_clientlist"); %>");
var http_clientlist_array = decodeURIComponent("<% nvram_char_to_ascii("","http_clientlist"); %>");
var accounts = [<% get_all_accounts(); %>];
for(var i=0; i<accounts.length; i++){
accounts[i] = decodeURIComponent(accounts[i]);
}
if(accounts.length == 0)
accounts = ['<% nvram_get("http_username"); %>'];
if(tmo_support)
var theUrl = "cellspot.router";
else
var theUrl = "router.asus.com";
if(sw_mode == 3 || (sw_mode == 4))
theUrl = location.hostName;
function initial(){
show_menu();
show_http_clientlist();
display_spec_IP(document.form.http_client.value);
if(reboot_schedule_support){
document.form.reboot_date_x_Sun.checked = getDateCheck(document.form.reboot_schedule.value, 0);
document.form.reboot_date_x_Mon.checked = getDateCheck(document.form.reboot_schedule.value, 1);
document.form.reboot_date_x_Tue.checked = getDateCheck(document.form.reboot_schedule.value, 2);
document.form.reboot_date_x_Wed.checked = getDateCheck(document.form.reboot_schedule.value, 3);
document.form.reboot_date_x_Thu.checked = getDateCheck(document.form.reboot_schedule.value, 4);
document.form.reboot_date_x_Fri.checked = getDateCheck(document.form.reboot_schedule.value, 5);
document.form.reboot_date_x_Sat.checked = getDateCheck(document.form.reboot_schedule.value, 6);
document.form.reboot_time_x_hour.value = getrebootTimeRange(document.form.reboot_schedule.value, 0);
document.form.reboot_time_x_min.value = getrebootTimeRange(document.form.reboot_schedule.value, 1);
document.getElementById('reboot_schedule_enable_tr').style.display = "";
hide_reboot_option('<% nvram_get("reboot_schedule_enable"); %>');
}
else{
document.getElementById('reboot_schedule_enable_tr').style.display = "none";
document.getElementById('reboot_schedule_date_tr').style.display = "none";
document.getElementById('reboot_schedule_time_tr').style.display = "none";
}
corrected_timezone();
load_timezones();
parse_dstoffset();
load_dst_m_Options();
load_dst_w_Options();
load_dst_d_Options();
load_dst_h_Options();
document.form.http_passwd2.value = "";
if(svc_ready == "0")
document.getElementById('svc_hint_div').style.display = "";
if(!HTTPS_support){
document.getElementById("https_tr").style.display = "none";
document.getElementById("https_lanport").style.display = "none";
}
else{
hide_https_lanport(document.form.http_enable.value);
hide_https_wanport(document.form.http_enable.value);
}
if(wifi_tog_btn_support || wifi_hw_sw_support || sw_mode == 2 || sw_mode == 4){ // wifi_tog_btn && wifi_hw_sw && hide WPS button behavior under repeater mode
if(cfg_wps_btn_support){
document.getElementById('turn_WPS').style.display = "";
document.form.btn_ez_radiotoggle[1].disabled = true;
document.getElementById('turn_WiFi').style.display = "none";
document.getElementById('turn_WiFi_str').style.display = "none";
document.getElementById('turn_LED').style.display = "";
if(document.form.btn_ez_radiotoggle[2].checked == false)
document.form.btn_ez_radiotoggle[0].checked = true;
}
else{
document.form.btn_ez_radiotoggle[0].disabled = true;
document.form.btn_ez_radiotoggle[1].disabled = true;
document.form.btn_ez_radiotoggle[2].disabled = true;
document.getElementById('btn_ez_radiotoggle_tr').style.display = "none";
}
}
else{
document.getElementById('btn_ez_radiotoggle_tr').style.display = "";
if(cfg_wps_btn_support){
document.getElementById('turn_WPS').style.display = "";
document.getElementById('turn_WiFi').style.display = "";
document.getElementById('turn_LED').style.display = "";
if(document.form.btn_ez_radiotoggle[1].checked == false && document.form.btn_ez_radiotoggle[2].checked == false)
document.form.btn_ez_radiotoggle[0].checked = true;
}
else{
document.getElementById('turn_WPS').style.display = "";
document.getElementById('turn_WiFi').style.display = "";
document.getElementById('turn_LED').disabled = true;
document.getElementById('turn_LED').style.display = "none";
document.getElementById('turn_LED_str').style.display = "none";
if(document.form.btn_ez_radiotoggle[1].checked == false)
document.form.btn_ez_radiotoggle[0].checked = true;
}
}
if(sw_mode != 1){
document.getElementById('misc_http_x_tr').style.display ="none";
hideport(0);
document.form.misc_http_x.disabled = true;
document.form.misc_httpsport_x.disabled = true;
document.form.misc_httpport_x.disabled = true;
}
else
hideport(document.form.misc_http_x[0].checked);
if(!HTTPS_support || '<% nvram_get("http_enable"); %>' == 0)
document.getElementById("https_port").style.display = "none";
else if('<% nvram_get("http_enable"); %>' == 1)
document.getElementById("http_port").style.display = "none";
document.form.http_username.value= accounts[0];
if(ssh_support){
check_sshd_enable('<% nvram_get("sshd_enable"); %>');
document.form.sshd_authkeys.value = document.form.sshd_authkeys.value.replace(/>/gm,"\r\n");
}
else{
document.getElementById('ssh_table').style.display = "none";
}
if(tmo_support){
document.getElementById("telnet_tr").style.display = "none";
document.form.telnetd_enable[0].disabled = true;
document.form.telnetd_enable[1].disabled = true;
}
else{
document.getElementById("telnet_tr").style.display = "";
document.form.telnetd_enable[0].disabled = false;
document.form.telnetd_enable[1].disabled = false;
}
}
var time_zone_tmp="";
var time_zone_s_tmp="";
var time_zone_e_tmp="";
var time_zone_withdst="";
function applyRule(){
if(validForm()){
var rule_num = document.getElementById('http_clientlist_table').rows.length;
var item_num = document.getElementById('http_clientlist_table').rows[0].cells.length;
var tmp_value = "";
for(i=0; i<rule_num; i++){
tmp_value += "<"
for(j=0; j<item_num-1; j++){
tmp_value += document.getElementById('http_clientlist_table').rows[i].cells[j].innerHTML;
if(j != item_num-2)
tmp_value += ">";
}
}
if(tmp_value == "<"+"<#1324#>" || tmp_value == "<")
tmp_value = "";
document.form.http_clientlist.value = tmp_value;
if(document.form.http_clientlist.value == "" && document.form.http_client[0].checked == 1){
alert("<#140#>");
document.form.http_client_ip_x_0.focus();
return false;
}
if(document.form.http_client[0].checked && document.form.http_clientlist.value != orig_http_clientlist){
document.form.action_script.value = "restart_time;restart_httpd;restart_upnp";
}
if(document.form.http_passwd2.value.length > 0){
document.form.http_passwd.value = document.form.http_passwd2.value;
document.form.http_passwd.disabled = false;
}
if(document.form.time_zone_select.value.search("DST") >= 0 || document.form.time_zone_select.value.search("TDT") >= 0){ // DST area
time_zone_tmp = document.form.time_zone_select.value.split("_"); //0:time_zone 1:serial number
time_zone_s_tmp = "M"+document.form.dst_start_m.value+"."+document.form.dst_start_w.value+"."+document.form.dst_start_d.value+"/"+document.form.dst_start_h.value;
time_zone_e_tmp = "M"+document.form.dst_end_m.value+"."+document.form.dst_end_w.value+"."+document.form.dst_end_d.value+"/"+document.form.dst_end_h.value;
document.form.time_zone_dstoff.value=time_zone_s_tmp+","+time_zone_e_tmp;
document.form.time_zone.value = document.form.time_zone_select.value;
}else{
document.form.time_zone.value = document.form.time_zone_select.value;
}
if(document.form.misc_http_x[1].checked == true){
document.form.misc_httpport_x.disabled = true;
document.form.misc_httpsport_x.disabled = true;
}
if(document.form.misc_http_x[0].checked == true
&& document.form.http_enable[0].selected == true){
document.form.misc_httpsport_x.disabled = true;
}
if(document.form.misc_http_x[0].checked == true
&& document.form.http_enable[1].selected == true){
document.form.misc_httpport_x.disabled = true;
}
if(document.form.https_lanport.value != '<% nvram_get("https_lanport"); %>'
|| document.form.http_enable.value != '<% nvram_get("http_enable"); %>'
|| document.form.misc_httpport_x.value != '<% nvram_get("misc_httpport_x"); %>'
|| document.form.misc_httpsport_x.value != '<% nvram_get("misc_httpsport_x"); %>'
){
document.form.action_script.value = "restart_time;restart_httpd;restart_upnp";
if(document.form.http_enable.value == "0"){ //HTTP
if(isFromWAN)
document.form.flag.value = "http://" + location.hostname + ":" + document.form.misc_httpport_x.value;
else
document.form.flag.value = "http://" + location.hostname;
}
else if(document.form.http_enable.value == "1"){ //HTTPS
if(isFromWAN)
document.form.flag.value = "https://" + location.hostname + ":" + document.form.misc_httpsport_x.value;
else
document.form.flag.value = "https://" + location.hostname + ":" + document.form.https_lanport.value;
}
else{ //BOTH
if(isFromHTTPS){
if(isFromWAN)
document.form.flag.value = "https://" + location.hostname + ":" + document.form.misc_httpsport_x.value;
else
document.form.flag.value = "https://" + location.hostname + ":" + document.form.https_lanport.value;
}else{
if(isFromWAN)
document.form.flag.value = "http://" + location.hostname + ":" + document.form.misc_httpport_x.value;
else
document.form.flag.value = "http://" + location.hostname;
}
}
}
if(document.form.btn_ez_radiotoggle[1].disabled == false && document.form.btn_ez_radiotoggle[1].checked == true){
document.form.btn_ez_radiotoggle.value=1;
document.form.btn_ez_mode.value=0;
}
else if(document.form.btn_ez_radiotoggle[2].disabled == false && document.form.btn_ez_radiotoggle[2].checked == true){
document.form.btn_ez_radiotoggle.value=0;
document.form.btn_ez_mode.value=1;
}
else{
document.form.btn_ez_radiotoggle.value=0;
document.form.btn_ez_mode.value=0;
}
if(reboot_schedule_support){
updateDateTime();
}
showLoading();
document.form.submit();
}
}
function validForm(){
showtext(document.getElementById("alert_msg1"), "");
showtext(document.getElementById("alert_msg2"), "");
if(document.form.http_username.value.length == 0){
showtext(document.getElementById("alert_msg1"), "<#100#>");
document.form.http_username.focus();
document.form.http_username.select();
return false;
}
else{
var alert_str = validator.hostName(document.form.http_username);
if(alert_str != ""){
showtext(document.getElementById("alert_msg1"), alert_str);
document.getElementById("alert_msg1").style.display = "";
document.form.http_username.focus();
document.form.http_username.select();
return false;
}else{
document.getElementById("alert_msg1").style.display = "none";
}
document.form.http_username.value = trim(document.form.http_username.value);
if(document.form.http_username.value == "root"
|| document.form.http_username.value == "guest"
|| document.form.http_username.value == "anonymous"
){
showtext(document.getElementById("alert_msg1"), "<#499#>");
document.getElementById("alert_msg1").style.display = "";
document.form.http_username.focus();
document.form.http_username.select();
return false;
}
else if(accounts.getIndexByValue(document.form.http_username.value) > 0
&& document.form.http_username.value != accounts[0]){
showtext(document.getElementById("alert_msg1"), "<#103#>");
document.getElementById("alert_msg1").style.display = "";
document.form.http_username.focus();
document.form.http_username.select();
return false;
}else{
document.getElementById("alert_msg1").style.display = "none";
}
}
if(document.form.http_passwd2.value.length > 0 && document.form.http_passwd2.value.length < 5){
showtext(document.getElementById("alert_msg2"),"* <#147#>");
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
return false;
}
if(document.form.http_passwd2.value != document.form.v_password2.value){
showtext(document.getElementById("alert_msg2"),"* <#105#>");
if(document.form.http_passwd2.value.length <= 0){
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
}else{
document.form.v_password2.focus();
document.form.v_password2.select();
}
return false;
}
if(is_KR_sku){ /* MODELDEP by Territory Code */
if(document.form.http_passwd2.value.length > 0 || document.form.http_passwd2.value.length > 0){
if(!validator.string_KR(document.form.http_passwd2)){
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
return false;
}
}
}
else{
if(!validator.string(document.form.http_passwd2)){
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
return false;
}
}
if(document.form.http_passwd2.value == '<% nvram_default_get("http_passwd"); %>'){
showtext(document.getElementById("alert_msg2"),"* <#279#>");
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
return false;
}
var is_common_string = check_common_string(document.form.http_passwd2.value, "httpd_password");
if(document.form.http_passwd2.value.length > 0 && is_common_string){
if(!confirm("<#136#>")){
document.form.http_passwd2.focus();
document.form.http_passwd2.select();
return false;
}
}
if(!validator.ipAddrFinal(document.form.log_ipaddr, 'log_ipaddr')
|| !validator.string(document.form.ntp_server0)
)
return false;
if((document.form.time_zone_select.value.search("DST") >= 0 || document.form.time_zone_select.value.search("TDT") >= 0) // DST area
&& document.form.dst_start_m.value == document.form.dst_end_m.value
&& document.form.dst_start_w.value == document.form.dst_end_w.value
&& document.form.dst_start_d.value == document.form.dst_end_d.value){
alert("<#1179#>"); //At same day
return false;
}
/*if (!validator.range(document.form.http_lanport, 1, 65535))
return false;*/
if (HTTPS_support && !validator.range(document.form.https_lanport, 1, 65535) && !tmo_support)
return false;
if (document.form.misc_http_x[0].checked) {
if (!validator.range(document.form.misc_httpport_x, 1, 65535))
return false;
if (HTTPS_support && !validator.range(document.form.misc_httpsport_x, 1, 65535))
return false;
}
else{
document.form.misc_httpport_x.value = '<% nvram_get("misc_httpport_x"); %>';
document.form.misc_httpsport_x.value = '<% nvram_get("misc_httpsport_x"); %>';
}
if(document.form.sshd_enable.value != 0){
if (!validator.range(document.form.sshd_port, 1, 65535))
return false;
}
else{
document.form.sshd_port.disabled = true;
}
if((document.form.sshd_enable.value != 0) && (document.form.sshd_authkeys.value.length == 0) && (!document.form.sshd_pass[0].checked)){
alert("You must configure at least one SSH authentication method!");
return false;
}
if(isPortConflict(document.form.misc_httpport_x.value)){
alert(isPortConflict(document.form.misc_httpport_x.value));
document.form.misc_httpport_x.focus();
return false;
}
else if(isPortConflict(document.form.misc_httpsport_x.value) && HTTPS_support){
alert(isPortConflict(document.form.misc_httpsport_x.value));
document.form.misc_httpsport_x.focus();
return false;
}
else if(isPortConflict(document.form.https_lanport.value) && HTTPS_support && !tmo_support){
alert(isPortConflict(document.form.https_lanport.value));
document.form.https_lanport.focus();
return false;
}
else if(document.form.misc_httpsport_x.value == document.form.misc_httpport_x.value && HTTPS_support){
alert("<#1285#>");
document.form.misc_httpsport_x.focus();
return false;
}
else if(!validator.rangeAllowZero(document.form.http_autologout, 10, 999, '<% nvram_get("http_autologout"); %>'))
return false;
if(reboot_schedule_support){
if(!document.form.reboot_date_x_Sun.checked && !document.form.reboot_date_x_Mon.checked &&
!document.form.reboot_date_x_Tue.checked && !document.form.reboot_date_x_Wed.checked &&
!document.form.reboot_date_x_Thu.checked && !document.form.reboot_date_x_Fri.checked &&
!document.form.reboot_date_x_Sat.checked && document.form.reboot_schedule_enable_x[0].checked)
{
alert(Untranslated.filter_lw_date_valid);
document.form.reboot_date_x_Sun.focus();
return false;
}
}
if(document.form.http_passwd2.value.length > 0) //password setting changed
alert("<#1137#>");
return true;
}
function done_validating(action){
refreshpage();
}
function corrected_timezone(){
var today = new Date();
var StrIndex;
if(today.toString().lastIndexOf("-") > 0)
StrIndex = today.toString().lastIndexOf("-");
else if(today.toString().lastIndexOf("+") > 0)
StrIndex = today.toString().lastIndexOf("+");
if(StrIndex > 0){
if(timezone != today.toString().substring(StrIndex, StrIndex+5)){
document.getElementById("timezone_hint").style.display = "block";
document.getElementById("timezone_hint").innerHTML = "* <#1449#>";
}
else
return;
}
else
return;
}
var timezones = [
["UTC12", "(GMT-12:00) <#1973#>"],
["UTC11", "(GMT-11:00) <#1974#>"],
["UTC10", "(GMT-10:00) <#1975#>"],
["NAST9DST", "(GMT-09:00) <#1976#>"],
["PST8DST", "(GMT-08:00) <#1977#>"],
["MST7DST_1", "(GMT-07:00) <#1978#>"],
["MST7_2", "(GMT-07:00) <#1979#>"],
["MST7DST_3", "(GMT-07:00) <#1980#>"],
["CST6_2", "(GMT-06:00) <#1981#>"],
["CST6DST_3", "(GMT-06:00) <#1982#>"],
["CST6DST_3_1", "(GMT-06:00) <#1983#>"],
["UTC6DST", "(GMT-06:00) <#1984#>"],
["EST5DST", "(GMT-05:00) <#1985#>"],
["UTC5_1", "(GMT-05:00) <#1986#>"],
["UTC5_2", "(GMT-05:00) <#1987#>"],
["UTC4.30", "(GMT-04:30) <#1990#>"],
["AST4DST", "(GMT-04:00) <#1988#>"],
["UTC4_1", "(GMT-04:00) <#1989#>"],
["NST3.30DST", "(GMT-03:30) <#1992#>"],
["EBST3DST_1", "(GMT-03:00) <#1993#>"],
["UTC3", "(GMT-03:00) <#1994#>"],
["EBST3DST_2", "(GMT-03:00) <#1995#>"],
["UTC3", "(GMT-03:00) <#1991#>"],
["NORO2DST", "(GMT-02:00) <#1996#>"],
["EUT1DST", "(GMT-01:00) <#1997#>"],
["UTC1", "(GMT-01:00) <#1998#>"],
["GMT0", "(GMT) <#1999#>"],
["GMT0DST_1", "(GMT) <#2000#>"],
["GMT0DST_2", "(GMT) <#2001#>"],
["GMT0_2", "(GMT) <#2002#>"],
["UTC-1DST_1", "(GMT+01:00) <#2003#>"],
["UTC-1DST_1_1","(GMT+01:00) <#2004#>"],
["UTC-1_2", "(GMT+01:00) <#2005#>"],
["UTC-1DST_2", "(GMT+01:00) <#2006#>"],
["MET-1DST", "(GMT+01:00) <#2007#>"],
["MET-1DST_1", "(GMT+01:00) <#2009#>"],
["MEZ-1DST", "(GMT+01:00) <#2010#>"],
["MEZ-1DST_1", "(GMT+01:00) <#2011#>"],
["UTC-1_3", "(GMT+01:00) <#2012#>"],
["UTC-2DST", "(GMT+02:00) <#2013#>"],
["UTC-2DST_3", "(GMT+02:00) <#2008#>"],
["EST-2DST", "(GMT+02:00) <#2014#>"],
["UTC-2DST_4", "(GMT+02:00) <#2015#>"],
["UTC-2DST_2", "(GMT+02:00) <#2018#>"],
["IST-2DST", "(GMT+02:00) <#2019#>"],
["EET-2DST", "(GMT+02:00) <#2021#>"],
["UTC-2_1", "(GMT+02:00) <#2017#>"],
["SAST-2", "(GMT+02:00) <#2020#>"],
["UTC-3_1", "(GMT+03:00) <#2024#>"],
["UTC-3_2", "(GMT+03:00) <#2025#>"],
["UTC-3_3", "(GMT+03:00) <#2016#>"],
["UTC-3_4", "(GMT+03:00) <#2022#>"],
["UTC-3_5", "(GMT+03:00) <#2023#>"],
["IST-3", "(GMT+03:00) <#2026#>"],
["UTC-3.30DST", "(GMT+03:30) <#2027#>"],
["UTC-4_1", "(GMT+04:00) <#2028#>"],
["UTC-4_5", "(GMT+04:00) <#2030#>"],
["UTC-4_4", "(GMT+04:00) <#2029#>"],
["UTC-4DST_2", "(GMT+04:00) <#2031#>"],
["UTC-4.30", "(GMT+04:30) <#2032#>"],
["UTC-5", "(GMT+05:00) <#2034#>"],
["UTC-5_1", "(GMT+05:00) <#2033#>"],
["UTC-5.30_2", "(GMT+05:30) <#2035#>"],
["UTC-5.30_1", "(GMT+05:30) <#2036#>"],
["UTC-5.30", "(GMT+05:30) <#2039#>"],
["UTC-5.45", "(GMT+05:45) <#2037#>"],
["RFT-6", "(GMT+06:00) <#2040#>"],
["UTC-6", "(GMT+06:00) <#2038#>"],
["UTC-6_2", "(GMT+06:00) <#2043#>"],
["UTC-6.30", "(GMT+06:30) <#2041#>"],
["UTC-7", "(GMT+07:00) <#2042#>"],
["UTC-7_2", "(GMT+07:00) <#2044#>"],
["CST-8", "(GMT+08:00) <#2045#>"],
["CST-8_1", "(GMT+08:00) <#2046#>"],
["SST-8", "(GMT+08:00) <#2047#>"],
["CCT-8", "(GMT+08:00) <#2048#>"],
["WAS-8", "(GMT+08:00) <#2049#>"],
["UTC-8", "(GMT+08:00) <#2050#>"],
["UTC-8_1", "(GMT+08:00) <#2051#>"],
["UTC-9_1", "(GMT+09:00) <#2052#>"],
["UTC-9_3", "(GMT+09:00) <#2054#>"],
["JST", "(GMT+09:00) <#2053#>"],
["CST-9.30", "(GMT+09:30) <#2055#>"],
["UTC-9.30DST", "(GMT+09:30) <#2056#>"],
["UTC-10DST_1", "(GMT+10:00) <#2057#>"],
["UTC-10_2", "(GMT+10:00) <#2058#>"],
["UTC-10_4", "(GMT+10:00) <#2060#>"],
["UTC-10_5", "(GMT+10:00) <#2065#>"],
["TST-10TDT", "(GMT+10:00) <#2059#>"],
["UTC-10_5", "(GMT+10:00) <#2061#>"],
["UTC-11", "(GMT+11:00) <#2062#>"],
["UTC-11_1", "(GMT+11:00) <#2063#>"],
["UTC-11_3", "(GMT+11:00) <#2069#>"],
["UTC-12", "(GMT+12:00) <#2064#>"],
["UTC-12_2", "(GMT+12:00) <#2068#>"],
["NZST-12DST", "(GMT+12:00) <#2066#>"],
["UTC-13", "(GMT+13:00) <#2067#>"]];
function load_timezones(){
free_options(document.form.time_zone_select);
for(var i = 0; i < timezones.length; i++){
add_option(document.form.time_zone_select,
timezones[i][1], timezones[i][0],
(document.form.time_zone.value == timezones[i][0]));
}
select_time_zone();
}
var dst_month = new Array("", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12");
var dst_week = new Array("", "1st", "2nd", "3rd", "4th", "5th");
var dst_day = new Array("<#914#>", "<#912#>", "<#916#>", "<#917#>", "<#915#>", "<#911#>", "<#913#>");
var dst_hour = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12",
"13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23");
var dstoff_start_m,dstoff_start_w,dstoff_start_d,dstoff_start_h;
var dstoff_end_m,dstoff_end_w,dstoff_end_d,dstoff_end_h;
function parse_dstoffset(){ //Mm.w.d/h,Mm.w.d/h
if(dstoffset){
var dstoffset_startend = dstoffset.split(",");
var dstoffset_start = dstoffset_startend[0];
var dstoff_start = dstoffset_start.split(".");
dstoff_start_m = dstoff_start[0];
dstoff_start_w = dstoff_start[1];
dstoff_start_d = dstoff_start[2].split("/")[0];
dstoff_start_h = dstoff_start[2].split("/")[1];
var dstoffset_end = dstoffset_startend[1];
var dstoff_end = dstoffset_end.split(".");
dstoff_end_m = dstoff_end[0];
dstoff_end_w = dstoff_end[1];
dstoff_end_d = dstoff_end[2].split("/")[0];
dstoff_end_h = dstoff_end[2].split("/")[1];
}
}
function load_dst_m_Options(){
free_options(document.form.dst_start_m);
free_options(document.form.dst_end_m);
for(var i = 1; i < dst_month.length; i++){
if(!dstoffset){ //none time_zone_dstoff
if(i==3){
add_option(document.form.dst_start_m, dst_month[i], i, 1);
add_option(document.form.dst_end_m, dst_month[i], i, 0);
}else if(i==10){
add_option(document.form.dst_start_m, dst_month[i], i, 0);
add_option(document.form.dst_end_m, dst_month[i], i, 1);
}else{
add_option(document.form.dst_start_m, dst_month[i], i, 0);
add_option(document.form.dst_end_m, dst_month[i], i, 0);
}
}
else{ // exist time_zone_dstoff
if(dstoff_start_m == 'M'+i)
add_option(document.form.dst_start_m, dst_month[i], i, 1);
else
add_option(document.form.dst_start_m, dst_month[i], i, 0);
if(dstoff_end_m == 'M'+i)
add_option(document.form.dst_end_m, dst_month[i], i, 1);
else
add_option(document.form.dst_end_m, dst_month[i], i, 0);
}
}
}
function load_dst_w_Options(){
free_options(document.form.dst_start_w);
free_options(document.form.dst_end_w);
for(var i = 1; i < dst_week.length; i++){
if(!dstoffset){ //none time_zone_dstoff
if(i==2){
add_option(document.form.dst_start_w, dst_week[i], i, 1);
add_option(document.form.dst_end_w, dst_week[i], i, 1);
}else{
add_option(document.form.dst_start_w, dst_week[i], i, 0);
add_option(document.form.dst_end_w, dst_week[i], i, 0);
}
}
else{ //exist time_zone_dstoff
if(dstoff_start_w == i)
add_option(document.form.dst_start_w, dst_week[i], i, 1);
else
add_option(document.form.dst_start_w, dst_week[i], i, 0);
if(dstoff_end_w == i)
add_option(document.form.dst_end_w, dst_week[i], i, 1);
else
add_option(document.form.dst_end_w, dst_week[i], i, 0);
}
}
}
function load_dst_d_Options(){
free_options(document.form.dst_start_d);
free_options(document.form.dst_end_d);
for(var i = 0; i < dst_day.length; i++){
if(!dstoffset){ //none dst_offset
if(i==0){
add_option(document.form.dst_start_d, dst_day[i], i, 1);
add_option(document.form.dst_end_d, dst_day[i], i, 1);
}else{
add_option(document.form.dst_start_d, dst_day[i], i, 0);
add_option(document.form.dst_end_d, dst_day[i], i, 0);
}
}else{
if(dstoff_start_d == i)
add_option(document.form.dst_start_d, dst_day[i], i, 1);
else
add_option(document.form.dst_start_d, dst_day[i], i, 0);
if(dstoff_end_d == i)
add_option(document.form.dst_end_d, dst_day[i], i, 1);
else
add_option(document.form.dst_end_d, dst_day[i], i, 0);
}
}
}
function load_dst_h_Options(){
free_options(document.form.dst_start_h);
free_options(document.form.dst_end_h);
for(var i = 0; i < dst_hour.length; i++){
if(!dstoffset){ //none dst_offset
if(i==2){
add_option(document.form.dst_start_h, dst_hour[i], i, 1);
add_option(document.form.dst_end_h, dst_hour[i], i, 1);
}else{
add_option(document.form.dst_start_h, dst_hour[i], i, 0);
add_option(document.form.dst_end_h, dst_hour[i], i, 0);
}
}else{
if(dstoff_start_h == i)
add_option(document.form.dst_start_h, dst_hour[i], i, 1);
else
add_option(document.form.dst_start_h, dst_hour[i], i, 0);
if(dstoff_end_h == i)
add_option(document.form.dst_end_h, dst_hour[i], i, 1);
else
add_option(document.form.dst_end_h, dst_hour[i], i, 0);
}
}
}
function hide_https_lanport(_value){
if(tmo_support){
document.getElementById("https_lanport").style.display = "none";
return false;
}
if(sw_mode == '1' || sw_mode == '2'){
var https_lanport_num = "<% nvram_get("https_lanport"); %>";
document.getElementById("https_lanport").style.display = (_value == "0") ? "none" : "";
document.form.https_lanport.value = "<% nvram_get("https_lanport"); %>";
document.getElementById("https_access_page").innerHTML = "<#1284#> ";
document.getElementById("https_access_page").innerHTML += "<a href=\"https://"+theUrl+":"+https_lanport_num+"\" target=\"_blank\" style=\"color:#FC0;text-decoration: underline; font-family:Lucida Console;\">http<span>s</span>://"+theUrl+"<span>:"+https_lanport_num+"</span></a>";
document.getElementById("https_access_page").style.display = (_value == "0") ? "none" : "";
}
else{
document.getElementById("https_access_page").style.display = 'none';
}
}
function hide_https_wanport(_value){
document.getElementById("http_port").style.display = (_value == "1") ? "none" : "";
document.getElementById("https_port").style.display = (_value == "0") ? "none" : "";
}
function show_http_clientlist(){
var http_clientlist_row = http_clientlist_array.split('<');
var code = "";
code +='<table width="100%" border="1" cellspacing="0" cellpadding="4" align="center" class="list_table" id="http_clientlist_table">';
if(http_clientlist_row.length == 1)
code +='<tr><td style="color:#FFCC00;"><#1324#></td>';
else{
for(var i =1; i < http_clientlist_row.length; i++){
code +='<tr id="row'+i+'">';
code +='<td width="80%">'+ http_clientlist_row[i] +'</td>'; //Url keyword
code +='<td width="20%">';
code +="<input class=\"remove_btn\" type=\"button\" onclick=\"deleteRow(this);\" value=\"\"/></td>";
}
}
code +='</tr></table>';
document.getElementById("http_clientlist_Block").innerHTML = code;
}
function check_Timefield_checkbox(){ // To check Date checkbox checked or not and control Time field disabled or not
if( document.form.reboot_date_x_Sun.checked == true
|| document.form.reboot_date_x_Mon.checked == true
|| document.form.reboot_date_x_Tue.checked == true
|| document.form.reboot_date_x_Wed.checked == true
|| document.form.reboot_date_x_Thu.checked == true
|| document.form.reboot_date_x_Fri.checked == true
|| document.form.reboot_date_x_Sat.checked == true ){
inputCtrl(document.form.reboot_time_x_hour,1);
inputCtrl(document.form.reboot_time_x_min,1);
document.form.reboot_schedule.disabled = false;
}
else{
inputCtrl(document.form.reboot_time_x_hour,0);
inputCtrl(document.form.reboot_time_x_min,0);
document.form.reboot_schedule.disabled = true;
document.getElementById('reboot_schedule_time_tr').style.display ="";
}
}
function deleteRow(r){
var i=r.parentNode.parentNode.rowIndex;
document.getElementById('http_clientlist_table').deleteRow(i);
var http_clientlist_value = "";
for(i=0; i<document.getElementById('http_clientlist_table').rows.length; i++){
http_clientlist_value += "<";
http_clientlist_value += document.getElementById('http_clientlist_table').rows[i].cells[0].innerHTML;
}
http_clientlist_array = http_clientlist_value;
if(http_clientlist_array == "")
show_http_clientlist();
}
function addRow(obj, upper){
if('<% nvram_get("http_client"); %>' != "1")
document.form.http_client[0].checked = true;
var rule_num = document.getElementById('http_clientlist_table').rows.length;
var item_num = document.getElementById('http_clientlist_table').rows[0].cells.length;
if(rule_num >= upper){
alert("<#1369#> " + upper + " <#1370#>");
return false;
}
if(obj.value == ""){
alert("<#140#>");
obj.focus();
obj.select();
return false;
}
else if(validator.validIPForm(obj, 2) != true){
return false;
}
else{
for(i=0; i<rule_num; i++){
for(j=0; j<item_num-1; j++){ //only 1 value column
if(obj.value == document.getElementById('http_clientlist_table').rows[i].cells[j].innerHTML){
alert("<#1363#>");
return false;
}
}
}
http_clientlist_array += "<";
http_clientlist_array += obj.value;
obj.value = "";
show_http_clientlist();
}
}
function keyBoardListener(evt){
var nbr = (window.evt)?event.keyCode:event.which;
if(nbr == 13)
addRow(document.form.http_client_ip_x_0, 4);
}
function setClientIP(ipaddr){
document.form.http_client_ip_x_0.value = ipaddr;
hideClients_Block();
}
function hideClients_Block(){
document.getElementById("pull_arrow").src = "/images/arrow-down.gif";
document.getElementById('ClientList_Block_PC').style.display='none';
}
function pullLANIPList(obj){
var element = document.getElementById('ClientList_Block_PC');
var isMenuopen = element.offsetWidth > 0 || element.offsetHeight > 0;
if(isMenuopen == 0){
obj.src = "/images/arrow-top.gif"
element.style.display = 'block';
document.form.http_client_ip_x_0.focus();
}
else
hideClients_Block();
}
function hideport(flag){
document.getElementById("accessfromwan_port").style.display = (flag == 1) ? "" : "none";
document.getElementById("NSlookup_help_for_WAN_access").style.display = (flag == 1) ? "" : "none";
}
function change_url(num, flag){
if(flag == 'https_lan'){
var https_lanport_num_new = num;
document.getElementById("https_access_page").innerHTML = "<#1284#> ";
document.getElementById("https_access_page").innerHTML += "<a href=\"https://"+theUrl+":"+https_lanport_num_new+"\" target=\"_blank\" style=\"color:#FC0;text-decoration: underline; font-family:Lucida Console;\">http<span>s</span>://"+theUrl+"<span>:"+https_lanport_num_new+"</span></a>";
}else{
}
}
/* password item show or not */
function pass_checked(obj){
switchType(obj, document.form.show_pass_1.checked, true);
}
function select_time_zone(){
if(document.form.time_zone_select.value.search("DST") >= 0 || document.form.time_zone_select.value.search("TDT") >= 0){ //DST area
document.form.time_zone_dst.value=1;
document.getElementById("dst_changes_start").style.display="";
document.getElementById("dst_changes_end").style.display="";
document.getElementById("dst_start").style.display="";
document.getElementById("dst_end").style.display="";
}
else{
document.form.time_zone_dst.value=0;
document.getElementById("dst_changes_start").style.display="none";
document.getElementById("dst_changes_end").style.display="none";
document.getElementById("dst_start").style.display="none";
document.getElementById("dst_end").style.display="none";
}
}
function clean_scorebar(obj){
if(obj.value == "")
document.getElementById("scorebarBorder").style.display = "none";
}
function check_sshd_enable(obj_value){
var state;
if (obj_value != 0)
state = "";
else
state = "none";
document.getElementById("remote_forwarding_tr").style.display = state;
document.getElementById("auth_keys_tr").style.display = state;
document.getElementById("sshd_bfp_field").style.display = state;
document.getElementById("sshd_password_tr").style.display = state;
document.getElementById("sshd_port_tr").style.display = state;
}
/*function sshd_remote_access(obj_value){
if(obj_value == 1){
document.getElementById('remote_access_port_tr').style.display = "";
}
else{
document.getElementById('remote_access_port_tr').style.display = "none";
}
}*/
/*function sshd_forward(obj_value){
if(obj_value == 1){
document.getElementById('remote_forwarding_port_tr').style.display = "";
}
else{
document.getElementById('remote_forwarding_port_tr').style.display = "none";
}
}*/
function display_spec_IP(flag){
if(flag == 0){
document.getElementById("http_client_table").style.display = "none";
document.getElementById("http_clientlist_Block").style.display = "none";
}
else{
document.getElementById("http_client_table").style.display = "";
document.getElementById("http_clientlist_Block").style.display = "";
setTimeout("showDropdownClientList('setClientIP', 'ip', 'all', 'ClientList_Block_PC', 'pull_arrow', 'online');", 1000);
}
}
function hide_reboot_option(flag){
document.getElementById("reboot_schedule_date_tr").style.display = (flag == 1) ? "" : "none";
document.getElementById("reboot_schedule_time_tr").style.display = (flag == 1) ? "" : "none";
if(flag==1)
check_Timefield_checkbox();
}
function getrebootTimeRange(str, pos)
{
if (pos == 0)
return str.substring(7,9);
else if (pos == 1)
return str.substring(9,11);
}
function setrebootTimeRange(rd, rh, rm)
{
return(rd.value+rh.value+rm.value);
}
function updateDateTime()
{
if(document.form.reboot_schedule_enable_x[0].checked){
document.form.reboot_schedule_enable.value = "1";
document.form.reboot_schedule.disabled = false;
document.form.reboot_schedule.value = setDateCheck(
document.form.reboot_date_x_Sun,
document.form.reboot_date_x_Mon,
document.form.reboot_date_x_Tue,
document.form.reboot_date_x_Wed,
document.form.reboot_date_x_Thu,
document.form.reboot_date_x_Fri,
document.form.reboot_date_x_Sat);
document.form.reboot_schedule.value = setrebootTimeRange(
document.form.reboot_schedule,
document.form.reboot_time_x_hour,
document.form.reboot_time_x_min);
}
else
document.form.reboot_schedule_enable.value = "0";
}
function paste_password(){
document.form.show_pass_1.checked = true;
pass_checked(document.form.http_passwd2);
pass_checked(document.form.v_password2);
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_System_Content.asp">
<input type="hidden" name="next_page" value="Advanced_System_Content.asp">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="flag" value="">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="action_script" value="restart_time;restart_httpd;restart_upnp">
<input type="hidden" name="first_time" value="">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<input type="hidden" name="time_zone_dst" value="<% nvram_get("time_zone_dst"); %>">
<input type="hidden" name="time_zone" value="<% nvram_get("time_zone"); %>">
<input type="hidden" name="time_zone_dstoff" value="<% nvram_get("time_zone_dstoff"); %>">
<input type="hidden" name="http_passwd" value="" disabled>
<input type="hidden" name="http_clientlist" value="<% nvram_get("http_clientlist"); %>">
<input type="hidden" name="btn_ez_mode" value="<% nvram_get("btn_ez_mode"); %>">
<input type="hidden" name="reboot_schedule" value="<% nvram_get_x("","reboot_schedule"); %>" disabled>
<input type="hidden" name="reboot_schedule_enable" value="<% nvram_get_x("","reboot_schedule_enable"); %>">
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
<td valign="top">
<table width="760px" border="0" cellpadding="4" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle"><#215#> - <#218#></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc"><#1923#></div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2"><#1679#></td>
</tr>
</thead>
<tr>
<th width="40%"><#469#></th>
<td>
<div><input type="text" id="http_username" name="http_username" tabindex="1" autocomplete="off" style="height:25px;" class="input_18_table" maxlength="20" autocorrect="off" autocapitalize="off"><br/><span id="alert_msg1" style="color:#FC0;margin-left:8px;"></span></div>
</td>
</tr>
<tr>
<th width="40%"><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,4)"><#260#></a></th>
<td>
<input type="password" autocomplete="new-password" name="http_passwd2" tabindex="2" onKeyPress="return validator.isString(this, event);" onkeyup="chkPass(this.value, 'http_passwd');" onpaste="setTimeout('paste_password();', 10)" class="input_18_table" maxlength="16" onBlur="clean_scorebar(this);" autocorrect="off" autocapitalize="off"/>
&nbsp;&nbsp;
<div id="scorebarBorder" style="margin-left:180px; margin-top:-25px; display:none;" title="<#170#>">
<div id="score"></div>
<div id="scorebar">&nbsp;</div>
</div>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,4)"><#261#></a></th>
<td>
<input type="password" autocomplete="new-password" name="v_password2" tabindex="3" onKeyPress="return validator.isString(this, event);" onpaste="setTimeout('paste_password();', 10)" class="input_18_table" maxlength="16" autocorrect="off" autocapitalize="off"/>
<div style="margin:-25px 0px 5px 175px;"><input type="checkbox" name="show_pass_1" onclick="pass_checked(document.form.http_passwd2);pass_checked(document.form.v_password2);"><#377#></div>
<span id="alert_msg2" style="color:#FC0;margin-left:8px;"></span>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<thead>
<tr>
<td colspan="2">Persistent JFFS2 partition</td>
</tr>
</thead>
<tr>
<th>Format JFFS partition at next boot</th>
<td>
<input type="radio" name="jffs2_format" class="input" value="1" <% nvram_match("jffs2_format", "1", "checked"); %>><#66#>
<input type="radio" name="jffs2_format" class="input" value="0" <% nvram_match("jffs2_format", "0", "checked"); %>><#65#>
</td>
</tr>
<tr>
<th>Enable JFFS custom scripts and configs</th>
<td>
<input type="radio" name="jffs2_scripts" class="input" value="1" <% nvram_match("jffs2_scripts", "1", "checked"); %>><#66#>
<input type="radio" name="jffs2_scripts" class="input" value="0" <% nvram_match("jffs2_scripts", "0", "checked"); %>><#65#>
</td>
</tr>
</table>
<table id="ssh_table" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="margin-top:8px;">
<thead>
<tr>
<td colspan="2">SSH Daemon</td>
</tr>
</thead>
<tr>
<th>Enable SSH</th>
<td>
<select name="sshd_enable" class="input_option" onchange="check_sshd_enable(this.value);">
<option value="0" <% nvram_match("sshd_enable", "0", "selected"); %>><#65#></option>
<option value="1" <% nvram_match("sshd_enable", "1", "selected"); %>>LAN + WAN</option>
<option value="2" <% nvram_match("sshd_enable", "2", "selected"); %>>LAN only</option>
</select>
</td>
</tr>
<tr id="remote_forwarding_tr">
<th>Allow SSH Port Forwarding</th>
<td>
<input type="radio" name="sshd_forwarding" class="input" value="1" <% nvram_match("sshd_forwarding", "1", "checked"); %>><#66#>
<input type="radio" name="sshd_forwarding" class="input" value="0" <% nvram_match("sshd_forwarding", "0", "checked"); %>><#65#>
</td>
</tr>
<tr id="sshd_port_tr">
<th>SSH service port</th>
<td>
<input type="text" class="input_6_table" maxlength="5" name="sshd_port" onKeyPress="return validator.isNumber(this,event);" onblur="validate_number_range(this, 1, 65535)" value='<% nvram_get("sshd_port"); %>' autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr id="sshd_password_tr">
<th>Allow SSH password login</th>
<td>
<input type="radio" name="sshd_pass" class="input" value="1" <% nvram_match("sshd_pass", "1", "checked"); %>><#66#>
<input type="radio" name="sshd_pass" class="input" value="0" <% nvram_match("sshd_pass", "0", "checked"); %>><#65#>
</td>
</tr>
<tr id="sshd_bfp_field">
<th>Enable SSH Brute Force Protection</th>
<td>
<input type="radio" name="sshd_bfp" class="input" value="1" <% nvram_match("sshd_bfp", "1", "checked"); %>><#66#>
<input type="radio" name="sshd_bfp" class="input" value="0" <% nvram_match("sshd_bfp", "0", "checked"); %>><#65#>
</td>
</tr>
<tr id="auth_keys_tr">
<th>SSH Authentication key</th>
<td>
<textarea rows="8" class="textarea_ssh_table" name="sshd_authkeys" style="width:95%;" maxlength="3499"><% nvram_clean_get("sshd_authkeys"); %></textarea>
<span id="ssh_alert_msg"></span>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="margin-top:8px;">
<thead>
<tr>
<td colspan="2">Logging</td>
</tr>
</thead>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,1)"><#1447#></a></th>
<td><input type="text" maxlength="15" class="input_15_table" name="log_ipaddr" value="<% nvram_get("log_ipaddr"); %>" onKeyPress="return validator.isIPAddr(this, event)" autocorrect="off" autocapitalize="off"></td>
</tr>
<tr>
<th>Default message log level</th>
<td>
<select name="message_loglevel" class="input_option">
<option value="0" <% nvram_match("message_loglevel", "0", "selected"); %>>emergency</option>
<option value="1" <% nvram_match("message_loglevel", "1", "selected"); %>>alert</option>
<option value="2" <% nvram_match("message_loglevel", "2", "selected"); %>>critical</option>
<option value="3" <% nvram_match("message_loglevel", "3", "selected"); %>>error</option>
<option value="4" <% nvram_match("message_loglevel", "4", "selected"); %>>warning</option>
<option value="5" <% nvram_match("message_loglevel", "5", "selected"); %>>notice</option>
<option value="6" <% nvram_match("message_loglevel", "6", "selected"); %>>info</option>
<option value="7" <% nvram_match("message_loglevel", "7", "selected"); %>>debug</option>
</select>
</td>
</tr>
<tr>
<th>Log only messages more urgent than</th>
<td>
<select name="log_level" class="input_option">
<option value="1" <% nvram_match("log_level", "1", "selected"); %>>alert</option>
<option value="2" <% nvram_match("log_level", "2", "selected"); %>>critical</option>
<option value="3" <% nvram_match("log_level", "3", "selected"); %>>error</option>
<option value="4" <% nvram_match("log_level", "4", "selected"); %>>warning</option>
<option value="5" <% nvram_match("log_level", "5", "selected"); %>>notice</option>
<option value="6" <% nvram_match("log_level", "6", "selected"); %>>info</option>
<option value="7" <% nvram_match("log_level", "7", "selected"); %>>debug</option>
<option value="8" <% nvram_match("log_level", "8", "selected"); %>>all</option>
</select>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="margin-top:8px;">
<thead>
<tr>
<td colspan="2"><#1926#></td>
</tr>
</thead>
<tr id="btn_ez_radiotoggle_tr">
<th><#2392#></th>
<td>
<input type="radio" name="btn_ez_radiotoggle" id="turn_WPS" class="input" style="display:none;" value="0"><label for="turn_WPS"><#2391#></label>
<input type="radio" name="btn_ez_radiotoggle" id="turn_WiFi" class="input" style="display:none;" value="1" <% nvram_match_x("", "btn_ez_radiotoggle", "1", "checked"); %>><label for="turn_WiFi" id="turn_WiFi_str"><#2393#></label>
<input type="radio" name="btn_ez_radiotoggle" id="turn_LED" class="input" style="display:none;" value="0" <% nvram_match_x("", "btn_ez_mode", "1", "checked"); %>><label for="turn_LED" id="turn_LED_str">Turn LED On/Off</label>
</td>
</tr>
<tr id="reboot_schedule_enable_tr">
<th>Enable Reboot Scheduler</th> <td>
<input type="radio" value="1" name="reboot_schedule_enable_x" onClick="hide_reboot_option(1);" <% nvram_match_x("LANHostConfig","reboot_schedule_enable", "1", "checked"); %>><#66#>
<input type="radio" value="0" name="reboot_schedule_enable_x" onClick="hide_reboot_option(0);" <% nvram_match_x("LANHostConfig","reboot_schedule_enable", "0", "checked"); %>><#65#>
</td>
</tr>
<tr id="reboot_schedule_date_tr">
<th>Date to Reboot</th> <td>
<input type="checkbox" name="reboot_date_x_Sun" class="input" onclick="check_Timefield_checkbox();"><#914#>
<input type="checkbox" name="reboot_date_x_Mon" class="input" onclick="check_Timefield_checkbox();"><#912#>
<input type="checkbox" name="reboot_date_x_Tue" class="input" onclick="check_Timefield_checkbox();"><#916#>
<input type="checkbox" name="reboot_date_x_Wed" class="input" onclick="check_Timefield_checkbox();"><#917#>
<input type="checkbox" name="reboot_date_x_Thu" class="input" onclick="check_Timefield_checkbox();"><#915#>
<input type="checkbox" name="reboot_date_x_Fri" class="input" onclick="check_Timefield_checkbox();"><#911#>
<input type="checkbox" name="reboot_date_x_Sat" class="input" onclick="check_Timefield_checkbox();"><#913#>
</td>
</tr>
<tr id="reboot_schedule_time_tr">
<th>Time of Day to Reboot</th> <td>
<input type="text" maxlength="2" class="input_3_table" name="reboot_time_x_hour" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 0);" autocorrect="off" autocapitalize="off"> :
<input type="text" maxlength="2" class="input_3_table" name="reboot_time_x_min" onKeyPress="return validator.isNumber(this,event);" onblur="validator.timeRange(this, 1);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,2)"><#1450#></a></th>
<td>
<select name="time_zone_select" class="input_option" onchange="select_time_zone();"></select>
<div>
<span id="timezone_hint" style="display:none;"></span>
</div>
</td>
</tr>
<tr id="dst_changes_start" style="display:none;">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,7)"><#1451#></a></th>
<td>
<div id="dst_start" style="color:white;display:none;">
<div>
<select name="dst_start_m" class="input_option"></select>&nbsp;<#1595#> &nbsp;
<select name="dst_start_w" class="input_option"></select>&nbsp;
<select name="dst_start_d" class="input_option"></select>&nbsp;<#972#> & <#918#> &nbsp;
<select name="dst_start_h" class="input_option"></select>&nbsp;<#1260#> &nbsp;
</div>
</div>
</td>
</tr>
<tr id="dst_changes_end" style="display:none;">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,8)"><#1452#></a></th>
<td>
<div id="dst_end" style="color:white;display:none;">
<div>
<select name="dst_end_m" class="input_option"></select>&nbsp;<#1595#> &nbsp;
<select name="dst_end_w" class="input_option"></select>&nbsp;
<select name="dst_end_d" class="input_option"></select>&nbsp;<#972#> & <#918#> &nbsp;
<select name="dst_end_h" class="input_option"></select>&nbsp;<#1260#> &nbsp;
</div>
</div>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,3)"><#1444#></a></th>
<td>
<input type="text" maxlength="256" class="input_32_table" name="ntp_server0" value="<% nvram_get("ntp_server0"); %>" onKeyPress="return validator.isString(this, event);" autocorrect="off" autocapitalize="off">
<a href="javascript:openLink('x_NTPServer1')" name="x_NTPServer1_link" style=" margin-left:5px; text-decoration: underline;"><#1445#></a>
<div id="svc_hint_div" style="display:none;"><span style="color:#FFCC00;"><#115#></span></div>
</td>
</tr>
<tr id="telnet_tr">
<th><#1055#></th>
<td>
<input type="radio" name="telnetd_enable" class="input" value="1" <% nvram_match("telnetd_enable", "1", "checked"); %>><#66#>
<input type="radio" name="telnetd_enable" class="input" value="0" <% nvram_match("telnetd_enable", "0", "checked"); %>><#65#>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable" style="margin-top:8px;">
<thead>
<tr>
<td colspan="2">Web interface</td>
</tr>
</thead>
<tr id="https_tr">
<th><#2239#></th>
<td>
<select name="http_enable" class="input_option" onchange="hide_https_lanport(this.value);hide_https_wanport(this.value);">
<option value="0" <% nvram_match("http_enable", "0", "selected"); %>>HTTP</option>
<option value="1" <% nvram_match("http_enable", "1", "selected"); %>>HTTPS</option>
<option value="2" <% nvram_match("http_enable", "2", "selected"); %>>BOTH</option>
</select>
</td>
</tr>
<tr id="https_lanport">
<th>HTTPS Lan port</th>
<td>
<input type="text" maxlength="5" class="input_6_table" name="https_lanport" value="<% nvram_get("https_lanport"); %>" onKeyPress="return validator.isNumber(this,event);" onBlur="change_url(this.value, 'https_lan');" autocorrect="off" autocapitalize="off">
<span id="https_access_page"></span>
</td>
</tr>
<tr id="misc_http_x_tr">
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,2);"><#1191#></a></th>
<td>
<input type="radio" value="1" name="misc_http_x" class="input" onClick="hideport(1);return change_common_radio(this, 'FirewallConfig', 'misc_http_x', '1')" <% nvram_match("misc_http_x", "1", "checked"); %>><#66#>
<input type="radio" value="0" name="misc_http_x" class="input" onClick="hideport(0);return change_common_radio(this, 'FirewallConfig', 'misc_http_x', '0')" <% nvram_match("misc_http_x", "0", "checked"); %>><#65#><br>
<div class="formfontdesc" id="NSlookup_help_for_WAN_access" style="color:#FFCC00;display:none;"><#1655#></div>
</td>
</tr>
<tr id="accessfromwan_port">
<th align="right"><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,3);"><#1193#></a></th>
<td>
<span style="margin-left:5px;" id="http_port">HTTP: <input type="text" maxlength="5" name="misc_httpport_x" class="input_6_table" value="<% nvram_get("misc_httpport_x"); %>" onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/>&nbsp;&nbsp;</span>
<span style="margin-left:5px;" id="https_port">HTTPS: <input type="text" maxlength="5" name="misc_httpsport_x" class="input_6_table" value="<% nvram_get("misc_httpsport_x"); %>" onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"/></span>
</td>
</tr>
<tr>
<th><#487#></th>
<td>
<input type="text" class="input_3_table" maxlength="3" name="http_autologout" value='<% nvram_get("http_autologout"); %>' onKeyPress="return validator.isNumber(this,event);" autocorrect="off" autocapitalize="off"> <#1514#>
<span>(<#2417#>)</span>
</td>
</tr>
<tr>
<th align="right"><a class="hintstyle" href="javascript:void(0);" onClick="openHint(11,6);"><#1061#></a></th>
<td>
<input type="radio" name="nat_redirect_enable" class="input" value="1" <% nvram_match_x("","nat_redirect_enable","1", "checked"); %> ><#66#>
<input type="radio" name="nat_redirect_enable" class="input" value="0" <% nvram_match_x("","nat_redirect_enable","0", "checked"); %> ><#65#>
</td>
</tr>
<tr>
<th>Redirect webui access to router.asus.com</th>
<td>
<input type="radio" name="http_dut_redir" class="input" value="1" <% nvram_match_x("","http_dut_redir","1", "checked"); %> ><#66#>
<input type="radio" name="http_dut_redir" class="input" value="0" <% nvram_match_x("","http_dut_redir","0", "checked"); %> ><#65#>
</td>
</tr>
<tr>
<th><#491#></th>
<td>
<input type="radio" name="http_client" class="input" value="1" onclick="display_spec_IP(1);" <% nvram_match_x("", "http_client", "1", "checked"); %>><#66#>
<input type="radio" name="http_client" class="input" value="0" onclick="display_spec_IP(0);" <% nvram_match_x("", "http_client", "0", "checked"); %>><#65#>
</td>
</tr>
</table>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" class="FormTable_table" id="http_client_table">
<thead>
<tr>
<td colspan="4"><#492#>&nbsp;(<#1473#>&nbsp;4)</td>
</tr>
</thead>
<tr>
<th width="80%"><#872#></th>
<th width="20%"><#1472#></th>
</tr>
<tr>
<td width="80%">
<input type="text" class="input_32_table" maxlength="18" name="http_client_ip_x_0" onKeyPress="" onClick="hideClients_Block();" autocorrect="off" autocapitalize="off">
<img id="pull_arrow" height="14px;" src="/images/arrow-down.gif" style="position:absolute;*margin-left:-3px;*margin-top:1px;" onclick="pullLANIPList(this);" title="<#1807#>">
<div id="ClientList_Block_PC" class="clientlist_dropdown" style="margin-left:122px;width:345px;"></div>
</td>
<td width="20%">
<input class="add_btn" type="button" onClick="addRow(document.form.http_client_ip_x_0, 4);" value="">
</td>
</tr>
</table>
<div id="http_clientlist_Block"></div>
<div class="apply_gen">
<input name="button" type="button" class="button_gen" onclick="applyRule();" value="<#73#>"/>
</div>
</td>
</tr>
</tbody>
</table></td>
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


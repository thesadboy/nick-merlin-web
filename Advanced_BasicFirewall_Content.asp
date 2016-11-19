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
<title><#548#> - <#188#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" language="JavaScript" src="/help.js"></script>
<script type="text/javascript" language="JavaScript" src="/validator.js"></script>
<script>
var firewall_enable = '<% nvram_get("fw_enable_x"); %>';
function initial(){
show_menu();
change_firewall(firewall_enable);
if(WebDav_support){
hideAll(1);
}
}
function hideAll(_value){
/* not allow user to change HTTP/HTTPS port */
return false;
document.getElementById("st_webdav_mode_tr").style.display = (_value == 0) ? "none" : "";
document.getElementById("webdav_http_port_tr").style.display = (_value == 0) ? "none" : "";
document.getElementById("webdav_https_port_tr").style.display = (_value == 0) ? "none" : "";
if(_value != 0)
showPortItem(document.form.st_webdav_mode.value);
}
function showPortItem(_value){
if(_value == 0){
document.getElementById("webdav_http_port_tr").style.display = "";
document.form.webdav_http_port.disabled = false;
document.getElementById("webdav_https_port_tr").style.display = "none";
document.form.webdav_https_port.disabled = true;
}
else if(_value == 1){
document.getElementById("webdav_http_port_tr").style.display = "none";
document.form.webdav_http_port.disabled = true;
document.getElementById("webdav_https_port_tr").style.display = "";
document.form.webdav_https_port.disabled = false;
}
else{
document.getElementById("webdav_http_port_tr").style.display = "";
document.form.webdav_http_port.disabled = false;
document.getElementById("webdav_https_port_tr").style.display = "";
document.form.webdav_https_port.disabled = false;
}
}
function applyRule(){
inputRCtrl1(document.form.misc_ping_x, 1);
showLoading();
document.form.submit();
}
function hideport(flag){
document.getElementById("accessfromwan_port").style.display = (flag == 1) ? "" : "none";
}
function done_validating(action){
refreshpage();
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="productid" value="<% nvram_get("productid"); %>">
<input type="hidden" name="current_page" value="Advanced_BasicFirewall_Content.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_wait" value="5">
<input type="hidden" name="action_mode" value="apply">
<input type="hidden" name="action_script" value="restart_firewall">
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
<td valign="top" >
<table width="760px" border="0" cellpadding="5" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle"><#209#> - <#188#></div>
<div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
<div class="formfontdesc"><#1140#></div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,6);"><#1147#></a></th>
<td>
<input type="radio" value="1" name="fw_enable_x" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_enable_x', '1')" <% nvram_match("fw_enable_x", "1", "checked"); %>><#66#>
<input type="radio" value="0" name="fw_enable_x" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_enable_x', '0')" <% nvram_match("fw_enable_x", "0", "checked"); %>><#65#>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,7);"><#1145#></a></th>
<td>
<input type="radio" value="1" name="fw_dos_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_dos_x', '1')" <% nvram_match("fw_dos_x", "1", "checked"); %>><#66#>
<input type="radio" value="0" name="fw_dos_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'fw_dos_x', '0')" <% nvram_match("fw_dos_x", "0", "checked"); %>><#65#>
</td>
</tr>
<tr>
<th align="right"><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,1);"><#1185#></a></th>
<td>
<select name="fw_log_x" class="input_option">
<option value="none" <% nvram_match("fw_log_x", "none","selected"); %>><#553#></option>
<option value="drop" <% nvram_match("fw_log_x", "drop","selected"); %>>Dropped</option>
<option value="accept" <% nvram_match("fw_log_x", "accept","selected"); %>>Accepted</option>
<option value="both" <% nvram_match("fw_log_x", "both","selected"); %>>Both</option>
</select>
</td>
</tr>
<tr>
<th><a class="hintstyle" href="javascript:void(0);" onClick="openHint(8,5);"><#1189#></a></th>
<td>
<input type="radio" value="1" name="misc_ping_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'misc_ping_x', '1')" <% nvram_match("misc_ping_x", "1", "checked"); %>><#66#>
<input type="radio" value="0" name="misc_ping_x" class="input" onClick="return change_common_radio(this, 'FirewallConfig', 'misc_ping_x', '0')" <% nvram_match("misc_ping_x", "0", "checked"); %>><#65#>
</td>
</tr>
<tr id="st_webdav_mode_tr" style="display:none;">
<th width="40%">Cloud Disk Configure</th>
<td>
<select name="st_webdav_mode" class="input_option" onChange="showPortItem(this.value);">
<option value="0" <% nvram_match("st_webdav_mode", "0", "selected"); %>>HTTP</option>
<option value="1" <% nvram_match("st_webdav_mode", "1", "selected"); %>>HTTPS</option>
<option value="2" <% nvram_match("st_webdav_mode", "2", "selected"); %>>BOTH</option>
</select>
</td>
</tr>
<tr id="webdav_http_port_tr" style="display:none;">
<th width="40%">Cloud Disk Port (HTTP):</th>
<td>
<input type="text" name="webdav_http_port" class="input_6_table" maxlength="5" value="<% nvram_get("webdav_http_port"); %>" onKeyPress="return validator.isNumber(this, event);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr id="webdav_https_port_tr" style="display:none;">
<th width="40%">Cloud Disk Port (HTTPS):</th>
<td>
<input type="text" name="webdav_https_port" class="input_6_table" maxlength="5" value="<% nvram_get("webdav_https_port"); %>" onKeyPress="return validator.isNumber(this, event);" autocorrect="off" autocapitalize="off">
</td>
</tr>
<tr>
<th width="40%">NAT Loopback</th>
<td>
<select name="fw_nat_loopback" class="input_option">
<option value="0" <% nvram_match("fw_nat_loopback", "0","selected"); %>><#839#></option>
<option value="1" <% nvram_match("fw_nat_loopback", "1","selected"); %>>Asus</option>
<option value="2" <% nvram_match("fw_nat_loopback", "2","selected"); %>>Merlin</option>
</select>
</td>
</tr>
</table>
<div class="apply_gen">
<input name="button" type="button" class="button_gen" onclick="applyRule();" value="<#73#>"/>
</div>
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


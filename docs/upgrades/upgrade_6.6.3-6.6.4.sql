insert into webguiVersion values ('6.6.4','upgrade',unix_timestamp());
delete from settings where name='proxiedClientAddress';
update template set template='<tmpl_loop field_loop><tmpl_unless field.isMailField><tmpl_var field.label>:	 <tmpl_var field.value>\n</tmpl_unless></tmpl_loop>' where assetId='PBtmpl0000000000000085';
update template set template='\n		<tmpl_if displayTitle>\n		<h1><tmpl_var title></h1>\n		</tmpl_if>\n		<tmpl_if description>\n			<p><tmpl_var description></p>\n		</tmpl_if>\n		^StyleSheet(\"<tmpl_var session.config.extrasURL>/Navigation/dtree/dtree.css\");\r\n^JavaScript(\"<tmpl_var session.config.extrasURL>/Navigation/dtree/dtree.js\");\r\n\r\n<tmpl_if session.var.adminOn>\r\n<tmpl_var controls>\r\n</tmpl_if>\r\n\r\n<script>\r\n// Path to dtree directory\r\n_dtree_url = \"<tmpl_var session.config.extrasURL>/Navigation/dtree/\";\r\n</script>\r\n\r\n<div class=\"dtree\">\r\n<script type=\"text/javascript\">\r\n<!--\r\n	d = new dTree(\'d\');\r\n	<tmpl_loop page_loop>\r\n	d.add(\r\n		\'<tmpl_var page.assetId escape=JS>\',\r\n		<tmpl_if __first__>-99<tmpl_else>\'<tmpl_var page.parentId escape=JS>\'</tmpl_if>,\r\n		\'<tmpl_var page.menuTitle escape=JS>\',\r\n		\'<tmpl_var page.url escape=JS>\',\r\n		\'<tmpl_var page.synopsis escape=JS>\'\r\n		<tmpl_if page.newWindow>,\'_blank\'</tmpl_if>\r\n	);\r\n	</tmpl_loop>\r\n	document.write(d);\r\n//-->\r\n</script>\r\n\r\n</div>' where assetId='PBtmpl0000000000000130';
update template set template='^StyleSheet(^Extras;/slidePanel/slidePanel.css);\r\n^JavaScript(^Extras;/slidePanel/slidePanel.js);\r\n\r\n<script type=\"text/javascript\">\r\n\r\n  var slider = new createSlidePanelBar(\'WebGUIAdminBar\');\r\n  var panel;\r\n\r\n  panel = new createPanel(\'adminconsole\',\'Admin Console\');\r\n<tmpl_loop adminConsole_loop>\r\n <tmpl_if canUse>\r\n	panel.addLink(\'<tmpl_var icon.small>\',\'<tmpl_var title escape=JS>\',\"<tmpl_var url escape=JS>\");\r\n </tmpl_if>\r\n</tmpl_loop>\r\n  slider.addPanel(panel);\r\n\r\n  panel = new createPanel(\'clipboard\',\'Clipboard\');\r\n<tmpl_loop clipboard_loop>\r\n	panel.addLink(\'<tmpl_var icon.small>\',\'<tmpl_var label escape=JS>\',\"<tmpl_var url escape=JS>\");\r\n</tmpl_loop>\r\n  slider.addPanel(panel);\r\n\r\n  panel = new createPanel(\'packages\',\'Packages\');\r\n<tmpl_loop package_loop>\r\n	panel.addLink(\'<tmpl_var icon.small>\',\'<tmpl_var label escape=JS>\',\"<tmpl_var url escape=JS>\");\r\n</tmpl_loop>\r\n  slider.addPanel(panel);\r\n\r\n\r\n  panel = new createPanel(\'assets\',\'New Content\');\r\n  <tmpl_loop container_loop>\r\n	panel.addLink(\'<tmpl_var icon.small>\',\'<tmpl_var label escape=JS>\',\"<tmpl_var url escape=JS>\");\r\n</tmpl_loop>\r\n panel.addLink(\'^Extras;/spacer.gif\',\'<hr>\',\"\");\n <tmpl_loop contentTypes_loop>\r\n	panel.addLink(\'<tmpl_var icon.small>\',\'<tmpl_var label escape=JS>\',\"<tmpl_var url escape=JS>\");\r\n</tmpl_loop>\r\n  slider.addPanel(panel);\r\n  slider.draw();\r\n\r\n\r\n</script>\r\n' where assetId='PBtmpl0000000000000090';
update template set template='\n		<tmpl_if displayTitle>\n		<h1><tmpl_var title></h1>\n		</tmpl_if>\n		<tmpl_if description>\n			<p><tmpl_var description></p>\n		</tmpl_if>\n		<tmpl_if session.var.adminOn>\r\n<tmpl_var controls>\r\n</tmpl_if>\r\n\r\n<style>\r\n/* CoolMenus 4 - default styles - do not edit */\r\n.cCMAbs{position:absolute; visibility:hidden; left:0; top:0}\r\n/* CoolMenus 4 - default styles - end */\r\n\r\n/*Styles for level 0*/\r\n.cLevel0,.cLevel0over{position:absolute; padding:2px; font-family:tahoma,arial,helvetica; font-size:12px; font-weight:bold;\r\n\r\n}\r\n.cLevel0{background-color:navy; layer-background-color:navy; color:white;\r\ntext-align: center;\r\n}\r\n.cLevel0over{background-color:navy; layer-background-color:navy; color:white; cursor:pointer; cursor:hand; \r\ntext-align: center; \r\n}\r\n\r\n.cLevel0border{position:absolute; visibility:hidden; background-color:#569635; layer-background-color:#006699; \r\n \r\n}\r\n\r\n\r\n/*Styles for level 1*/\r\n.cLevel1, .cLevel1over{position:absolute; padding:2px; font-family:tahoma, arial,helvetica; font-size:11px; font-weight:bold}\r\n.cLevel1{background-color:Navy; layer-background-color:Navy; color:white;}\r\n.cLevel1over{background-color:#336699; layer-background-color:#336699; color:Yellow; cursor:pointer; cursor:hand; }\r\n.cLevel1border{position:absolute; visibility:hidden; background-color:#006699; layer-background-color:#006699}\r\n\r\n/*Styles for level 2*/\r\n.cLevel2, .cLevel2over{position:absolute; padding:2px; font-family:tahoma,arial,helvetica; font-size:10px; font-weight:bold}\r\n.cLevel2{background-color:Navy; layer-background-color:Navy; color:white;}\r\n.cLevel2over{background-color:#0099cc; layer-background-color:#0099cc; color:Yellow; cursor:pointer; cursor:hand; }\r\n.cLevel2border{position:absolute; visibility:hidden; background-color:#006699; layer-background-color:#006699}\r\n\r\n</style>\r\n\r\n  \r\n\r\n^JavaScript(\"<tmpl_var session.config.extrasURL>/coolmenus/coolmenus4.js\");\r\n<script language=\"JavaScript\">\r\n/*****************************************************************************\r\nCopyright (c) 2001 Thomas Brattli (webmaster@dhtmlcentral.com)\r\n\r\nDHTML coolMenus - Get it at coolmenus.dhtmlcentral.com\r\nVersion 4.0_beta\r\nThis script can be used freely as long as all copyright messages are\r\nintact.\r\n\r\nExtra info - Coolmenus reference/help - Extra links to help files **** \r\nCSS help: http://coolmenus.dhtmlcentral.com/projects/coolmenus/reference.asp?m=37\r\nGeneral: http://coolmenus.dhtmlcentral.com/reference.asp?m=35\r\nMenu properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=47\r\nLevel properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=48\r\n\r\nBackground bar properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=49\r\nItem properties: http://coolmenus.dhtmlcentral.com/properties.asp?m=50\r\n******************************************************************************/\r\n\r\n/*** \r\nThis is the menu creation code - place it right after you body tag\r\nFeel free to add this to a stand-alone js file and link it to your page.\r\n**/\r\n\r\n//Menu object creation\r\ncoolmenu=new makeCM(\"coolmenu\") //Making the menu object. Argument: menuname\r\n\r\ncoolmenu.frames = 0\r\n\r\n//Menu properties   \r\ncoolmenu.onlineRoot=\"\"\ncoolmenu.pxBetween=2\r\ncoolmenu.fromLeft=200 \r\ncoolmenu.fromTop=100   \r\ncoolmenu.rows=1\r\ncoolmenu.menuPlacement=\"center\"   //The whole menu alignment, left, center, or right\r\n                                                             \r\ncoolmenu.resizeCheck=1 \r\ncoolmenu.wait=1000 \r\ncoolmenu.fillImg=\"cm_fill.gif\"\r\ncoolmenu.zIndex=100\r\n\r\n//Background bar properties\r\ncoolmenu.useBar=0\r\ncoolmenu.barWidth=\"100%\"\r\ncoolmenu.barHeight=\"menu\" \r\ncoolmenu.barClass=\"cBar\"\r\ncoolmenu.barX=0 \r\ncoolmenu.barY=0\r\ncoolmenu.barBorderX=0\r\ncoolmenu.barBorderY=0\r\ncoolmenu.barBorderClass=\"\"\r\n\r\n//Level properties - ALL properties have to be spesified in level 0\r\ncoolmenu.level[0]=new cm_makeLevel() //Add this for each new level\r\ncoolmenu.level[0].width=110\r\ncoolmenu.level[0].height=21 \r\ncoolmenu.level[0].regClass=\"cLevel0\"\r\ncoolmenu.level[0].overClass=\"cLevel0over\"\r\ncoolmenu.level[0].borderX=1\r\ncoolmenu.level[0].borderY=1\r\ncoolmenu.level[0].borderClass=\"cLevel0border\"\r\ncoolmenu.level[0].offsetX=0\r\ncoolmenu.level[0].offsetY=0\r\ncoolmenu.level[0].rows=0\r\ncoolmenu.level[0].arrow=0\r\ncoolmenu.level[0].arrowWidth=0\r\ncoolmenu.level[0].arrowHeight=0\r\ncoolmenu.level[0].align=\"bottom\"\r\n\r\n//EXAMPLE SUB LEVEL[1] PROPERTIES - You have to specify the properties you want different from LEVEL[0] - If you want all items to look the same just remove this\r\ncoolmenu.level[1]=new cm_makeLevel() //Add this for each new level (adding one to the number)\r\ncoolmenu.level[1].width=coolmenu.level[0].width+20\r\ncoolmenu.level[1].height=25\r\ncoolmenu.level[1].regClass=\"cLevel1\"\r\ncoolmenu.level[1].overClass=\"cLevel1over\"\r\ncoolmenu.level[1].borderX=1\r\ncoolmenu.level[1].borderY=1\r\ncoolmenu.level[1].align=\"right\" \r\ncoolmenu.level[1].offsetX=0\r\ncoolmenu.level[1].offsetY=0\r\ncoolmenu.level[1].borderClass=\"cLevel1border\"\r\n\r\n\r\n//EXAMPLE SUB LEVEL[2] PROPERTIES - You have to spesify the properties you want different from LEVEL[1] OR LEVEL[0] - If you want all items to look the same just remove this\r\ncoolmenu.level[2]=new cm_makeLevel() //Add this for each new level (adding one to the number)\r\ncoolmenu.level[2].width=coolmenu.level[0].width+20\r\ncoolmenu.level[2].height=25\r\ncoolmenu.level[2].offsetX=0\r\ncoolmenu.level[2].offsetY=0\r\ncoolmenu.level[2].regClass=\"cLevel2\"\r\ncoolmenu.level[2].overClass=\"cLevel2over\"\r\ncoolmenu.level[2].borderClass=\"cLevel2border\"\r\n\r\n//EXAMPLE SUB LEVEL[2] PROPERTIES - You have to spesify the properties you want different from LEVEL[1] OR LEVEL[0] - If you want all items to look the same just remove this\r\ncoolmenu.level[3]=new cm_makeLevel() //Add this for each new level (adding one to the number)\r\ncoolmenu.level[3].width=coolmenu.level[0].width+20\r\ncoolmenu.level[3].height=25\r\ncoolmenu.level[3].offsetX=0\r\ncoolmenu.level[3].offsetY=0\r\ncoolmenu.level[3].regClass=\"cLevel2\"\r\ncoolmenu.level[3].overClass=\"cLevel2over\"\r\ncoolmenu.level[3].borderClass=\"cLevel2border\"\r\n\r\n\r\n\r\n<tmpl_loop page_loop>\r\ncoolmenu.makeMenu(\'coolmenu_<tmpl_var page.assetId escape=JS>\'.replace(/\\-/g,\"a\"),\'coolmenu_<tmpl_var page.parent.assetId escape=JS>\'.replace(/\\-/g,\"a\"),\"<tmpl_var page.menuTitle escape=JS>\",\'<tmpl_var page.url escape=JS>\'<tmpl_if page.newWindow>,\'_blank\'</tmpl_if>);\r\n</tmpl_loop>\r\n\r\n\r\ncoolmenu.construct();\r\n\r\n</script>' where assetId='PBtmpl0000000000000134';

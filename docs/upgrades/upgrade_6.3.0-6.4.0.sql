insert into webguiVersion values ('6.4.0','upgrade',unix_timestamp());
alter table asset add index state_parentId_lineage (state,parentId,lineage);
insert into settings (name, value) values ('webguiValidateEmail', '0');
insert into settings (name, value) values ('webguiUseCaptcha', '1');
delete from template where assetId='PBtmpl0000000000000011';
INSERT INTO template VALUES ('   <h1><tmpl_var title></h1>\r\n\r\n<tmpl_if create.message>\r\n   <tmpl_var create.message>\r\n</tmpl_if>\r\n\r\n<tmpl_var create.form.header>\r\n<table >\r\n<tmpl_if useCaptcha>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"><tmpl_var create.form.captcha.label></td>\r\n   <td class=\"tableData\"><tmpl_var create.form.captcha></td>\r\n</tr>\r\n</tmpl_if>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"><tmpl_var create.form.username.label></td>\r\n   <td class=\"tableData\"><tmpl_var create.form.username></td>\r\n</tr>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"><tmpl_var create.form.password.label></td>\r\n   <td class=\"tableData\"><tmpl_var create.form.password></td>\r\n</tr>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"><tmpl_var create.form.passwordConfirm.label></td>\r\n   <td class=\"tableData\"><tmpl_var create.form.passwordConfirm></td>\r\n</tr>\r\n<tmpl_loop create.form.profile>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"><tmpl_var profile.formElement.label></td>\r\n   <td class=\"tableData\"><tmpl_var profile.formElement></td>\r\n</tr>\r\n</tmpl_loop>\r\n<tr>\r\n   <td class=\"formDescription\" valign=\"top\"></td>\r\n   <td class=\"tableData\"><tmpl_var create.form.submit></td>\r\n</tr>\r\n</table>\r\n<tmpl_var create.form.footer>\r\n\r\n<div class=\"accountOptions\">\r\n   <ul>\r\n      <li><a href=\"<tmpl_var login.url>\"><tmpl_var login.label></a></li>\r\n      <tmpl_if recoverPassword.isAllowed>\r\n	     <li><a href=\"<tmpl_var recoverPassword.url>\"><tmpl_var recoverPassword.label></a></li>\r\n	  </tmpl_if>\r\n   </ul>\r\n</div>','Auth/WebGUI/Create',1,1,'PBtmpl0000000000000011');
insert into settings (name, value) values ('webguiAccountTemplate', 'PBtmpl0000000000000010');
insert into settings (name, value) values ('webguiCreateAccountTemplate', 'PBtmpl0000000000000011');
insert into settings (name, value) values ('webguiExpiredPasswordTemplate', 'PBtmpl0000000000000012');
insert into settings (name, value) values ('webguiLoginTemplate', 'PBtmpl0000000000000013');
insert into settings (name, value) values ('webguiPasswordRecoveryTemplate', 'PBtmpl0000000000000014');
insert into settings (name, value) values ('ldapAccountTemplate', 'PBtmpl0000000000000004');
insert into settings (name, value) values ('ldapCreateAccountTemplate', 'PBtmpl0000000000000005');
insert into settings (name, value) values ('ldapLoginTemplate', 'PBtmpl0000000000000006');



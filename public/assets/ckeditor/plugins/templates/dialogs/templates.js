/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){CKEDITOR.dialog.add("templates",function(e){function t(e,t){var i=CKEDITOR.dom.element.createFromHtml('<a href="javascript:void(0)" tabIndex="-1" role="option" ><div class="cke_tpl_item"></div></a>'),o='<table style="width:350px;" class="cke_tpl_preview" role="presentation"><tr>';return e.image&&t&&(o+='<td class="cke_tpl_preview_img"><img src="'+CKEDITOR.getUrl(t+e.image)+'"'+(CKEDITOR.env.ie6Compat?' onload="this.width=this.width"':"")+' alt="" title=""></td>'),o+='<td style="white-space:normal;"><span class="cke_tpl_title">'+e.title+"</span><br/>",e.description&&(o+="<span>"+e.description+"</span>"),i.getFirst().setHtml(o+"</td></tr></table>"),i.on("click",function(){n(e.html)}),i}function n(t){var n=CKEDITOR.dialog.getCurrent();n.getValueOf("selectTpl","chkInsertOpt")?(e.fire("saveSnapshot"),e.setData(t,function(){n.hide();var t=e.createRange();t.moveToElementEditStart(e.editable()),t.select(),setTimeout(function(){e.fire("saveSnapshot")},0)})):(e.insertHtml(t),n.hide())}function i(e){var t=e.data.getTarget(),n=a.equals(t);if(n||a.contains(t)){var i,o=e.data.getKeystroke(),r=a.getElementsByTag("a");if(r){if(n)i=r.getItem(0);else switch(o){case 40:i=t.getNext();break;case 38:i=t.getPrevious();break;case 13:case 32:t.fire("click")}i&&(i.focus(),e.data.preventDefault())}}}var o=CKEDITOR.plugins.get("templates");CKEDITOR.document.appendStyleSheet(CKEDITOR.getUrl(o.path+"dialogs/templates.css"));var a,o="cke_tpl_list_label_"+CKEDITOR.tools.getNextNumber(),r=e.lang.templates,s=e.config;return{title:e.lang.templates.title,minWidth:CKEDITOR.env.ie?440:400,minHeight:340,contents:[{id:"selectTpl",label:r.title,elements:[{type:"vbox",padding:5,children:[{id:"selectTplText",type:"html",html:"<span>"+r.selectPromptMsg+"</span>"},{id:"templatesList",type:"html",focus:!0,html:'<div class="cke_tpl_list" tabIndex="-1" role="listbox" aria-labelledby="'+o+'"><div class="cke_tpl_loading"><span></span></div></div><span class="cke_voice_label" id="'+o+'">'+r.options+"</span>"},{id:"chkInsertOpt",type:"checkbox",label:r.insertOption,"default":s.templates_replaceContent}]}]}],buttons:[CKEDITOR.dialog.cancelButton],onShow:function(){var e=this.getContentElement("selectTpl","templatesList");a=e.getElement(),CKEDITOR.loadTemplates(s.templates_files,function(){var n=(s.templates||"default").split(",");if(n.length){var i=a;i.setHtml("");for(var o=0,l=n.length;l>o;o++)for(var c=CKEDITOR.getTemplates(n[o]),d=c.imagesPath,c=c.templates,u=c.length,h=0;u>h;h++){var m=t(c[h],d);m.setAttribute("aria-posinset",h+1),m.setAttribute("aria-setsize",u),i.append(m)}e.focus()}else a.setHtml('<div class="cke_tpl_empty"><span>'+r.emptyListMsg+"</span></div>")}),this._.element.on("keydown",i)},onHide:function(){this._.element.removeListener("keydown",i)}}})}();
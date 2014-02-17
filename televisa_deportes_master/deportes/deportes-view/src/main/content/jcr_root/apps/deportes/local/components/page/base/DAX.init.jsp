<%--
 * DESCRIPTION
 * -----------------------------------------------------------------------------
 *  Script for Digital Analytics (start of Body tag).
 * -----------------------------------------------------------------------------
 * 
 * CHANGE HISTORY
 * -----------------------------------------------------------------------------
 * Version | Date        | Developer              | Changes
 * 1.1     | 02/04/2013  | lorozco@xumak.com      | added Analytics clientlib
 * -----------------------------------------------------------------------------
 *
 */
  ==============================================================================
--%><%
%><%@include file="/apps/deportes/local/components/global.jsp"%><%
%><%@page import="com.day.cq.wcm.api.WCMMode" pageEncoding="utf-8" %><%
%><%
    String name = (String)request.getAttribute("DAXName");
    
    if( name != null ) {
        String c1 = properties.get( "c1", "2" );
        String c2 = properties.get( "c2", "6035759" );
        String ns_site = properties.get( "ns_site", "noticieros" );

        String url = "c1=" + c1 + "&c2=" + c2 + "&ns_site=" + ns_site + "&name=" + name;
        request.setAttribute("ns_site", ns_site);

%>
<cq:includeClientLib js="deportes.analytics" />
<script type="text/javascript">
<%--  

    ==> functions no longer need to be created; they're now included in clientlib file

    function udm_(e){var t="comScore=",n=document,r=n.cookie,i="",s="indexOf",o="substring",u="length",a=2048,f,l="&ns_",c="&",h,p,d,v,m=window,g=m.encodeURIComponent||escape;if(r[s](t)+1)for(d=0,p=r.split(";"),v=p[u];d<v;d++)h=p[d][s](t),h+1&&(i=c+unescape(p[d][o](h+t[u])));e+=l+"_t="+ +(new Date)+l+"c="+(n.characterSet||n.defaultCharset||"")+"&c8="+g(n.title)+i+"&c7="+g(n.URL)+"&c9="+g(n.referrer),e[u]>a&&e[s](c)>0&&(f=e[o](0,a-8).lastIndexOf(c),e=(e[o](0,f)+l+"cut="+g(e[o](f+1)))[o](0,a)),n.images?(h=new Image,m.ns_p||(ns_p=h),h.src=e):n.write("<","p","><",'img src="',e,'" height="1" width="1" alt="*"',"><","/p",">")};

    function uid_call(a, b){

        ui_c2 = <%= c2 %>; 

        ui_ns_site = '<%= ns_site %>'; 

        window.b_ui_event = window.c_ui_event != null ? window.c_ui_event:"",window.c_ui_event = a;

        var ui_pixel_url = 'http://b.scorecardresearch.com/p?c1=2&c2='+ui_c2+'&ns_site='+ui_ns_site+'&name='+a+'&ns_type=hidden&type=hidden&ns_ui_type='+b;

        var b="comScore=",c=document,d=c.cookie,e="",f="indexOf",g="substring",h="length",i=2048,j,k="&ns_",l="&",m,n,o,p,q=window,r=q.encodeURIComponent||escape;if(d[f](b)+1)for(o=0,n=d.split(";"),p=n[h];o<p;o++)m=n[o][f](b),m+1&&(e=l+unescape(n[o][g](m+b[h])));ui_pixel_url+=k+"_t="+ +(new Date)+k+"c="+(c.characterSet||c.defaultCharset||"")+"&c8="+r(c.title)+e+"&c7="+r(c.URL)+"&c9="+r(c.referrer)+"&b_ui_event="+b_ui_event+"&c_ui_event="+c_ui_event,ui_pixel_url[h]>i&&ui_pixel_url[f](l)>0&&(j=ui_pixel_url[g](0,i-8).lastIndexOf(l),ui_pixel_url=(ui_pixel_url[g](0,j)+k+"cut="+r(ui_pixel_url[g](j+1)))[g](0,i)),c.images?(m=new Image,q.ns_p||(ns_p=m),m.src=ui_pixel_url):c.write("<p><img src='",ui_pixel_url,"' height='1' width='1' alt='*'></p>");

    }
--%>
    udm_('http://b.scorecardresearch.com/b?<%= url %>');
</script>

<noscript><p><img src="http://b.scorecardresearch.com/p?<%= url %>" height="1" width="1" alt="*"></p></noscript> 

<!-- End Digital Analytix Tag 1.1302.13 -->

<% } %>

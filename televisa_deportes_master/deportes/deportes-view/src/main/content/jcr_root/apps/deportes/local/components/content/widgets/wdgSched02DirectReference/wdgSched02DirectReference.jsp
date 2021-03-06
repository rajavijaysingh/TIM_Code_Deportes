<%--
 * DESCRIPTION
 * -----------------------------------------------------------------------------
 *  Reference component.
 *  This component is based of the libs/foundation/components/reference.

 * -----------------------------------------------------------------------------
 * 
 * CHANGE HISTORY
 * -----------------------------------------------------------------------------
 * Version | Date        | Developer               | Changes
 * 1.0     | 07/18/2013  | Otto Giron        | Initial Creation.
 * -----------------------------------------------------------------------------
 *
 */
  ==============================================================================

  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.


  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.


  ==============================================================================


  Default reference component.


  Includes the referenced component addressed by the "path" property. It
  temporarily disables the WCM so that the included components cannot be
  edited.

--%>
<%@include file="/apps/deportes/local/components/global.jsp"%>

<fmt:message key="commons.reference.error.placeholder" var="placeholdererror"/>

<%@page import="com.day.cq.wcm.api.WCMMode,
    com.day.cq.wcm.api.components.DropTarget" %>
<%
	String pagePath="/content/televisa/deportes";
	String componentResourceType="deportes/generics/components/content/widgets/wdgSched02";
%>
<c:set var="componentPath">
    <tg:findComponentInPage pagePath="<%=pagePath%>" componentResourceType="<%=componentResourceType%>"/>
</c:set>
<% 
    WCMMode mode = WCMMode.DISABLED.toRequest(request);
    try {
        // Use request attributes to guard against reference loops
        String path = resource.getPath();
        String key = "com.day.cq.wcm.components.reference:" + path;
        if (request.getAttribute(key) == null) {
            request.setAttribute(key, Boolean.TRUE);
        } else {
            throw new IllegalStateException("Reference loop: " + path);
        }
    
        //drop target css class = dd prefix + name of the drop target in the edit config
        String ddClassName = DropTarget.CSS_CLASS_PREFIX + "paragraph";
    
        // Include the target paragraph by path
    
        String target = pageContext.getAttribute("componentPath").toString();
        if (target != null&&!target.trim().isEmpty()) {
%>
            <div style="display:inline;" class="<%= ddClassName %>"><sling:include path="<%= target %>"/></div>
<%
        } else if (mode == WCMMode.EDIT) {
%>
            <p><img src="/libs/cq/ui/resources/0.gif" class="cq-reference-placeholder <%= ddClassName %>" alt=""></p>
<%
        }
    } catch (Exception e) {
        // Log errors always
        log.error("Reference component error", e);
    
        // Display errors only in edit mode 
        if (mode == WCMMode.EDIT) {
%>
            <p>${placeholdererror} <%= xssAPI.encodeForHTML(e.toString()) %></p>
<%
        }
    } finally {
        mode.toRequest(request);
    }
%>
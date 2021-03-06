
<%--
 * DESCRIPTION
 * -----------------------------------------------------------------------------
 *  Twitter Box component.
 *  This component is used for define how 'n' numbers of twitterFeed components is going to manage the component

 * -----------------------------------------------------------------------------
 * 
 * CHANGE HISTORY
 * -----------------------------------------------------------------------------
 * Version | Date        | Developer               | Changes
 * 1.0     | 28/01/2013  | Luis Jose Sztul         | Initial Creation.
 * -----------------------------------------------------------------------------
 *
 */
  ==============================================================================
--%>
<%@include file="/apps/commons/components/global.jsp"%>
<%@ page import="com.day.cq.wcm.api.WCMMode" %>

<fmt:message key="commons.twitterBox.placeholder" var="placeholder"/>

<c:set var="mode" value="<%= WCMMode.fromRequest(request) %>"/>
<c:set var="modeEdit" value="<%= WCMMode.EDIT %>"/>

<c:set var="type" value="${properties.type}"/>
<c:set var="numberOfAccounts" value="${properties.numberOfAccounts}"/>
<c:set var="twitterList" value="${properties.twitterList}"/>

<%
    pageContext.setAttribute("titleLinkText", properties.get("titleLinkText", ""));
    pageContext.setAttribute("titleLinkType", properties.get("titleLinkType", "internal"));
    pageContext.setAttribute("titleInternalLink", properties.get("titleInternalLink", ""));
    pageContext.setAttribute("titleExternalLink", properties.get("titleExternalLink", ""));
    pageContext.setAttribute("titleLinkTarget", properties.get("titleLinkTarget", "_blank"));
    pageContext.setAttribute("titleTitle", properties.get("titleTitle", ""));
%>

<!-- BEGIN: wdg_twitt_01 -->
<div class="hide-tablet">
<c:choose>
    <c:when test="${not empty type}">
    <!-- Add styles to devices -->

        <div class="wdg_twitt_02" data-enhance="false">
            <div class="wdg_carousa">
                <div class="wdg_twitt_02_title">

                    <c:choose>
                        <c:when test="${titleLinkType == 'internal'}">

                            <c:if test="${not empty titleInternalLink}">
                                <c:set var="titlelink" value="href = ${titleInternalLink}.html" />
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty titleExternalLink}">
                                <c:set var="titlelink" value="${titleExternalLink}" />
                                <c:choose>
                                    <c:when test="${fn:contains(titlelink, 'http://')}">
                                        <c:set var="titlelink" value="href = ${titlelink}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="titlelink" value="href = http://${titlelink}" />
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${not empty titleLinkTarget && titleLinkTarget != 'select'}">
                        <c:set var="titleLinkTarget" value="target= '${titleLinkTarget}'"/>
                    </c:if>
                    <c:if test="${not empty titleTitle}">
                        <c:set var="titleLinkTitle" value="title= '${titleTitle}'" />
                    </c:if>
                    <c:set var="titleLinkText" value="${titleLinkText}"/>
                    <c:if test="${empty titleLinkText}">
                        <c:set var="titleLinkText" value=""/>
                    </c:if>
                    <strong class="background-color-pleca1">
                        <a class="textcolor-title3" ${titlelink} target="${titleLinkTarget}" title="${titleLinkTitle}">${titleLinkText}<span class="icon mobile"></span></a>
                    </strong>

                    <ul class="wt2_arrows">
                        <li class="wt2left"><a href="#left" class="wdg_carousa_left carouselArrowLeft"><i class="tvsa-double-caret-left"></i></a></li>
                        <li class="dotted-left"></li>
                        <li class="wt2right"><a href="#right" class="wdg_carousa_right carouselArrowRight"><i class="tvsa-double-caret-right"></i></a></li>
                    </ul>
                </div>

                <c:choose>
                    <c:when test="${type == 'accounts'}">
                        <cq:include path="wdg_twitt_02_carousel" resourceType="deportes/generics/components/content/widgets/wdgTwitt02/twitterAccount"/>
                    </c:when>
                    <c:otherwise>
                        <cq:include path="wdg_twitt_02_carousel" resourceType="deportes/generics/components/content/widgets/wdgTwitt02/twitterList"/>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="bullets">
                <div class="background-color1"></div>
                    <div></div>
                    <div></div>
            </div>
        </div>

    </c:when>
    <c:otherwise>
        <h4 class="cq-texthint-placeholder">${placeholder}</h4>
    </c:otherwise>
</c:choose>
<!-- END: wdg_twitt_01 -->

<!-- close div of styles to devices -->
</div>

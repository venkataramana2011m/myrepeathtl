<%--
  ADOBE CONFIDENTIAL
  __________________

   Copyright 2012 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%
%><%@include file="/libs/foundation/global.jsp" %><%
%><%@page contentType="text/html; charset=utf-8" import="com.day.cq.i18n.I18n,
                                                         com.day.cq.personalization.ProfileUtil,
                                                         com.day.cq.security.profile.Profile,
                                                         com.day.cq.wcm.api.WCMMode,
                                                         com.day.cq.wcm.mobile.api.device.DeviceGroup,
                                                         com.day.cq.wcm.mobile.api.device.DeviceGroupList,
                                                         org.apache.commons.lang.StringUtils,
                                                         java.util.Arrays,
                                                         java.util.LinkedList,
                                                         java.util.List"
%><%@taglib prefix="personalization" uri="http://www.day.com/taglibs/cq/personalization/1.0" %><%

    /* determine a list of selectors which should be added to profile url */
    DeviceGroupList deviceGroups = currentPage.adaptTo(DeviceGroupList.class);
    String deviceSelectors = "";

    if (deviceGroups != null) {
        List<String> selectors = Arrays.asList(slingRequest.getRequestPathInfo().getSelectors());
        List<String> deviceGroupList = new LinkedList<String>();

        if (selectors.size() > 0) {
            for (final DeviceGroup group : deviceGroups) {
                String groupName = group.getName();

                if ((groupName != null) && selectors.contains(groupName)) {
                    deviceGroupList.add(group.getName());
                }
            }
        }

        if (deviceGroupList.size() > 0) {
            deviceSelectors = "." + StringUtils.join(deviceGroupList, ".");
        }
    }

    final I18n i18n = new I18n(slingRequest);
    final Profile currentProfile = slingRequest.adaptTo(Profile.class);
    final boolean isAnonymous = ProfileUtil.isAnonymous(currentProfile);
    final boolean isDisabled = WCMMode.DISABLED.equals(WCMMode.fromRequest(request));
    final String logoutPath = request.getContextPath() + "/system/sling/logout.html";
    final String profilePagePath = currentStyle.get("profilePage", String.class);
    final String myProfileLink = "${profile.path}.form" + deviceSelectors + ".html" + profilePagePath;
    final String cartPagePath = currentStyle.get("cartPage", String.class);
    final String loginPagePath = currentStyle.get("loginPage", String.class);
    final String signupPagePath = currentStyle.get("signupPage", String.class);
%>
<script type="text/javascript">function logout() {
<% if( !isDisabled ) { %>
    if (CQ_Analytics && CQ_Analytics.CCM) {
        CQ_Analytics.ProfileDataMgr.loadProfile("anonymous");
        CQ.shared.Util.reload();
    }
<% } else { %>
    if (CQ_Analytics && CQ_Analytics.CCM) {
        CQ_Analytics.ProfileDataMgr.clear();
        CQ_Analytics.CCM.reset();
    }
    CQ.shared.Util.load("<%= logoutPath %>");
<% } %>
}</script>
<nav>
    <ul>
<%
    if (isDisabled) {

        //in publish mode, only display the name if !anonymous
        if (!isAnonymous) {
%>
        <li class="user">
            <personalization:contextProfileProperty propertyName="formattedName" prefix="(" suffix=")"/>
        </li>
<%
            if (null != cartPagePath) {
%>
        <li class="cartpage"><a href="<%= cartPagePath %>.html"><%= i18n.get("My Cart") %></a></li>
<%
            }

            if (null != profilePagePath) {
%>
        <li class="profilepage">
            <personalization:contextProfileLink displayValue="<%= i18n.get("My Profile") %>"
                                                href="<%= myProfileLink %>"
                                                id="myprofile-link"/>
        </li>
<%
            }
%>
        <li class="signout">
            <a href="javascript:logout();"><%= i18n.get("Sign Out") %></a>
        </li>
<%
        } else {

            if (null != loginPagePath) {
%>
        <li class="login"><a href="<%= loginPagePath %>.html"><%= i18n.get("Sign In") %></a></li>
<%
            }

            if (null != signupPagePath) {
%>
        <li class="signup"><a href="<%= signupPagePath %>.html"><%= i18n.get("Sign Up") %></a></li>
<%
            }
        }

    } else {

        //on author handle link from the ClientContext
%>
        <li class="user cq-cc-profile-not-anonymous">
            <personalization:contextProfileProperty propertyName="formattedName" prefix="(" suffix=")"/>
        </li>
<%
        if (null != cartPagePath) {
%>
        <li class="cartpage">
            <a href="<%= cartPagePath %>.html"><%= i18n.get("My Cart") %></a>
        </li>
<%
        }

        if (null != profilePagePath) {
%>
        <li class="profilepage cq-cc-profile-not-anonymous">
            <personalization:contextProfileLink displayValue="<%= i18n.get("My Profile") %>"
                                                href="<%= myProfileLink %>"
                                                id="myprofile-link"/>
        </li>
<%
        }
%>
        <li class="signout cq-cc-profile-not-anonymous">
            <a href="javascript:logout();"><%= i18n.get("Sign Out") %></a>
        </li>
<%
        if (null != loginPagePath) {
%>
<li class="login cq-cc-profile-anonymous"><a href="<%= loginPagePath %>.html"><%= i18n.get("Sign In") %></a></li>
<%
        }

        if (null != signupPagePath) {
%>
<li class="signup cq-cc-profile-anonymous"><a href="<%= signupPagePath %>.html"><%= i18n.get("Sign Up") %></a></li>
<%
        }
    }
%>
    </ul>
</nav>
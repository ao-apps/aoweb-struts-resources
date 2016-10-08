<%-- aoweb-struts: Do not edit --%>
<%--
Copyright 2007-2009, 2016 by AO Industries, Inc.,
7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
All rights reserved.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.inc.jsp" %>

<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupSelectPackageForm.packageDefinition.prompt" /></td>
		<td><ao:write scope="request" name="packageDefinition" property="display" /></td>
	</tr>
</fmt:bundle>
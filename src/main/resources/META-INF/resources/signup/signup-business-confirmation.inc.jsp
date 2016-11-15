<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016  AO Industries, Inc.
	support@aoindustries.com
	7262 Bull Pen Cir
	Mobile, AL 36695

This file is part of aoweb-struts-resources.

aoweb-struts-resources is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

aoweb-struts-resources is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with aoweb-struts-resources.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.inc.jsp" %>

<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupBusinessForm.businessName.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessName" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupBusinessForm.businessPhone.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessPhone" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupBusinessForm.businessFax.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessFax" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupBusinessForm.businessAddress1.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessAddress1" /></td>
	</tr>
	<logic:notEmpty scope="session" name="signupBusinessForm" property="businessAddress2">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupBusinessForm.businessAddress2.prompt" /></td>
			<td><ao:write scope="session" name="signupBusinessForm" property="businessAddress2" /></td>
		</tr>
	</logic:notEmpty>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupBusinessForm.businessCity.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessCity" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupBusinessForm.businessState.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessState" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupBusinessForm.businessCountry.prompt" /></td>
		<td><ao:write scope="request" name="businessCountry" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupBusinessForm.businessZip.prompt" /></td>
		<td><ao:write scope="session" name="signupBusinessForm" property="businessZip" /></td>
	</tr>
</fmt:bundle>

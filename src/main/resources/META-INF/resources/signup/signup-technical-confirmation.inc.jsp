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
		<td><fmt:message key="signupTechnicalForm.baName.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baName" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baTitle.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baTitle" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupTechnicalForm.baWorkPhone.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baWorkPhone" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baCellPhone.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baCellPhone" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baHomePhone.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baHomePhone" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baFax.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baFax" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupTechnicalForm.baEmail.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baEmail" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baAddress1.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baAddress1" /></td>
	</tr>
	<logic:notEmpty scope="session" name="signupTechnicalForm" property="baAddress2">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupTechnicalForm.baAddress2.prompt" /></td>
			<td><ao:write scope="session" name="signupTechnicalForm" property="baAddress2" /></td>
		</tr>
	</logic:notEmpty>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baCity.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baCity" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baState.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baState" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baCountry.prompt" /></td>
		<td><ao:write scope="request" name="baCountry" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baZip.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baZip" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.required" /></td>
		<td><fmt:message key="signupTechnicalForm.baUsername.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baUsername" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupTechnicalForm.baPassword.prompt" /></td>
		<td><ao:write scope="session" name="signupTechnicalForm" property="baPassword" /></td>
	</tr>
</fmt:bundle>

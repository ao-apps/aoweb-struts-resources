<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2019  AO Industries, Inc.
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
	<logic:notEmpty scope="request" name="powerOption">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupCustomizeServerConfirmation.power.prompt" /></td>
			<td><ao:write name="powerOption" /></td>
		</tr>
	</logic:notEmpty>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupCustomizeServerConfirmation.cpu.prompt" /></td>
		<td><ao:write name="cpuOption" type="application/xhtml+xml" /></td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupCustomizeServerConfirmation.ram.prompt" /></td>
		<td><ao:write name="ramOption" /></td>
	</tr>
	<logic:notEmpty scope="request" name="sataControllerOption">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupCustomizeServerConfirmation.sataController.prompt" /></td>
			<td><ao:write name="sataControllerOption" /></td>
		</tr>
	</logic:notEmpty>
	<logic:notEmpty scope="request" name="scsiControllerOption">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupCustomizeServerConfirmation.scsiController.prompt" /></td>
			<td><ao:write name="scsiControllerOption" /></td>
		</tr>
	</logic:notEmpty>
	<logic:iterate name="diskOptions" id="diskOption">
		<tr>
			<td><fmt:message key="signup.notRequired" /></td>
			<td><fmt:message key="signupCustomizeServerConfirmation.disk.prompt" /></td>
			<td><ao:write name="diskOption" /></td>
		</tr>
	</logic:iterate>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td><fmt:message key="signupCustomizeServerConfirmation.setup.prompt" /></td>
		<td>
			<logic:notPresent name="setup">
				<fmt:message key="signupSelectPackageForm.setup.none" />
			</logic:notPresent>
			<logic:present name="setup">
				<ao:write name="setup" />
			</logic:present>
		</td>
	</tr>
	<tr>
		<td><fmt:message key="signup.notRequired" /></td>
		<td style='white-space:nowrap'><fmt:message key="signupCustomizeServerConfirmation.monthlyRate.prompt" /></td>
		<td><ao:write name="monthlyRate" /></td>
	</tr>
</fmt:bundle>

<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2019, 2020  AO Industries, Inc.
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

<skin:lightArea>
	<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
		<table class="packed">
			<tbody>
				<tr><td style="white-space:nowrap" colspan="3">
					<fmt:message key="${statusKey}">
						<fmt:param><c:out value="${pkey}" /></fmt:param>
					</fmt:message><ao:br />
					<ao:br />
					<logic:iterate scope="request" name="successAddresses" id="successAddress">
						<fmt:message key="serverConfirmationCompleted.successAddress">
							<fmt:param><c:out value="${successAddress}" /></fmt:param>
						</fmt:message><ao:br />
					</logic:iterate>
					<logic:iterate scope="request" name="failureAddresses" id="failureAddress">
						<fmt:message key="serverConfirmationCompleted.failureAddress">
							<fmt:param><c:out value="${failureAddress}" /></fmt:param>
						</fmt:message><ao:br />
					</logic:iterate>
					<ao:br />
					<fmt:message key="serverConfirmationCompleted.belowIsSummary" /><ao:br />
					<ao:hr />
				</td></tr>
				<tr><th colspan="3"><fmt:message key="steps.selectServer.label" /></th></tr>
				<%@include file="signup-select-server-confirmation.inc.jsp" %>
				<tr><td colspan="3">&#160;</td></tr>
				<tr><th colspan="3"><fmt:message key="steps.customizeServer.label" /></th></tr>
				<%@include file="signup-customize-server-confirmation.inc.jsp" %>
				<tr><td colspan="3">&#160;</td></tr>
				<tr><th colspan="3"><fmt:message key="steps.organizationInfo.label" /></th></tr>
				<%@include file="signup-organization-confirmation.inc.jsp" %>
				<tr><td colspan="3">&#160;</td></tr>
				<tr><th colspan="3"><fmt:message key="steps.technicalInfo.label" /></th></tr>
				<%@include file="signup-technical-confirmation.inc.jsp" %>
				<tr><td colspan="3">&#160;</td></tr>
				<tr><th colspan="3"><fmt:message key="steps.billingInformation.label" /></th></tr>
				<%@include file="signup-billing-information-confirmation.inc.jsp" %>
			</tbody>
		</table>
	</fmt:bundle>
</skin:lightArea>

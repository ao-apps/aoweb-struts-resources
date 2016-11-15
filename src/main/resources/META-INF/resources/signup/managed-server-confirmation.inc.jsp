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

<skin:lightArea>
	<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
		<bean:define name="actionPrefix" id="myActionPrefix" type="java.lang.String" />
		<table cellpadding="0" cellspacing="0">
			<tr><td colspan="3"><b><fmt:message key="serverConfirmation.stepLabel" /></b><br /><hr /></td></tr>
			<tr><td colspan="3"><fmt:message key="serverConfirmation.stepHelp" /></td></tr>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.selectServer.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-select-server-confirmation.inc.jsp" %>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.customizeServer.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix +"-2" %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-customize-server-confirmation.inc.jsp" %>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.customizeManagement.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix +"-3" %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-customize-management-confirmation.inc.jsp" %>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.businessInfo.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix +"-4" %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-business-confirmation.inc.jsp" %>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.technicalInfo.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix +"-5" %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-technical-confirmation.inc.jsp" %>
			<tr><td colspan="3">&#160;</td></tr>
			<tr>
				<th colspan="3">
					<table style="width:100%" cellspacing="0" cellpadding="0">
						<tr>
							<th><fmt:message key="steps.billingInformation.label" /></th>
							<td align='right'><html:link styleClass="aoLightLink" action='<%= "/" + myActionPrefix +"-6" %>'><fmt:message key="serverConfirmation.edit.link" /></html:link></td>
						</tr>
					</table>
				</th>
			</tr>
			<%@include file="signup-billing-information-confirmation.inc.jsp" %>
			<tr><td colspan="3" align="center"><br /><ao:input type="submit"><fmt:message key="serverConfirmation.submit.label" /></ao:input><br /><br /></td></tr>
		</table>
	</fmt:bundle>
</skin:lightArea>

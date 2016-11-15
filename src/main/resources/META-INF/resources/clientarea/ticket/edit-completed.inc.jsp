<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2015, 2016  AO Industries, Inc.
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

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
	<%@include file="add-parents.inc.jsp" %>
	<fmt:bundle basename="com.aoindustries.website.clientarea.ticket.ApplicationResources">
		<skin:path>
			/clientarea/ticket/edit.do
			<ao:param name="pkey"><ao:write scope="request" name="ticket" property="pkey" /></ao:param>
		</skin:path>
		<skin:title><fmt:message key="edit.title" /></skin:title>
		<skin:navImageAlt><fmt:message key="edit.navImageAlt" /></skin:navImageAlt>
		<skin:keywords><fmt:message key="edit.keywords" /></skin:keywords>
		<skin:description><fmt:message key="edit.description" /></skin:description>
		<skin:skin>
			<skin:content>
				<skin:contentTitle><fmt:message key="edit.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<skin:lightArea>
							<fmt:message key="edit-completed.ticketChanges" />
							<hr />
							<ul>
								<logic:equal scope="request" name="businessUpdated" value="true">
									<li><fmt:message key="edit-completed.businessUpdated" /></li>
								</logic:equal>
								<logic:equal scope="request" name="contactEmailsUpdated" value="true">
									<li><fmt:message key="edit-completed.contactEmailsUpdated" /></li>
								</logic:equal>
								<logic:equal scope="request" name="contactPhoneNumbersUpdated" value="true">
									<li><fmt:message key="edit-completed.contactPhoneNumbersUpdated" /></li>
								</logic:equal>
								<logic:equal scope="request" name="clientPriorityUpdated" value="true">
									<li><fmt:message key="edit-completed.clientPriorityUpdated" /></li>
								</logic:equal>
								<logic:equal scope="request" name="summaryUpdated" value="true">
									<li><fmt:message key="edit-completed.summaryUpdated" /></li>
								</logic:equal>
								<logic:equal scope="request" name="annotationAdded" value="true">
									<li><fmt:message key="edit-completed.annotationAdded" /></li>
								</logic:equal>
								<logic:equal scope="request" name="nothingChanged" value="true">
									<li><fmt:message key="edit-completed.nothingChanged" /></li>
								</logic:equal>
							</ul>
							<fmt:message key="edit-completed.index.backTo" /><html:link action="/index"><fmt:message key="edit-completed.index.link" /></html:link>
						</skin:lightArea>
					</logic:notPresent>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

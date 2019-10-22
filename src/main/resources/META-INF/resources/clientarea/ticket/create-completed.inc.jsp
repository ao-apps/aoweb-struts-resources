<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2015, 2016, 2019  AO Industries, Inc.
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

<%@include file="add-parents.inc.jsp" %>
<fmt:bundle basename="com.aoindustries.website.clientarea.ticket.ApplicationResources">
	<skin:path>/clientarea/ticket/create.do</skin:path>
	<skin:title><fmt:message key="create.title" /></skin:title>
	<skin:navImageAlt><fmt:message key="create.navImageAlt" /></skin:navImageAlt>
	<skin:keywords><fmt:message key="create.keywords" /></skin:keywords>
	<skin:description><fmt:message key="create.description" /></skin:description>
	<skin:skin>
		<skin:content>
			<skin:contentTitle><fmt:message key="create.title" /></skin:contentTitle>
			<skin:contentHorizontalDivider />
			<skin:contentLine>
				<logic:present scope="request" name="permissionDenied">
					<%@include file="../../_permission-denied.inc.jsp" %>
				</logic:present>
				<logic:notPresent scope="request" name="permissionDenied">
					<skin:lightArea>
						<fmt:message key="create-completed.message" />
						<html:link action="/edit" paramId="pkey" paramScope="request" paramName="pkey"><ao:write scope="request" name="pkey" /></html:link>
					</skin:lightArea>
				</logic:notPresent>
			</skin:contentLine>
		</skin:content>
	</skin:skin>
</fmt:bundle>

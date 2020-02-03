<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2015, 2016, 2019, 2020  AO Industries, Inc.
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

<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
	<skin:path>
		/clientarea/accounting/delete-credit-card-completed.do
		<ao:param name="id" value="${param.id}"/>
	</skin:path>
	<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="robots">noindex</skin:meta></logic:equal>
	<skin:title><fmt:message key="deleteCreditCardCompleted.title" /></skin:title>
	<skin:navImageAlt><fmt:message key="deleteCreditCardCompleted.navImageAlt" /></skin:navImageAlt>
	<skin:keywords><fmt:message key="deleteCreditCardCompleted.keywords" /></skin:keywords>
	<skin:description><fmt:message key="deleteCreditCardCompleted.description" /></skin:description>
	<%@include file="add-parents.inc.jsp" %>
	<skin:parent><%@include file="credit-card-manager.meta.inc.jsp" %></skin:parent>
	<skin:skin>
		<skin:content width="600">
			<skin:contentTitle><fmt:message key="deleteCreditCardCompleted.title" /></skin:contentTitle>
			<skin:contentHorizontalDivider />
			<skin:contentLine>
				<logic:present scope="request" name="permissionDenied">
					<%@include file="../../_permission-denied.inc.jsp" %>
				</logic:present>
				<logic:notPresent scope="request" name="permissionDenied">
					<skin:lightArea>
						<b><fmt:message key="deleteCreditCardCompleted.successMessage.title" /></b>
						<ao:hr />
						<fmt:message key="deleteCreditCardCompleted.successMessage.text">
							<fmt:param value="${aoweb:getCardNumberDisplay(cardNumber)}" />
						</fmt:message><ao:br />
						<ao:br />
						<html:link action="/credit-card-manager"><fmt:message key="deleteCreditCardCompleted.creditCardManager.link" /></html:link>
					</skin:lightArea>
				</logic:notPresent>
			</skin:contentLine>
		</skin:content>
	</skin:skin>
</fmt:bundle>

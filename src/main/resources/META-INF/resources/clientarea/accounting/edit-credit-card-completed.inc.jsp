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
	<skin:path>/clientarea/accounting/edit-credit-card-completed.do</skin:path>
	<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="robots">noindex</skin:meta></logic:equal>
	<skin:title>
		<logic:notEqual name="editCreditCardForm" property="isActive" value="false">
			<fmt:message key="editCreditCardCompleted.title.edit" />
		</logic:notEqual>
		<logic:equal name="editCreditCardForm" property="isActive" value="false">
			<fmt:message key="editCreditCardCompleted.title.reactivate" />
		</logic:equal>
	</skin:title>
	<skin:navImageAlt>
		<logic:notEqual name="editCreditCardForm" property="isActive" value="false">
			<fmt:message key="editCreditCardCompleted.navImageAlt.edit" />
		</logic:notEqual>
		<logic:equal name="editCreditCardForm" property="isActive" value="false">
			<fmt:message key="editCreditCardCompleted.navImageAlt.reactivate" />
		</logic:equal>
	</skin:navImageAlt>
	<skin:keywords><fmt:message key="editCreditCardCompleted.keywords" /></skin:keywords>
	<skin:description><fmt:message key="editCreditCardCompleted.description" /></skin:description>
	<%@include file="add-parents.inc.jsp" %>
	<skin:parent><%@include file="credit-card-manager.meta.inc.jsp" %></skin:parent>
	<skin:skin>
		<skin:content width="600">
			<skin:contentTitle>
				<logic:notEqual name="editCreditCardForm" property="isActive" value="false">
					<fmt:message key="editCreditCardCompleted.title.edit" />
				</logic:notEqual>
				<logic:equal name="editCreditCardForm" property="isActive" value="false">
					<fmt:message key="editCreditCardCompleted.title.reactivate" />
				</logic:equal>
			</skin:contentTitle>
			<skin:contentHorizontalDivider />
			<skin:contentLine>
				<logic:present scope="request" name="permissionDenied">
					<%@include file="../../_permission-denied.inc.jsp" %>
				</logic:present>
				<logic:notPresent scope="request" name="permissionDenied">
					<skin:lightArea>
						<b>
							<logic:notEqual name="editCreditCardForm" property="isActive" value="false">
								<fmt:message key="editCreditCardCompleted.successMessage.title.edit" />
							</logic:notEqual>
							<logic:equal name="editCreditCardForm" property="isActive" value="false">
								<fmt:message key="editCreditCardCompleted.successMessage.title.reactivate" />
							</logic:equal>
						</b>
						<ao:hr />
						<logic:notEqual name="editCreditCardForm" property="isActive" value="false">
							<fmt:message key="editCreditCardCompleted.successMessage.text.edit">
								<fmt:param value="${aoweb:getCardNumberDisplay(cardNumber)}" />
							</fmt:message><ao:br />
						</logic:notEqual>
						<logic:equal name="editCreditCardForm" property="isActive" value="false">
							<fmt:message key="editCreditCardCompleted.successMessage.text.reactivate">
								<fmt:param value="${aoweb:getCardNumberDisplay(cardNumber)}" />
							</fmt:message><ao:br />
						</logic:equal>
						<ul>
							<logic:equal scope="request" name="updatedCardDetails" value="true">
								<bean:define id="somethingChanged" value="true"/>
								<li><fmt:message key="editCreditCardCompleted.successMessage.updatedCardDetails" /></li>
							</logic:equal>
							<logic:equal scope="request" name="updatedCardNumber" value="true">
								<bean:define id="somethingChanged" value="true"/>
								<li><fmt:message key="editCreditCardCompleted.successMessage.updatedCardNumber" /></li>
							</logic:equal>
							<logic:equal scope="request" name="updatedExpirationDate" value="true">
								<bean:define id="somethingChanged" value="true"/>
								<li><fmt:message key="editCreditCardCompleted.successMessage.updatedExpirationDate" /></li>
							</logic:equal>
							<logic:equal scope="request" name="reactivatedCard" value="true">
								<bean:define id="somethingChanged" value="true"/>
								<li><fmt:message key="editCreditCardCompleted.successMessage.reactivatedCard" /></li>
							</logic:equal>
							<logic:notPresent name="somethingChanged">
								<li><fmt:message key="editCreditCardCompleted.successMessage.nothingChanged" /></li>
							</logic:notPresent>
						</ul>
						<html:link action="/credit-card-manager"><fmt:message key="editCreditCardCompleted.creditCardManager.link" /></html:link>
					</skin:lightArea>
				</logic:notPresent>
			</skin:contentLine>
		</skin:content>
	</skin:skin>
</fmt:bundle>

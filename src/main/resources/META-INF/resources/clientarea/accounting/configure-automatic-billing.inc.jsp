<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2015, 2016, 2018, 2019  AO Industries, Inc.
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
	<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
		<skin:path>
			/clientarea/accounting/configure-automatic-billing.do
			<ao:param name="account" value="${param.account}"/>
		</skin:path>
		<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
		<skin:title><fmt:message key="configureAutomaticBilling.title" /></skin:title>
		<skin:navImageAlt><fmt:message key="configureAutomaticBilling.navImageAlt" /></skin:navImageAlt>
		<skin:keywords><fmt:message key="configureAutomaticBilling.keywords" /></skin:keywords>
		<skin:description><fmt:message key="configureAutomaticBilling.description" /></skin:description>
		<%@include file="add-parents.inc.jsp" %>
		<skin:parent><%@include file="credit-card-manager.meta.inc.jsp" %></skin:parent>
		<skin:skin>
			<skin:content width="600">
				<skin:contentTitle><fmt:message key="configureAutomaticBilling.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<form id="configurationAutomaticBillingForm" method="post" action="<ao:url>configure-automatic-billing-completed.do</ao:url>"><div>
							<input name="account" type="hidden" value="<%= request.getParameter("account") %>" />
							<skin:lightArea>
								<fmt:message key="configureAutomaticBilling.cardList.title" />
								<hr />
								<fmt:message key="configureAutomaticBilling.account.label" />
								<ao:write scope="request" name="account" property="name" /><br />
								<br />
								<c:set var="hasDescription" value="false" />
								<c:forEach var="creditCard" items="${activeCards}">
									<c:if test="${!empty creditCard.description}">
										<c:set var="hasDescription" value="true" />
									</c:if>
								</c:forEach>
								<table cellspacing="0" cellpadding="4">
									<tr>
										<th><fmt:message key="configureAutomaticBilling.header.select" /></th>
										<th><fmt:message key="configureAutomaticBilling.header.cardType" /></th>
										<th><fmt:message key="configureAutomaticBilling.header.maskedCardNumber" /></th>
										<th><fmt:message key="configureAutomaticBilling.header.expirationDate" /></th>
										<c:if test="${hasDescription}">
											<th><fmt:message key="configureAutomaticBilling.header.description" /></th>
										</c:if>
									</tr>
									<logic:iterate scope="request" name="activeCards" id="creditCard" type="com.aoindustries.aoserv.client.payment.CreditCard" indexId="row">
										<skin:lightDarkTableRow>
											<td style="white-space:nowrap">
												<logic:notPresent scope="request" name="automaticCard">
													<input
														type="radio"
														id="pkey_<%= creditCard.getPkey() %>"
														name="pkey"
														value="<%= creditCard.getPkey() %>"
														onchange='this.form.submitButton.disabled=false;'
													/>
												</logic:notPresent>
												<logic:present scope="request" name="automaticCard">
													<logic:equal scope="request" name="automaticCard" property="pkey" value="<%= Integer.toString(creditCard.getPkey()) %>">
														<input
															type="radio"
															id="pkey_<%= creditCard.getPkey() %>"
															name="pkey"
															value="<%= creditCard.getPkey() %>"
															checked="checked"
															onchange='this.form.submitButton.disabled=true;'
														/>
													</logic:equal>
													<logic:notEqual scope="request" name="automaticCard" property="pkey" value="<%= Integer.toString(creditCard.getPkey()) %>">
														<input
															type="radio"
															id="pkey_<%= creditCard.getPkey() %>"
															name="pkey"
															value="<%= creditCard.getPkey() %>"
															onchange='this.form.submitButton.disabled=false;'
														/>
													</logic:notEqual>
												</logic:present>
											</td>
											<c:set var="cardNumber" value="${creditCard.cardInfo}"/>
											<td style="white-space:nowrap"><label for="pkey_<%= creditCard.getPkey() %>"><%@include file="_credit-card-image.inc.jsp" %></label></td>
											<td style="white-space:nowrap; font-family: monospace"><label for="pkey_<%= creditCard.getPkey() %>"><c:out value="${aoweb:getCardNumberDisplay(cardNumber)}"/></label></td>
											<td style="white-space:nowrap; font-family: monospace"><label for="pkey_<%= creditCard.getPkey() %>"><c:out value="${aoweb:getExpirationDisplay(creditCard.expirationMonth, creditCard.expirationYear)}"/></label></td>
											<c:if test="${hasDescription}">
												<td style="white-space:nowrap">
													<logic:notEmpty name="creditCard" property="description">
														<label for="pkey_<%= creditCard.getPkey() %>"><ao:write name="creditCard" property="description" /></label>
													</logic:notEmpty>
												</td>
											</c:if>
										</skin:lightDarkTableRow>
									</logic:iterate>
									<skin:lightDarkTableRow>
										<td style="white-space:nowrap">
											<logic:notPresent scope="request" name="automaticCard">
												<input type="radio" id="pkey_" name="pkey" value="" checked="checked" onchange='this.form.submitButton.disabled=true;' />
											</logic:notPresent>
											<logic:present scope="request" name="automaticCard">
												<input type="radio" id="pkey_" name="pkey" value="" onchange='this.form.submitButton.disabled=false;' />
											</logic:present>
										</td>
										<td style='white-space:nowrap' colspan="${fn:escapeXml(3 + (hasDescription ? 1 : 0))}"><label for="pkey_"><fmt:message key="configureAutomaticBilling.noAutomaticBilling" /></label></td>
									</skin:lightDarkTableRow>
									<tr>
										<td style='white-space:nowrap' colspan="${fn:escapeXml(4 + (hasDescription ? 1 : 0))}" align="center">
											<ao:input type="submit" name="submitButton"><fmt:message key="configureAutomaticBilling.field.submit.label" /></ao:input>
											<%-- Disable using JavaScript to avoid dependency on JavaScript --%>
											<ao:script>document.forms["configurationAutomaticBillingForm"].submitButton.disabled = true;</ao:script>
										</td>
									</tr>
								</table>
							</skin:lightArea>
						</div></form>
					</logic:notPresent>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

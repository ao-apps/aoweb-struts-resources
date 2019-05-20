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
<%@ page import="java.math.BigDecimal" %>
<%@include file="/_taglibs.inc.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
	<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
		<skin:path>/clientarea/accounting/make-payment.do</skin:path>
		<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
		<skin:title><fmt:message key="makePayment.title" /></skin:title>
		<skin:navImageAlt><fmt:message key="makePayment.navImageAlt" /></skin:navImageAlt>
		<skin:keywords><fmt:message key="makePayment.keywords" /></skin:keywords>
		<skin:description><fmt:message key="makePayment.description" /></skin:description>
		<%@include file="add-parents.inc.jsp" %>
		<skin:skin>
			<skin:content width="600">
				<skin:contentTitle><fmt:message key="makePayment.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<skin:lightArea>
						<fmt:message key="makePaymentStoredCardHold.hold.title" />
						<hr />
						<fmt:message key="makePaymentStoredCardHold.hold.followingProcessed">
							<fmt:param><c:out value="${reviewReason}" /></fmt:param>
						</fmt:message>
						<%-- Card stored --%>
						<logic:equal scope="request" name="cardStored" value="true">
							<fmt:message key="makePaymentNewCardCompleted.cardStored" />
						</logic:equal>

						<%-- Card store error --%>
						<logic:present scope="request" name="storeError">
							<fmt:message key="makePaymentNewCardCompleted.storeError" />
						</logic:present>

						<%-- Card set automatic --%>
						<logic:equal scope="request" name="cardSetAutomatic" value="true">
							<fmt:message key="makePaymentNewCardCompleted.cardSetAutomatic" />
						</logic:equal>

						<%-- Cart set automatic error --%>
						<logic:present scope="request" name="setAutomaticError">
							<fmt:message key="makePaymentNewCardCompleted.setAutomaticError" />
						</logic:present>

						<fmt:message key="makePaymentStoredCardHold.hold.detailsFollow" />

						<bean:define scope="request" name="business" id="business" type="com.aoindustries.aoserv.client.account.Account" />
						<bean:define scope="request" name="makePaymentNewCardForm" property="cardNumber" id="cardNumber" type="java.lang.String" />
						<bean:define scope="request" name="makePaymentNewCardForm" property="maskedCardNumber" id="maskedCardNumber" type="java.lang.String" />
						<table cellspacing='0' cellpadding='2'>
							<tr>
								<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.business.prompt" /></th>
								<td style="white-space:nowrap"><ao:write scope="request" name="business" /></td>
							</tr>
							<tr>
								<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.card.prompt" /></th>
								<td style="white-space:nowrap; font-family: monospace">
									<%@include file="_credit-card-image.inc.jsp" %>
									<c:out value="${aoweb:getCardDisplay(maskedCardNumber)}"/>
								</td>
							</tr>
							<tr>
								<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.cardComment.prompt" /></th>
								<td style="white-space:nowrap">
									<logic:notEmpty scope="request" name="makePaymentNewCardForm" property="description">
										<ao:write scope="request" name="makePaymentNewCardForm" property="description" />
									</logic:notEmpty>
									<logic:empty scope="request" name="makePaymentNewCardForm" property="description">
										&#160;
									</logic:empty>
								</td>
							</tr>
							<tr>
								<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
								<td style="white-space:nowrap">$<ao:write scope="request" name="transaction" property="transactionRequest.amount" /></td>
							</tr>
							<tr>
								<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCardCompleted.transid.prompt" /></th>
								<td style="white-space:nowrap"><ao:write scope="request" name="aoTransaction" property="transID" /></td>
							</tr>
							<tr>
								<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCardCompleted.approvalCode.prompt" /></th>
								<td style="white-space:nowrap"><ao:write scope="request" name="transaction" property="authorizationResult.approvalCode" /></td>
							</tr>
							<tr>
								<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCardCompleted.newBalance.prompt" /></th>
								<td style="white-space:nowrap">
									<% BigDecimal balance = business.getAccountBalance(); %>
									<% if(balance.signum()==0) { %>
										<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.zero" />
									<% } else if(balance.signum()<0) { %>
										<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.credit">
											<fmt:param><c:out value="<%= balance.negate().toPlainString() %>" /></fmt:param>
										</fmt:message>
									<% } else { %>
										<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.debt">
											<fmt:param><c:out value="<%= balance.toPlainString() %>" /></fmt:param>
										</fmt:message>
									<% } %>
								</td>
							</tr>
						</table><br />
						<fmt:message key="makePaymentStoredCardCompleted.contactAndThankYou" />
					</skin:lightArea><br />
					<%@include file="security-policy.inc.jsp" %>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

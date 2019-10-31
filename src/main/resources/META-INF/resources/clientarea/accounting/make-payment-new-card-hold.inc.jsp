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
					<b><fmt:message key="makePaymentStoredCardHold.hold.title" /></b>
					<ao:hr />
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

					<bean:define scope="request" name="makePaymentNewCardForm" property="cardNumber" id="cardNumber" type="java.lang.String" />
					<bean:define scope="request" name="makePaymentNewCardForm" property="maskedCardNumber" id="maskedCardNumber" type="java.lang.String" />
					<table cellspacing='0' cellpadding='4'>
						<tr>
							<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.account.prompt" /></th>
							<td style="white-space:nowrap"><ao:out value="${account.name}" /></td>
						</tr>
						<tr>
							<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.card.prompt" /></th>
							<td style="white-space:nowrap; font-family: monospace">
								<%@include file="_credit-card-image.inc.jsp" %>
								<c:out value="${aoweb:getCardNumberDisplay(maskedCardNumber)}"/>
							</td>
						</tr>
						<logic:notEmpty scope="request" name="makePaymentNewCardForm" property="description">
							<tr>
								<th style="white-space:nowrap;text-align:left"><fmt:message key="makePaymentStoredCard.cardComment.prompt" /></th>
								<td style="white-space:nowrap">
									<ao:write scope="request" name="makePaymentNewCardForm" property="description" />
								</td>
							</tr>
						</logic:notEmpty>
						<tr>
							<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
							<td style="white-space:nowrap"><ao:out value="${aoTransaction.amount.negate()}" /></td>
						</tr>
						<tr>
							<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCardCompleted.transid.prompt" /></th>
							<td style="white-space:nowrap"><ao:write scope="request" name="aoTransaction" property="transid" /></td>
						</tr>
						<tr>
							<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCardCompleted.approvalCode.prompt" /></th>
							<td style="white-space:nowrap"><ao:write scope="request" name="transaction" property="authorizationResult.approvalCode" /></td>
						</tr>
						<tr>
							<th style="white-space:nowrap;text-align:left"><fmt:message key="makePaymentStoredCardCompleted.newBalance.prompt" /></th>
							<td style="white-space:nowrap">
								<c:forEach var="balance" items="${account.accountBalance.values}">
									<ao:choose>
										<ao:when test="#{balance.unscaledValue < 0}">
											<div>
												<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.credit">
													<fmt:param><c:out value="${balance.negate()}" /></fmt:param>
												</fmt:message>
											</div>
										</ao:when>
										<ao:when test="#{balance.unscaledValue > 0}">
											<div style="color:red"><strong>
												<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.debt">
													<fmt:param><c:out value="${balance}" /></fmt:param>
												</fmt:message>
											</strong></div>
										</ao:when>
										<ao:otherwise>
											<div>
												<fmt:message key="makePaymentStoredCardCompleted.newBalance.value.zero">
													<fmt:param><c:out value="${balance}" /></fmt:param>
												</fmt:message>
											</div>
										</ao:otherwise>
									</ao:choose>
								</c:forEach>
							</td>
						</tr>
					</table><ao:br />
					<fmt:message key="makePaymentStoredCardCompleted.contactAndThankYou" />
				</skin:lightArea><ao:br />
				<%@include file="security-policy.inc.jsp" %>
			</skin:contentLine>
		</skin:content>
	</skin:skin>
</fmt:bundle>

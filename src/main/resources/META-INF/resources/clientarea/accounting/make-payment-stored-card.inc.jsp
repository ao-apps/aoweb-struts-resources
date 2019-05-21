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
		<skin:path>
			/clientarea/accounting/make-payment-stored-card.do
			<ao:param name="accounting"><ao:write scope="request" name="makePaymentStoredCardForm" property="accounting" /></ao:param>
			<ao:param name="pkey"><ao:write scope="request" name="makePaymentStoredCardForm" property="pkey" /></ao:param>
		</skin:path>
		<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
		<skin:title><fmt:message key="makePayment.title" /></skin:title>
		<skin:navImageAlt><fmt:message key="makePayment.navImageAlt" /></skin:navImageAlt>
		<skin:keywords><fmt:message key="makePayment.keywords" /></skin:keywords>
		<skin:description><fmt:message key="makePayment.description" /></skin:description>
		<%@include file="add-parents.inc.jsp" %>
		<skin:skin onload="document.forms['makePaymentStoredCardForm'].paymentAmount.select(); document.forms['makePaymentStoredCardForm'].paymentAmount.focus();">
			<skin:content width="600">
				<skin:contentTitle><fmt:message key="makePayment.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<html:form action="make-payment-stored-card-completed">
						<div>
							<html:hidden property="pkey" />
							<skin:lightArea>
								<fmt:message key="makePaymentStoredCard.amount.title" />
								<hr />
								<bean:define scope="request" name="creditCard" id="creditCard" type="com.aoindustries.aoserv.client.payment.CreditCard" />
								<bean:define scope="request" name="business" id="business" type="com.aoindustries.aoserv.client.account.Account" />
								<table cellspacing="0" cellpadding="2">
									<tr>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.business.prompt" /></th>
										<td style="white-space:nowrap"><html:hidden property="accounting" write="true" /></td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accounting" /></td>
									</tr>
									<tr>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.card.prompt" /></th>
										<td style="white-space:nowrap; font-family: monospace">
											<c:set var="cardNumber" value="${creditCard.cardInfo}"/>
											<%@include file="_credit-card-image.inc.jsp" %>
											<c:out value="${aoweb:getCardNumberDisplay(cardNumber)}"/>
										</td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="creditCard" /></td>
									</tr>
									<tr>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.cardComment.prompt" /></th>
										<td style="white-space:nowrap">
											<logic:notEmpty name="creditCard" property="description">
												<ao:write name="creditCard" property="description" />
											</logic:notEmpty>
											<logic:empty name="creditCard" property="description">
												&#160;
											</logic:empty>
										</td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="cardComment" /></td>
									</tr>
									<tr>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.accountBalance.prompt" /></th>
										<td style="white-space:nowrap">
											<% BigDecimal balance = business.getAccountBalance(); %>
											<% if(balance.signum()==0) { %>
												<fmt:message key="makePaymentSelectCard.balance.value.zero" />
											<% } else if(balance.signum()<0) { %>
												<fmt:message key="makePaymentSelectCard.balance.value.credit">
													<fmt:param><c:out value="<%= balance.negate().toPlainString() %>" /></fmt:param>
												</fmt:message>
											<% } else { %>
												<fmt:message key="makePaymentSelectCard.balance.value.debt">
													<fmt:param><c:out value="<%= balance.toPlainString() %>" /></fmt:param>
												</fmt:message>
											<% } %>
										</td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accountBalance" /></td>
									</tr>
									<tr>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
										<td style="white-space:nowrap">$<html:text property="paymentAmount" size="8" /></td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="paymentAmount" /></td>
									</tr>
									<tr>
										<td style="white-space:nowrap">&#160;</td>
										<td style='white-space:nowrap' colspan="2">
											<ao:input type="submit">
												<ao:onclick>
													this.disabled='true';
													this.form.submit();
													return false;
												</ao:onclick>
												<fmt:message key="makePaymentStoredCard.submit.label" />
											</ao:input>
										</td>
									</tr>
								</table>
							</skin:lightArea>
						</div>
					</html:form>
					<%@include file="security-policy.inc.jsp" %>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

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
<%@ page import="com.aoindustries.util.i18n.CurrencyUtil" %>
<%@ page import="com.aoindustries.util.i18n.Money" %>
<%@ page import="java.util.Currency" %>
<%@include file="/_taglibs.inc.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
	<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
		<skin:path>
			/clientarea/accounting/make-payment-stored-card.do
			<ao:param name="account"><ao:write scope="request" name="makePaymentStoredCardForm" property="account" /></ao:param>
			<ao:param name="currency"><ao:write scope="request" name="makePaymentStoredCardForm" property="currency" /></ao:param>
			<ao:param name="id"><ao:write scope="request" name="makePaymentStoredCardForm" property="id" /></ao:param>
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
							<html:hidden property="id" />
							<skin:lightArea>
								<fmt:message key="makePaymentStoredCard.amount.title" />
								<hr />
								<bean:define scope="request" name="creditCard" id="creditCard" type="com.aoindustries.aoserv.client.payment.CreditCard" />
								<table cellspacing="0" cellpadding="4">
									<tr>
										<th style="text-align:left; white-space:nowrap"><fmt:message key="makePaymentStoredCard.account.prompt" /></th>
										<td style="white-space:nowrap"><html:hidden property="account" write="true" /></td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="account" /></td>
									</tr>
									<tr>
										<th style="text-align:left; white-space:nowrap"><fmt:message key="makePaymentStoredCard.card.prompt" /></th>
										<td style="white-space:nowrap; font-family: monospace">
											<c:set var="cardNumber" value="${creditCard.cardInfo}"/>
											<%@include file="_credit-card-image.inc.jsp" %>
											<c:out value="${aoweb:getCardNumberDisplay(cardNumber)}"/>
										</td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="creditCard" /></td>
									</tr>
									<c:set var="expirationDisplay" value="${aoweb:getExpirationDisplay(creditCard.expirationMonth, creditCard.expirationYear)}"/>
									<c:if test="${!empty expirationDisplay}">
										<tr>
											<th style="text-align:left; white-space:nowrap;"><fmt:message key="makePaymentStoredCard.expirationDate.prompt" /></th>
											<td style="white-space:nowrap; font-family: monospace"><c:out value="${expirationDisplay}"/></td>
										</tr>
									</c:if>
									<logic:notEmpty name="creditCard" property="description">
										<tr>
											<th style="text-align:left; white-space:nowrap"><fmt:message key="makePaymentStoredCard.cardComment.prompt" /></th>
											<td style="white-space:nowrap">
												<ao:write name="creditCard" property="description" />
											</td>
											<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="cardComment" /></td>
										</tr>
									</logic:notEmpty>
									<bean:define scope="request" name="account" id="account" type="com.aoindustries.aoserv.client.account.Account" />
									<bean:define name="makePaymentStoredCardForm" id="creditCardForm" type="com.aoindustries.website.clientarea.accounting.MakePaymentStoredCardForm" />
									<% Currency currency = Currency.getInstance(creditCardForm.getCurrency()); %>
									<tr>
										<th style="text-align:left; white-space:nowrap"><fmt:message key="makePaymentStoredCard.accountBalance.prompt" /></th>
										<td style="white-space:nowrap">
											<%
												Money balance = account.getAccountBalance().get(currency);
												if(balance == null) balance = new Money(currency, 0, 0);
											%>
											<% if(balance.getUnscaledValue() == 0) { %>
												<fmt:message key="makePaymentSelectCard.balance.value.zero">
													<fmt:param><c:out value="<%= balance %>" /></fmt:param>
												</fmt:message>
											<% } else if(balance.getUnscaledValue() < 0) { %>
												<fmt:message key="makePaymentSelectCard.balance.value.credit">
													<fmt:param><c:out value="<%= balance.negate() %>" /></fmt:param>
												</fmt:message>
											<% } else { %>
												<fmt:message key="makePaymentSelectCard.balance.value.debt">
													<fmt:param><c:out value="<%= balance %>" /></fmt:param>
												</fmt:message>
											<% } %>
										</td>
										<td style="white-space:nowrap"><html:errors bundle="/clientarea/accounting/ApplicationResources" property="accountBalance" /></td>
									</tr>
									<tr>
										<th style="text-align:left; white-space:nowrap"><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
										<td style="white-space:nowrap">
											<html:hidden property="currency" />
											<bean:define scope="request" name="locale" id="locale" type="java.util.Locale" />
											<ao:out value="<%= CurrencyUtil.getSymbol(currency, locale) %>" /><html:text property="paymentAmount" size="8" />
										</td>
										<td style="white-space:nowrap">
											<html:errors bundle="/clientarea/accounting/ApplicationResources" property="currency" />
											<html:errors bundle="/clientarea/accounting/ApplicationResources" property="paymentAmount" />
										</td>
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

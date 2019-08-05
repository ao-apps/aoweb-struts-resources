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
			/clientarea/accounting/make-payment-new-card.do
			<ao:param name="account"><ao:write scope="request" name="makePaymentNewCardForm" property="account" /></ao:param>
			<ao:param name="currency"><ao:write scope="request" name="makePaymentNewCardForm" property="currency" /></ao:param>
		</skin:path>
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
					<skin:popupGroup>
						<html:form action="/make-payment-new-card-completed">
							<skin:lightArea>
								<fmt:message key="makePaymentNewCard.form.title" />
								<hr />
								<logic:present scope="request" name="errorReason">
									<fmt:message key="makePaymentStoredCardError.error.description">
										<fmt:param><c:out value="${errorReason}" /></fmt:param>
									</fmt:message>
									<hr />
								</logic:present>
								<logic:present scope="request" name="declineReason">
									<fmt:message key="makePaymentStoredCardDeclined.declined.description">
										<fmt:param><c:out value="${declineReason}" /></fmt:param>
									</fmt:message>
									<hr />
								</logic:present>
								<bean:define scope="request" name="account" id="account" type="com.aoindustries.aoserv.client.account.Account" />
								<table cellspacing="0" cellpadding="2">
									<bean:define name="makePaymentNewCardForm" id="creditCardForm" type="com.aoindustries.website.clientarea.accounting.MakePaymentNewCardForm" />
									<%@include file="credit-card-form.inc.jsp" %>
									<% Currency currency = Currency.getInstance(creditCardForm.getCurrency()); %>
									<tr>
										<td style="white-space:nowrap"><fmt:message key="creditCardForm.required.no" /></td>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.accountBalance.prompt" /></th>
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
										<td style="white-space:nowrap"><fmt:message key="creditCardForm.required.yes" /></td>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentStoredCard.paymentAmount.prompt" /></th>
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
										<td style="white-space:nowrap"><fmt:message key="creditCardForm.required.no" /></td>
										<th style='white-space:nowrap' align='left'><fmt:message key="makePaymentNewCard.storeCard.prompt" /></th>
										<td style='white-space:nowrap' colspan="2">
											<label><html:radio property="storeCard" value=""><fmt:message key="makePaymentNewCard.storeCard.no" /></html:radio></label><br />
											<label><html:radio property="storeCard" value="store"><fmt:message key="makePaymentNewCard.storeCard.store" /></html:radio></label><br />
											<label><html:radio property="storeCard" value="automatic"><fmt:message key="makePaymentNewCard.storeCard.automatic" /></html:radio></label>
										</td>
									</tr>
									<tr><td style='white-space:nowrap' colspan="4" align="center">
										<ao:input type="submit">
											<ao:onclick>
												this.disabled='true';
												this.form.submit();
												return false;
											</ao:onclick>
											<fmt:message key="makePaymentNewCard.field.submit.label" />
										</ao:input>
									</td></tr>
								</table>
							</skin:lightArea>
						</html:form>
						<%@include file="security-policy.inc.jsp" %>
					</skin:popupGroup>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

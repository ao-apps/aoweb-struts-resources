<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2018, 2019  AO Industries, Inc.
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

<%-- TODO: <ao:form> --%>
<form method="post" action="<ao:url>make-payment-stored-card.do</ao:url>">
	<div>
		<ao:input name="account" type="hidden" value="${param.account}" />
		<ao:input name="currency" type="hidden" value="${param.currency}" />
		<skin:lightArea>
			<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
				<fmt:message key="makePaymentSelectCard.selectCard.list.title" />
				<hr />
				<c:set var="hasDescription" value="false" />
				<c:forEach var="creditCard" items="${creditCards}">
					<c:if test="${!empty creditCard.description}">
						<c:set var="hasDescription" value="true" />
					</c:if>
				</c:forEach>
				<table cellspacing="0" cellpadding="4">
					<tr>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.select.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardType.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardNumber.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.expirationDate.header" /></th>
						<c:if test="${hasDescription}">
							<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.comments.header" /></th>
						</c:if>
					</tr>
					<logic:iterate scope="request" name="creditCards" id="creditCard" type="com.aoindustries.aoserv.client.payment.CreditCard">
						<skin:lightDarkTableRow>
							<td style="white-space:nowrap">
								<logic:equal scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
									<input
										type="radio"
										id="id_<%= creditCard.getId() %>"
										name="id"
										value="<%= creditCard.getId() %>"
										checked="checked"
									/>
								</logic:equal>
								<logic:notEqual scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
									<input
										type="radio"
										id="id_<%= creditCard.getId() %>"
										name="id"
										value="<%= creditCard.getId() %>"
									/>
								</logic:notEqual>
							</td>
							<c:set var="cardNumber" value="${creditCard.cardInfo}"/>
							<td style="white-space:nowrap"><label for="id_<%= creditCard.getId() %>"><%@include file="_credit-card-image.inc.jsp" %></label></td>
							<td style="white-space:nowrap; font-family: monospace"><label for="id_<%= creditCard.getId() %>"><c:out value="${aoweb:getCardNumberDisplay(cardNumber)}"/></label></td>
							<td style="white-space:nowrap; font-family: monospace"><label for="id_<%= creditCard.getId() %>"><c:out value="${aoweb:getExpirationDisplay(creditCard.expirationMonth, creditCard.expirationYear)}"/></label></td>
							<c:if test="${hasDescription}">
								<td style="white-space:nowrap">
									<logic:notEmpty name="creditCard" property="description">
										<label for="id_<%= creditCard.getId() %>"><ao:write name="creditCard" property="description" /></label>
									</logic:notEmpty>
								</td>
							</c:if>
						</skin:lightDarkTableRow>
					</logic:iterate>
					<skin:lightDarkTableRow>
						<td style="white-space:nowrap">
							<logic:equal scope="request" name="lastPaymentCreditCard" value="">
								<input type="radio" id="id_" name="id" value="" checked="checked" />
							</logic:equal>
							<logic:notEqual scope="request" name="lastPaymentCreditCard" value="">
								<input type="radio" id="id_" name="id" value="" />
							</logic:notEqual>
						</td>
						<td style='white-space:nowrap' colspan="${fn:escapeXml(3 + (hasDescription ? 1 : 0))}"><label for="id_"><fmt:message key="makePaymentSelectCard.newCard.link" /></label></td>
					</skin:lightDarkTableRow>
					<tr>
						<td style='white-space:nowrap' colspan="${fn:escapeXml(4 + (hasDescription ? 1 : 0))}" align="center">
							<ao:input type="submit" name="submitButton"><fmt:message key="makePaymentSelectCard.field.submit.label" /></ao:input>
						</td>
					</tr>
				</table>
			</fmt:bundle>
		</skin:lightArea>
		<%@include file="security-policy.inc.jsp" %>
	</div>
</form>

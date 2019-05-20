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

<form method="post" action="<ao:url>make-payment-stored-card.do</ao:url>">
	<div>
		<input name="accounting" type="hidden" value="<%= request.getParameter("accounting") %>" />
		<skin:lightArea>
			<fmt:bundle basename="com.aoindustries.website.clientarea.accounting.ApplicationResources">
				<fmt:message key="makePaymentSelectCard.selectCard.list.title" />
				<hr />
				<table cellspacing="0" cellpadding="2">
					<tr>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.select.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardType.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.cardNumber.header" /></th>
						<th style='white-space:nowrap'><fmt:message key="makePaymentSelectCard.comments.header" /></th>
					</tr>
					<logic:iterate scope="request" name="creditCards" id="creditCard" type="com.aoindustries.aoserv.client.payment.CreditCard">
						<skin:lightDarkTableRow>
							<td style="white-space:nowrap">
								<%-- TODO: label for this input --%>
								<logic:equal scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
									<input type="radio" name="pkey" value="<%= creditCard.getPkey() %>" checked="checked" />
								</logic:equal>
								<logic:notEqual scope="request" name="lastPaymentCreditCard" value="<%= creditCard.getProviderUniqueId() %>">
									<input type="radio" name="pkey" value="<%= creditCard.getPkey() %>" />
								</logic:notEqual>
							</td>
							<c:set var="cardNumber" value="${creditCard.cardInfo}"/>
							<td style="white-space:nowrap"><%@include file="_credit-card-image.inc.jsp" %></td>
							<td style="white-space:nowrap; font-family: monospace"><c:out value="${aoweb:getCardDisplay(cardNumber)}"/></td>
							<td style="white-space:nowrap">
								<logic:notEmpty name="creditCard" property="description">
									<ao:write name="creditCard" property="description" />
								</logic:notEmpty>
								<logic:empty name="creditCard" property="description">
									&#160;
								</logic:empty>
							</td>
						</skin:lightDarkTableRow>
					</logic:iterate>
					<skin:lightDarkTableRow>
						<td style="white-space:nowrap">
							<%-- TODO: label for this input --%>
							<logic:equal scope="request" name="lastPaymentCreditCard" value="">
								<input type="radio" name="pkey" value="" checked="checked" />
							</logic:equal>
							<logic:notEqual scope="request" name="lastPaymentCreditCard" value="">
								<input type="radio" name="pkey" value="" />
							</logic:notEqual>
						</td>
						<td style='white-space:nowrap' colspan="3"><fmt:message key="makePaymentSelectCard.newCard.link" /></td>
					</skin:lightDarkTableRow>
					<tr>
						<td style='white-space:nowrap' colspan="4" align="center">
							<ao:input type="submit" name="submitButton"><fmt:message key="makePaymentSelectCard.field.submit.label" /></ao:input>
						</td>
					</tr>
				</table>
			</fmt:bundle>
		</skin:lightArea>
		<%@include file="security-policy.inc.jsp" %>
	</div>
</form>

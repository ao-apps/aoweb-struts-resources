<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2003-2013, 2015, 2016, 2018, 2019  AO Industries, Inc.
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
<%@ page import="com.aoindustries.aoserv.client.account.Account" %>
<%@ page import="com.aoindustries.util.i18n.Monies" %>
<%@ page import="com.aoindustries.util.i18n.Money" %>
<%@include file="/_taglibs.inc.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
	<%@include file="add-parents.inc.jsp" %>
	<%@include file="cancel.meta.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
				<skin:contentTitle><fmt:message key="account.cancel.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<aoweb:scriptGroup>
							<table cellpadding='0' cellspacing='0'>
								<tr>
									<td><%@include file="cancel-message.inc.jsp" %></td>
								</tr>
								<tr>
									<td align='center'>
										<c:choose>
											<c:when test="${param.all}">
												<ao:a href="cancel.do">
													<fmt:message key="account.cancel.link.showActive" />
												</ao:a>
											</c:when>
											<c:otherwise>
												<ao:a href="cancel.do?all=true">
													<fmt:message key="account.cancel.link.showAll" />
												</ao:a>
											</c:otherwise>
										</c:choose>
										<skin:lightArea>
											<table cellspacing='0' cellpadding='2'>
												<tr>
													<th rowspan="2"><fmt:message key="account.cancel.header.accountName" /></th>
													<th rowspan="2"><fmt:message key="account.cancel.header.parent" /></th>
													<th colspan="2"><fmt:message key="account.cancel.header.totalMonthlyCharges" /></th>
													<th rowspan="2"><fmt:message key="account.cancel.header.accountBalance" /></th>
													<th rowspan="2"><fmt:message key="account.cancel.header.created" /></th>
													<th rowspan="2"><fmt:message key="account.cancel.header.canceled" /></th>
													<th rowspan="2"><fmt:message key="account.cancel.header.actions" /></th>
												</tr>
												<tr>
													<th><fmt:message key="account.cancel.header.totalMonthlyCharges.source" /></th>
													<th><fmt:message key="account.cancel.header.totalMonthlyCharges.billedTo" /></th>
												</tr>
												<logic:iterate scope="request" name="accounts" id="account" type="com.aoindustries.aoserv.client.account.Account">
													<c:if test="${param.all || account.canceled == null || !account.accountBalance.isZero()}">
														<skin:lightDarkTableRow>
															<td>
																<logic:notEmpty name="account" property="profile">
																	<bean:define name="account" property="profile" id="bp" type="com.aoindustries.aoserv.client.account.Profile" />
																	<fmt:message key="account.cancel.field.organizationNameAndAccountName">
																		<fmt:param><c:out value="${account.profile.name}" /></fmt:param>
																		<fmt:param><c:out value="${account.name}" /></fmt:param>
																	</fmt:message>
																</logic:notEmpty>
																<logic:empty name="account" property="profile">
																	<fmt:message key="account.cancel.field.accountName">
																		<fmt:param><c:out value="${account.name}" /></fmt:param>
																	</fmt:message>
																</logic:empty>
															</td>
															<td>
																<logic:empty name="account" property="parent">&#160;</logic:empty>
																<logic:notEmpty name="account" property="parent">
																	<bean:define name="account" property="parent" id="parent" type="com.aoindustries.aoserv.client.account.Account" />
																	<logic:notEmpty name="parent" property="profile">
																		<bean:define name="parent" property="profile" id="parentBP" type="com.aoindustries.aoserv.client.account.Profile" />
																		<fmt:message key="account.cancel.field.organizationNameAndAccountName">
																			<fmt:param><c:out value="${parentBP.name}" /></fmt:param>
																			<fmt:param><c:out value="${parent.name}" /></fmt:param>
																		</fmt:message>
																	</logic:notEmpty>
																	<logic:empty name="parent" property="profile">
																		<fmt:message key="account.cancel.field.accountName">
																			<fmt:param><c:out value="${parent.name}" /></fmt:param>
																		</fmt:message>
																	</logic:empty>
																</logic:notEmpty>
															</td>
															<td style="text-align:right; white-space:nowrap">
																<% Monies totalMonthlyRate = account.getMonthlyRate(); %>
																<% if(totalMonthlyRate != null) { %>
																	<% for(Money monthlyRate : totalMonthlyRate) { %>
																		<div>
																			<fmt:message key="account.cancel.field.totalMonthlyRate">
																				<fmt:param><c:out value="<%= monthlyRate %>" /></fmt:param>
																			</fmt:message>
																		</div>
																	<% } %>
																<% } %>
															</td>
															<td style="text-align:right; white-space:nowrap">
																<% Monies billingMonthlyRate = account.getBillingMonthlyRate(); %>
																<% if(billingMonthlyRate != null && !billingMonthlyRate.isEmpty()) { %>
																	<% for(Money monthlyRate : billingMonthlyRate) { %>
																		<div>
																			<fmt:message key="account.cancel.field.totalMonthlyRate">
																				<fmt:param><c:out value="<%= monthlyRate %>" /></fmt:param>
																			</fmt:message>
																		</div>
																	<% } %>
																<% } else { %>
																	<% Account billingAccount = account.getBillingAccount(); %>
																	<% if(!account.equals(billingAccount)) { %>
																		<div><ao:out value="<%= billingAccount %>" /></div>
																	<% } %>
																<% } %>
															</td>
															<td style="text-align:right; white-space:nowrap">
																<% for(Money balance : account.getAccountBalance()) { %>
																	<% if(balance.getUnscaledValue() < 0) { %>
																		<div>
																			<fmt:message key="account.cancel.field.balance.credit">
																				<fmt:param><c:out value="<%= balance.negate() %>" /></fmt:param>
																			</fmt:message>
																		</div>
																	<% } else if(balance.getUnscaledValue() > 0) { %>
																		<div style="color:red"><strong>
																			<fmt:message key="account.cancel.field.balance.debt">
																				<fmt:param><c:out value="<%= balance %>" /></fmt:param>
																			</fmt:message>
																		</strong></div>
																	<% } %>
																<% } %>
															</td>
															<td><aoweb:date><ao:write name="account" property="created.time" /></aoweb:date></td>
															<td>
																<% java.sql.Timestamp canceled = account.getCanceled(); %>
																<% if(canceled == null) { %>
																	&#160;
																<% } else { %>
																	<aoweb:date><%= canceled.getTime() %></aoweb:date>
																<% } %>
															</td>
															<td>
																<% if(!account.canCancel()) { %>
																	&#160;
																<% } else { %>
																	<html:link action="/account/cancel-feedback" paramId="account" paramName="account" paramProperty="name">
																		<fmt:message key="account.cancel.field.link.cancel" />
																	</html:link>
																<% } %>
															</td>
														</skin:lightDarkTableRow>
													</c:if>
												</logic:iterate>
											</table>
										</skin:lightArea>
										<c:choose>
											<c:when test="${param.all}">
												<ao:a href="cancel.do">
													<fmt:message key="account.cancel.link.showActive" />
												</ao:a>
											</c:when>
											<c:otherwise>
												<ao:a href="cancel.do?all=true">
													<fmt:message key="account.cancel.link.showAll" />
												</ao:a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</aoweb:scriptGroup>
					</logic:notPresent>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

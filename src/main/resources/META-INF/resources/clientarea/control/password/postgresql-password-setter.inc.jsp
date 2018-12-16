<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2016, 2018  AO Industries, Inc.
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
	<%@include file="add-parents.inc.jsp" %>
	<%@include file="postgresql-password-setter.meta.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
				<skin:contentTitle><fmt:message key="password.postgreSQLPasswordSetter.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<logic:empty scope="request" name="postgreSQLPasswordSetterForm" property="packages">
							<b><fmt:message key="password.postgreSQLPasswordSetter.noAccounts" /></b>
						</logic:empty>
						<logic:notEmpty scope="request" name="postgreSQLPasswordSetterForm" property="packages">
							<html:form action="/password/postgresql-password-setter-completed">
								<skin:lightArea>
									<table cellspacing='0' cellpadding='2'>
										<tr>
											<bean:size scope="request" name="aoConn" property="billing.Package.map" id="packagesSize" />
											<logic:greaterThan name="packagesSize" value="1">
												<th><fmt:message key="password.postgreSQLPasswordSetter.header.package" /></th>
											</logic:greaterThan>
											<th><fmt:message key="password.postgreSQLPasswordSetter.header.username" /></th>
											<bean:size scope="request" name="aoConn" property="postgresql.Server.map" id="postgresServersSize" />
											<logic:greaterThan name="postgresServersSize" value="1">
												<th><fmt:message key="password.postgreSQLPasswordSetter.header.postgreSQLServer" /></th>
											</logic:greaterThan>
											<bean:size scope="request" name="aoConn" property="linux.Server.map" id="aoServersSize" />
											<logic:greaterThan name="aoServersSize" value="1">
												<th><fmt:message key="password.postgreSQLPasswordSetter.header.aoServer" /></th>
											</logic:greaterThan>
											<th colspan='2'><fmt:message key="password.postgreSQLPasswordSetter.header.newPassword" /></th>
											<th><fmt:message key="password.postgreSQLPasswordSetter.header.confirmPassword" /></th>
											<th>&#160;</th>
										</tr>
										<logic:iterate scope="request" name="postgreSQLPasswordSetterForm" property="packages" id="pack" indexId="index">
											<tr>
												<logic:greaterThan name="packagesSize" value="1">
													<td><ao:write name="pack" /></td>
												</logic:greaterThan>
												<td>
													<html:hidden property='<%= "packages[" + index + "]" %>' />
													<code><html:hidden property='<%= "usernames[" + index + "]" %>' write="true" /></code>
													<html:hidden property='<%= "postgreSQLServers[" + index + "]" %>' />
													<html:hidden property='<%= "aoServers[" + index + "]" %>' />
												</td>
												<logic:greaterThan name="postgresServersSize" value="1">
													<td><code><ao:write name="postgreSQLPasswordSetterForm" property='<%= "postgreSQLServers[" + index + "]" %>' /></code></td>
												</logic:greaterThan>
												<logic:greaterThan name="aoServersSize" value="1">
													<td><code><ao:write name="postgreSQLPasswordSetterForm" property='<%= "aoServers[" + index + "]" %>' /></code></td>
												</logic:greaterThan>
												<td><html:password size="20" property='<%= "newPasswords[" + index + "]" %>' /></td>
												<td style="white-space:nowrap">
													<html:errors bundle="/clientarea/control/ApplicationResources" property='<%= "newPasswords[" + index + "].newPasswords" %>' />
													<html:messages id="message" message="true" bundle="/clientarea/control/ApplicationResources" property='<%= "newPasswords[" + index + "].newPasswords" %>'>
														<ao:write name="message" /><br />
													</html:messages>
												</td>
												<td><html:password size="20" property='<%= "confirmPasswords[" + index + "]" %>' /></td>
												<td style="white-space:nowrap">
													<html:errors bundle="/clientarea/control/ApplicationResources" property='<%= "confirmPasswords[" + index + "].confirmPasswords" %>' />
													<html:messages id="message" message="true" bundle="/clientarea/control/ApplicationResources" property='<%= "confirmPasswords[" + index + "].confirmPasswords" %>'>
														<ao:write name="message" /><br />
													</html:messages>
												</td>
											</tr>
										</logic:iterate>
										<tr><td colspan='8' align='center'><ao:input type="submit"><fmt:message key="password.postgreSQLPasswordSetter.field.submit.label" /></ao:input></td></tr>
									</table>
								</skin:lightArea>
							</html:form>
						</logic:notEmpty>
					</logic:notPresent>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

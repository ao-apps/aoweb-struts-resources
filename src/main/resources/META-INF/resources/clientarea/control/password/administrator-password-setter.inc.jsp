<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2016, 2018, 2019, 2020  AO Industries, Inc.
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

<%@include file="add-parents.inc.jsp" %>
<%@include file="administrator-password-setter.meta.inc.jsp" %>
<skin:skin>
	<skin:content width="600">
		<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
			<skin:contentTitle><fmt:message key="password.administratorPasswordSetter.title" /></skin:contentTitle>
			<skin:contentHorizontalDivider />
			<skin:contentLine>
				<logic:empty scope="request" name="administratorPasswordSetterForm" property="packages">
					<b><fmt:message key="password.administratorPasswordSetter.noAccounts" /></b>
				</logic:empty>
				<logic:notEmpty scope="request" name="administratorPasswordSetterForm" property="packages">
					<html:form action="/password/administrator-password-setter-completed">
						<skin:lightArea>
							<table class="noborder">
								<thead>
									<tr>
										<bean:size scope="request" name="aoConn" property="billing.Package.map" id="packagesSize" />
										<logic:greaterThan name="packagesSize" value="1">
											<th><fmt:message key="password.administratorPasswordSetter.header.package" /></th>
										</logic:greaterThan>
										<th><fmt:message key="password.administratorPasswordSetter.header.username" /></th>
										<th colspan='2'><fmt:message key="password.administratorPasswordSetter.header.newPassword" /></th>
										<th><fmt:message key="password.administratorPasswordSetter.header.confirmPassword" /></th>
										<th>&#160;</th>
									</tr>
								</thead>
								<tbody>
									<logic:iterate scope="request" name="administratorPasswordSetterForm" property="packages" id="pack" indexId="index">
										<tr>
											<logic:greaterThan name="packagesSize" value="1">
												<td><ao:write name="pack" /></td>
											</logic:greaterThan>
											<td>
												<html:hidden property='<%= "packages[" + index + "]" %>' />
												<code><html:hidden property='<%= "usernames[" + index + "]" %>' write="true" /></code>
											</td>
											<td><html:password size="20" property='<%= "newPasswords[" + index + "]" %>' /></td>
											<td style="white-space:nowrap">
												<html:errors bundle="/clientarea/control/ApplicationResources" property='<%= "newPasswords[" + index + "].newPasswords" %>' />
												<html:messages id="message" message="true" bundle="/clientarea/control/ApplicationResources" property='<%= "newPasswords[" + index + "].newPasswords" %>'>
													<ao:write name="message" /><ao:br />
												</html:messages>
											</td>
											<td><html:password size="20" property='<%= "confirmPasswords[" + index + "]" %>' /></td>
											<td style="white-space:nowrap">
												<html:errors bundle="/clientarea/control/ApplicationResources" property='<%= "confirmPasswords[" + index + "].confirmPasswords" %>' />
												<html:messages id="message" message="true" bundle="/clientarea/control/ApplicationResources" property='<%= "confirmPasswords[" + index + "].confirmPasswords" %>'>
													<ao:write name="message" /><ao:br />
												</html:messages>
											</td>
										</tr>
									</logic:iterate>
								</tbody>
								<tfoot>
									<tr><td colspan="6" style="text-align:center"><ao:input type="submit"><fmt:message key="password.administratorPasswordSetter.field.submit.label" /></ao:input></td></tr>
								</tfoot>
							</table>
						</skin:lightArea>
					</html:form>
				</logic:notEmpty>
			</skin:contentLine>
		</fmt:bundle>
	</skin:content>
</skin:skin>

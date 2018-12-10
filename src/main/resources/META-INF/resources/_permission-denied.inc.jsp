<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2015, 2016, 2018  AO Industries, Inc.
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
<%--
This is intended to be used by other JSP pages, not to be used directly.
It only provides the content of the page.
--%>
<bean:define scope="request" name="locale" id="locale" type="java.util.Locale" />
<skin:lightArea>
	<fmt:bundle basename="com.aoindustries.website.ApplicationResources">
		<b><fmt:message key="permissionDenied.permissionDenied" /></b>
		<hr />
		<logic:present scope="request" name="permissionDenied">
			<logic:empty scope="request" name="permissionDenied">
				<fmt:message key="permissionDenied.noPermissionInformation" />
			</logic:empty>
			<logic:notEmpty scope="request" name="permissionDenied">
				<bean:size scope="request" name="permissionDenied" id="permissionDeniedSize" />
				<logic:equal name="permissionDeniedSize" value="1">
					<fmt:message key="permissionDenied.theFollowingPermissionRequired" />
					<logic:iterate scope="request" name="permissionDenied" id="andPermission" type="com.aoindustries.aoserv.client.master.Permission">
						<p>
							<table cellspacing='0' cellpadding='2'>
								<tr>
									<td style="white-space:nowrap"><b><fmt:message key="permissionDenied.permission.display" /></b></td>
									<td style="white-space:nowrap"><ao:write name="andPermission" /></td>
								</tr>
								<tr>
									<td style="white-space:nowrap"><b><fmt:message key="permissionDenied.permission.description" /></b></td>
									<td style="white-space:nowrap"><ao:write name="andPermission" method="getDescription" /></td>
								</tr>
							</table>
						</p>
					</logic:iterate>
				</logic:equal>
				<logic:notEqual name="permissionDeniedSize" value="1">
					<fmt:message key="permissionDenied.allOfTheFollowingPermissionsRequired" />
					<p>
						<table cellspacing='0' cellpadding='2'>
							<tr>
								<th style='white-space:nowrap'><fmt:message key="permissionDenied.andPermissions.header.display" /></th>
								<th style='white-space:nowrap'><fmt:message key="permissionDenied.andPermissions.header.description" /></th>
								<th style='white-space:nowrap'><fmt:message key="permissionDenied.andPermissions.header.hasPermission" /></th>
							</tr>
							<bean:define scope="request" name="aoConn" property="thisBusinessAdministrator" id="thisBusinessAdministrator" type="com.aoindustries.aoserv.client.account.Administrator" />
							<logic:iterate scope="request" name="permissionDenied" id="andPermission" type="com.aoindustries.aoserv.client.master.Permission">
								<tr>
									<td style="white-space:nowrap"><ao:write name="andPermission" /></td>
									<td style="white-space:nowrap"><ao:write name="andPermission" method="getDescription" /></td>
									<td style="white-space:nowrap">
										<% if(thisBusinessAdministrator.hasPermission(andPermission)) { %>
											<fmt:message key="permissionDenied.andPermissions.header.hasPermission.yes" />
										<% } else { %>
											<fmt:message key="permissionDenied.andPermissions.header.hasPermission.no" />
										<% } %>
									</td>
								</tr>
							</logic:iterate>
						</table>
					</p>
				</logic:notEqual>
			</logic:notEmpty>
		</logic:present>
		<logic:notPresent scope="request" name="permissionDenied">
			<fmt:message key="permissionDenied.noPermissionInformation" />
		</logic:notPresent>
	</fmt:bundle>
</skin:lightArea>

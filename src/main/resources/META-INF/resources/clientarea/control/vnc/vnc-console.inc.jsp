<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2009, 2016, 2019  AO Industries, Inc.
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
	<%@include file="../add-parents.inc.jsp" %>
	<%@include file="vnc-console.meta.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
				<skin:contentTitle><fmt:message key="vnc.vncConsole.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<skin:lightArea>
							<logic:empty scope="request" name="vncVirtualServers">
								<fmt:message key="vnc.vncConsole.noServers" />
							</logic:empty>
							<logic:notEmpty scope="request" name="vncVirtualServers">
								<table>
									<tr>
										<th><fmt:message key="vnc.vncConsole.server.header" /></th>
										<th><fmt:message key="vnc.vncConsole.host.header" /></th>
										<th><fmt:message key="vnc.vncConsole.sslRequired.header" /></th>
										<th><fmt:message key="vnc.vncConsole.password.header" /></th>
										<th><fmt:message key="vnc.vncConsole.connectNow.header" /></th>
									</tr>
									<logic:iterate scope="request" name="vncVirtualServers" id="vncVirtualServer">
										<skin:lightDarkTableRow>
											<td><bean:write name="vncVirtualServer" property="host.name" /></td>
											<td>
												<c:choose>
													<c:when test="${siteSettings.brand.aowebStrutsVncBind.port.port < 5900}">
														<c:out value="${siteSettings.brand.aowebStrutsHttpsURL.host}" />::<c:out value="${siteSettings.brand.aowebStrutsVncBind.port.port}" />
													</c:when>
													<c:otherwise>
														<c:out value="${siteSettings.brand.aowebStrutsHttpsURL.host}" />:<c:out value="${siteSettings.brand.aowebStrutsVncBind.port.port - 5900}" />
													</c:otherwise>
												</c:choose>
											</td>
											<td><fmt:message key="vnc.vncConsole.sslRequired.yes" /></td>
											<td><code><c:out value="${vncVirtualServer.vncPassword}" /></code></td>
											<td style="white-space:nowrap">
												<html:link action="/vnc/vnc-viewer.do" onclick="window.open(this.href, 'vnc'+(new Date()).getTime(), 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=380,height=200,left='+((screen.availWidth-380)/2-64)+',top='+((screen.availHeight-200)/2-48)); return false;">
													<html:param name="virtualServer">${vncVirtualServer.host.pkey}</html:param>
													<fmt:message key="vnc.vncConsole.connectNow.link" />
												</html:link>
											</td>
										</skin:lightDarkTableRow>
									</logic:iterate>
								</table>
							</logic:notEmpty>
						</skin:lightArea>
					</logic:notPresent>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

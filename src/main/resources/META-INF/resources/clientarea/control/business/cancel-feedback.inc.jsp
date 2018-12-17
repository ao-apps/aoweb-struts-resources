<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2003-2009, 2015, 2016, 2018  AO Industries, Inc.
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
	<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
		<skin:path>/clientarea/control/business/cancel-feedback.do?business=${business.name}</skin:path>
		<logic:equal name="siteSettings" property="brand.aowebStrutsNoindex" value="true"><skin:meta name="ROBOTS">NOINDEX</skin:meta></logic:equal>
		<skin:title><fmt:message key="business.cancel.title" /></skin:title>
		<skin:navImageAlt><fmt:message key="business.cancel.navImageAlt" /></skin:navImageAlt>
		<skin:keywords><fmt:message key="business.cancel.keywords" /></skin:keywords>
		<skin:description><fmt:message key="business.cancel.description" /></skin:description>
		<skin:skin>
			<skin:content width="600">
				<skin:contentTitle><fmt:message key="business.cancel.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<logic:present scope="request" name="permissionDenied">
						<%@include file="../../../_permission-denied.inc.jsp" %>
					</logic:present>
					<logic:notPresent scope="request" name="permissionDenied">
						<skin:lightArea>
							<fmt:message key="business.cancel-feedback.prompt">
								<fmt:param><c:out value="${business.name}" /></fmt:param>
							</fmt:message>
							<html:form action="/business/cancel-feedback-completed">
								<div>
									<html:hidden property="business" />
									<html:textarea property="reason" rows="16" cols="80" />
								</div>
								<div style="text-align:center; margin-top:1em;">
									<ao:input type="submit"><fmt:message key="business.cancel-feedback.submit.label" /></ao:input>
								</div>
							</html:form>
						</skin:lightArea>
					</logic:notPresent>
				</skin:contentLine>
			</skin:content>
		</skin:skin>
	</fmt:bundle>
</html:html>

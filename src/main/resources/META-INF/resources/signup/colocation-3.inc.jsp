<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2009, 2015, 2016, 2019, 2020, 2021  AO Industries, Inc.
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

<ao:bundle basename="com.aoindustries.web.struts.signup.i18n.ApplicationResources">
	<skin:path>/signup/colocation-3.do</skin:path>
	<skin:title><ao:message key="colocation.title" /></skin:title>
	<skin:navImageAlt><ao:message key="colocation.navImageAlt" /></skin:navImageAlt>
	<skin:keywords><ao:message key="colocation.keywords" /></skin:keywords>
	<skin:description><ao:message key="colocation.description" /></skin:description>
	<%@include file="add-parents.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<skin:contentTitle><ao:message key="colocation.title" /></skin:contentTitle>
			<skin:contentHorizontalDivider />
			<skin:contentLine>
				<bean:define toScope="request" type="java.lang.String" id="stepNumber" value="3" />
				<bean:define type="java.lang.String" id="actionPrefix" toScope="request" value="colocation" />
				<%@include file="minimal-steps.inc.jsp" %>
				<ao:br />
				<html:form action="/colocation-3-completed.do">
					<%@include file="signup-technical-form.inc.jsp" %>
				</html:form>
			</skin:contentLine>
		</skin:content>
	</skin:skin>
</ao:bundle>

<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2019, 2020, 2021  AO Industries, Inc.
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

<aoweb:exists path="/clientarea/accounting/security-policy.override.inc.jsp">
	<jsp:include page="/clientarea/accounting/security-policy.override.inc.jsp" />
</aoweb:exists>
<aoweb:notExists path="/clientarea/accounting/security-policy.override.inc.jsp">
	<ao:br />
	<skin:lightArea width="500">
		<ao:bundle basename="com.aoindustries.web.struts.clientarea.accounting.i18n.ApplicationResources">
			<b><ao:message key="securityPolicy.securityNotice.title" /></b>
			<ao:hr />
			<%-- TODO: Should make a per-provider notice based on root-level account --%>
			<ao:message type="xhtml" key="securityPolicy.securityNotice.body" />
		</ao:bundle>
	</skin:lightArea>
</aoweb:notExists>

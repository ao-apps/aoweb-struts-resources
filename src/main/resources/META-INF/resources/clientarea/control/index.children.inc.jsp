<%-- aoweb-struts: Do not edit --%>
<%--
Copyright 2000-2009, 2016 by AO Industries, Inc.,
7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
All rights reserved.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.inc.jsp" %>

<aoweb:exists path="/clientarea/control/index.children.override.inc.jsp">
	<jsp:include page="/clientarea/control/index.children.override.inc.jsp" />
</aoweb:exists>
<aoweb:notExists path="/clientarea/control/index.children.override.inc.jsp">
	<skin:child><%@include file="password/index.meta.inc.jsp" %></skin:child>
	<skin:child><%@include file="vnc/vnc-console.meta.inc.jsp" %></skin:child>
</aoweb:notExists>

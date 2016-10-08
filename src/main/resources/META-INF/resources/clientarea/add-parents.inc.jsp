<%-- aoweb-struts: Do not edit --%>
<%--
Copyright 2007-2009, 2016 by AO Industries, Inc.,
7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
All rights reserved.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.inc.jsp" %>

<aoweb:exists path="/clientarea/add-parents.override.inc.jsp">
	<jsp:include page="/clientarea/add-parents.override.inc.jsp" />
</aoweb:exists>
<aoweb:notExists path="/clientarea/add-parents.override.inc.jsp">
	<aoweb:exists path="/add-parents.inc.jsp"><jsp:include page="/add-parents.inc.jsp" /></aoweb:exists>
	<skin:parent>
		<%@include file="index.meta.inc.jsp" %>
		<%@include file="index.children.inc.jsp" %>
	</skin:parent>
</aoweb:notExists>

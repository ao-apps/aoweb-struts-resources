<%-- aoweb-struts: Do not edit --%>
<%--
Copyright 2009, 2016 by AO Industries, Inc.,
7262 Bull Pen Cir, Mobile, Alabama, 36695, U.S.A.
All rights reserved.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/_taglibs.inc.jsp" %>

<skin:setContentType />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html lang="true" xhtml="true">
	<aoweb:exists path="/add-parents.inc.jsp"><jsp:include page="/add-parents.inc.jsp" /></aoweb:exists>
	<%@include file="index.meta.inc.jsp" %>
	<%@include file="index.children.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
				<skin:contentTitle><fmt:message key="index.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<skin:autoIndex/>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

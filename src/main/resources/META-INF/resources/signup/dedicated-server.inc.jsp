<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2016  AO Industries, Inc.
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
	<%@include file="dedicated-server.meta.inc.jsp" %>
	<skin:skin>
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
				<skin:contentTitle><fmt:message key="dedicated.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine>
					<ao:script>
						function selectStep(step) {
							var form = document.forms['dedicatedSignupSelectPackageForm'];
							form.selectedStep.value=step;
							form.submit();
						}
					</ao:script>
					<bean:define toScope="request" type="java.lang.String" id="stepNumber" value="1" />
					<bean:define type="java.lang.String" id="actionPrefix" toScope="request" value="dedicated-server" />
					<%@include file="dedicated-server-steps.inc.jsp" %>
					<br />
					<html:form action="/dedicated-server-completed.do">
						<div>
							<input type="hidden" name="selectedStep" value="" />
							<%@include file="signup-select-server-form.inc.jsp" %>
						</div>
					</html:form>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

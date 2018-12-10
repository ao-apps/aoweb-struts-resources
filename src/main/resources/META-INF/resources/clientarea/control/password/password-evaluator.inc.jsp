<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2016, 2018  AO Industries, Inc.
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
	<%@include file="password-evaluator.meta.inc.jsp" %>
	<skin:skin onload="document.forms['passwordEvaluatorForm'].password.select(); document.forms['passwordEvaluatorForm'].password.focus();">
		<skin:content width="600">
			<fmt:bundle basename="com.aoindustries.website.clientarea.control.ApplicationResources">
				<skin:contentTitle><fmt:message key="password.passwordEvaluator.title" /></skin:contentTitle>
				<skin:contentHorizontalDivider />
				<skin:contentLine align="center">
					<html:javascript staticJavascript='false' bundle="/clientarea/control/ApplicationResources" formName="passwordEvaluatorForm" />
					<skin:lightArea>
						<html:form action="/password/password-evaluator-completed" onsubmit="return validatePasswordEvaluatorForm(this);">
							<div>
								<b><fmt:message key="password.passwordEvaluator.prompt" /></b>
								<hr />
								<fmt:message key="password.passwordEvaluator.field.password.prompt" /><html:password size="16" property="password" /> <html:errors bundle="/clientarea/control/ApplicationResources" property="password" />
								<logic:present scope="request" name="results">
									<br /><br />
									<table cellspacing="0" cellpadding="4">
										<logic:iterate scope="request" name="results" id="result" type="com.aoindustries.aoserv.client.password.PasswordChecker.Result">
											<tr>
												<td><ao:write name="result" property="category" />:</td>
												<td><ao:write name="result" property="result" /></td>
											</tr>
										</logic:iterate>
									</table>
								</logic:present><br />
								<br />
								<div style="text-align:center"><ao:input type="submit"><fmt:message key="password.passwordEvaluator.field.submit.label" /></ao:input></div>
							</div>
						</html:form>
					</skin:lightArea>
				</skin:contentLine>
			</fmt:bundle>
		</skin:content>
	</skin:skin>
</html:html>

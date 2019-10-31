<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2019  AO Industries, Inc.
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

<div>
	<input type="hidden" name="selectedStep" value="" />
	<ao:script>
		function selectStep(step) {
			var form = document.forms['signupOrganizationForm'];
			form.selectedStep.value=step;
			form.submit();
		}
	</ao:script>
	<skin:lightArea>
		<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
			 <table cellpadding="0" cellspacing="0">
				<tr><td colspan="4"><b><fmt:message key="signupOrganizationForm.stepLabel" /></b><ao:br /><ao:hr /></td></tr>
				<tr><td colspan="4"><fmt:message key="signupOrganizationForm.stepHelp" /><ao:br /><ao:br /></td></tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationName.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="32" property="organizationName" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationName" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationPhone.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="18" property="organizationPhone" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationPhone" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationFax.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="18" property="organizationFax" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationFax" /></td>
				</tr>
				<tr><td colspan="4">&#160;</td></tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationAddress1.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="32" property="organizationAddress1" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationAddress1" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationAddress2.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="32" property="organizationAddress2" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationAddress2" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationCity.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="16" property="organizationCity" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationCity" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationState.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="5" property="organizationState" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationState" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationCountry.prompt" /></td>
					<td style="white-space:nowrap">
						<html:select property="organizationCountry">
							<bean:define id="didOne" type="java.lang.String" value="false" />
							<bean:define name="signupOrganizationForm" property="organizationCountry" id="organizationCountry" type="java.lang.String" />
							<logic:iterate scope="request" name="countryOptions" id="countryOption">
								<logic:equal name="countryOption" property="code" value="<%= organizationCountry %>">
									<% if(!didOne.equals("true")) { %>
										<option value='<ao:write name="countryOption" property="code" />' selected="selected"><ao:write name="countryOption" property="name" /></option>
										<% didOne = "true"; %>
									<% } else { %>
										<option value='<ao:write name="countryOption" property="code" />'><ao:write name="countryOption" property="name" /></option>
									<% } %>
								</logic:equal>
								<logic:notEqual name="countryOption" property="code" value="<%= organizationCountry %>">
									<option value='<ao:write name="countryOption" property="code" />'><ao:write name="countryOption" property="name" /></option>
								</logic:notEqual>
							</logic:iterate>
						</html:select>
					</td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationCountry" /></td>
				</tr>
				<tr>
					<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
					<td style="white-space:nowrap"><fmt:message key="signupOrganizationForm.organizationZip.prompt" /></td>
					<td style="white-space:nowrap"><html:text size="10" property="organizationZip" maxlength="255" /></td>
					<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="organizationZip" /></td>
				</tr>
				<tr><td colspan="4" style="text-align:center"><ao:br /><ao:input type="submit"><fmt:message key="signupOrganizationForm.submit.label" /></ao:input><ao:br /><ao:br /></td></tr>
			 </table>
		 </fmt:bundle>
	</skin:lightArea>
</div>

<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2007-2009, 2016, 2019, 2020  AO Industries, Inc.
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
			var form = document.forms['signupTechnicalForm'];
			form.selectedStep.value=step;
			form.submit();
		}
	</ao:script>
	<skin:lightArea>
		<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
			<table class="packed">
				<thead>
					<tr><td colspan="4"><b><fmt:message key="signupTechnicalForm.stepLabel" /></b><ao:br /><ao:hr /></td></tr>
					<tr><td colspan="4"><fmt:message key="signupTechnicalForm.stepHelp" /><ao:br /><ao:br /></td></tr>
				</thead>
				<tbody>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baName.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="32" property="baName" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baName" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baTitle.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="32" property="baTitle" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baTitle" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baWorkPhone.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="18" property="baWorkPhone" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baWorkPhone" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baCellPhone.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="18" property="baCellPhone" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baCellPhone" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baHomePhone.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="18" property="baHomePhone" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baHomePhone" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baFax.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="18" property="baFax" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baFax" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baEmail.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="20" property="baEmail" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baEmail" /></td>
					</tr>
					<tr><td colspan="4"><ao:br /><fmt:message key="signupTechnicalForm.addressHelp" /><ao:br /><ao:br /></td></tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baAddress1.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="32" property="baAddress1" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baAddress1" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baAddress2.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="32" property="baAddress2" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baAddress2" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baCity.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="16" property="baCity" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baCity" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baState.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="5" property="baState" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baState" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baCountry.prompt" /></td>
						<td style="white-space:nowrap">
							<html:select property="baCountry">
								<bean:define id="didOne" type="java.lang.String" value="false" />
								<bean:define name="signupTechnicalForm" property="baCountry" id="baCountry" type="java.lang.String" />
								<logic:iterate scope="request" name="countryOptions" id="countryOption">
									<logic:equal name="countryOption" property="code" value="<%= baCountry %>">
										<% if(!didOne.equals("true")) { %>
											<option value='<ao:write name="countryOption" property="code" />' selected="selected"><ao:write name="countryOption" property="name" /></option>
											<% didOne = "true"; %>
										<% } else { %>
											<option value='<ao:write name="countryOption" property="code" />'><ao:write name="countryOption" property="name" /></option>
										<% } %>
									</logic:equal>
									<logic:notEqual name="countryOption" property="code" value="<%= baCountry %>">
										<option value='<ao:write name="countryOption" property="code" />'><ao:write name="countryOption" property="name" /></option>
									</logic:notEqual>
								</logic:iterate>
							</html:select>
						</td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baCountry" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baZip.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="10" property="baZip" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baZip" /></td>
					</tr>
					<tr><td colspan="4">&#160;</td><td></td></tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.required" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baUsername.prompt" /></td>
						<td style="white-space:nowrap"><html:text size="14" property="baUsername" maxlength="255" /></td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baUsername" /></td>
					</tr>
					<tr>
						<td style="white-space:nowrap"><fmt:message key="signup.notRequired" /></td>
						<td style="white-space:nowrap"><fmt:message key="signupTechnicalForm.baPassword.prompt" /></td>
						<td style="white-space:nowrap">
							<html:select property="baPassword">
								<html:options name="passwords" />
							</html:select>
						</td>
						<td style="white-space:nowrap"><html:errors bundle="/signup/ApplicationResources" property="baPassword" /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr><td colspan="4" style="text-align:center"><ao:br /><ao:input type="submit"><fmt:message key="signupTechnicalForm.submit.label" /></ao:input><ao:br /><ao:br /></td></tr>
				</tfoot>
			</table>
		</fmt:bundle>
	</skin:lightArea>
</div>

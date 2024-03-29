<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2009, 2016, 2019, 2020, 2021  AO Industries, Inc.
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

<skin:lightArea>
	<ao:bundle basename="com.aoindustries.web.struts.signup.i18n.ApplicationResources">
		<b><ao:message key="steps.title" /></b>
		<ao:hr />
		<bean:define scope="request" name="signupSelectPackageFormComplete" id="signupSelectPackageFormComplete" type="java.lang.String" />
		<bean:define scope="request" name="signupOrganizationFormComplete" id="signupOrganizationFormComplete" type="java.lang.String" />
		<bean:define scope="request" name="signupTechnicalFormComplete" id="signupTechnicalFormComplete" type="java.lang.String" />
		<bean:define scope="request" name="signupBillingInformationFormComplete" id="signupBillingInformationFormComplete" type="java.lang.String" />
		<bean:define name="stepNumber" id="myStepNumber" type="java.lang.String" />
		<table class="ao-no-border">
			<tbody>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="1"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="1">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.1" /></td>
					<td>
						<% if(myStepNumber.equals("6")) { %>
							<ao:message key="steps.selectPackage.label" />
						<% } else { %>
							<a class="aoDarkLink" href="javascript:selectStep('<ao:write scope="request" name="actionPrefix" />');"><ao:message key="steps.selectPackage.label" /></a>
						<% } %>
					</td>
					<td>
						<logic:equal scope="request" name="signupSelectPackageFormComplete" value="true">
							<ao:message key="steps.completed" />
						</logic:equal>
						<logic:notEqual scope="request" name="signupSelectPackageFormComplete" value="true">
							<b><ao:message key="steps.incomplete" /></b>
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="2"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="2">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.2" /></td>
					<td>
						<% if(
								myStepNumber.equals("6")
								|| !signupSelectPackageFormComplete.equals("true")
						   ) { %>
							<ao:message key="steps.organizationInfo.label" />
						<% } else { %>
							<a class="aoDarkLink" href="javascript:selectStep('<ao:write scope="request" name="actionPrefix" />-2');"><ao:message key="steps.organizationInfo.label" /></a>
						<% } %>
					</td>
					<td>
						<logic:equal scope="request" name="signupOrganizationFormComplete" value="true">
							<ao:message key="steps.completed" />
						</logic:equal>
						<logic:notEqual scope="request" name="signupOrganizationFormComplete" value="true">
							<b><ao:message key="steps.incomplete" /></b>
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="3"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="3">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.3" /></td>
					<td>
						<% if(
								myStepNumber.equals("6")
								|| !signupSelectPackageFormComplete.equals("true")
								|| !signupOrganizationFormComplete.equals("true")
						   ) { %>
							<ao:message key="steps.technicalInfo.label" />
						<% } else { %>
							<a class="aoDarkLink" href="javascript:selectStep('<ao:write scope="request" name="actionPrefix" />-3');"><ao:message key="steps.technicalInfo.label" /></a>
						<% } %>
					</td>
					<td>
						<logic:equal scope="request" name="signupTechnicalFormComplete" value="true">
							<ao:message key="steps.completed" />
						</logic:equal>
						<logic:notEqual scope="request" name="signupTechnicalFormComplete" value="true">
							<b><ao:message key="steps.incomplete" /></b>
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="4"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="4">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.4" /></td>
					<td>
						<% if(
								myStepNumber.equals("6")
								|| !signupSelectPackageFormComplete.equals("true")
								|| !signupOrganizationFormComplete.equals("true")
								|| !signupTechnicalFormComplete.equals("true")
						   ) { %>
							<ao:message key="steps.billingInformation.label" />
						<% } else { %>
							<a class="aoDarkLink" href="javascript:selectStep('<ao:write scope="request" name="actionPrefix" />-4');"><ao:message key="steps.billingInformation.label" /></a>
						<% } %>
					</td>
					<td>
						<logic:equal scope="request" name="signupBillingInformationFormComplete" value="true">
							<ao:message key="steps.completed" />
						</logic:equal>
						<logic:notEqual scope="request" name="signupBillingInformationFormComplete" value="true">
							<b><ao:message key="steps.incomplete" /></b>
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="5"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="5">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.5" /></td>
					<td>
						<% if(
								myStepNumber.equals("6")
								|| !signupSelectPackageFormComplete.equals("true")
								|| !signupOrganizationFormComplete.equals("true")
								|| !signupTechnicalFormComplete.equals("true")
								|| !signupBillingInformationFormComplete.equals("true")
						   ) { %>
							<ao:message key="steps.confirmation.label" />
						<% } else { %>
							<a class="aoDarkLink" href="javascript:selectStep('<ao:write scope="request" name="actionPrefix" />-5');"><ao:message key="steps.confirmation.label" /></a>
						<% } %>
					</td>
					<td>
						<logic:equal name="myStepNumber" value="6">
							<ao:message key="steps.completed" />
						</logic:equal>
						<logic:notEqual name="myStepNumber" value="6">
							<b><ao:message key="steps.incomplete" /></b>
						</logic:notEqual>
					</td>
				</tr>
				<tr>
					<td>
						<logic:equal name="myStepNumber" value="6"><ao:message key="steps.arrow" /></logic:equal>
						<logic:notEqual name="myStepNumber" value="6">&#160;</logic:notEqual>
					</td>
					<td><ao:message key="steps.6" /></td>
					<td><ao:message key="steps.finished.label" /></td>
					<td>&#160;</td>
				</tr>
			</tbody>
		</table>
	</ao:bundle>
</skin:lightArea>

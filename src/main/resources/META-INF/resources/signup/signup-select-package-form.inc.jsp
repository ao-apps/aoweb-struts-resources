<%--
aoweb-struts-resources - Web resources for legacy Struts-based site framework with AOServ Platform control panels.
Copyright (C) 2000-2009, 2016, 2019  AO Industries, Inc.
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
	<skin:popupGroup>
		<fmt:bundle basename="com.aoindustries.website.signup.ApplicationResources">
			<table cellspacing="0" cellpadding="2">
				<tr><td colspan="5"><b><fmt:message key="signupSelectPackageForm.stepLabel" /></b><br /><hr /></td></tr>
				<tr><td colspan="5"><fmt:message key="signupSelectPackageForm.stepHelp" /><br /><br /></td></tr>
				<tr>
					<th style='white-space:nowrap'><fmt:message key="signupSelectPackageForm.select.header" /></th>
					<th style='white-space:nowrap'><fmt:message key="signupSelectPackageForm.packageDefinition.header" /></th>
					<th style='white-space:nowrap'><fmt:message key="signupSelectPackageForm.setup.header" /></th>
					<th style='white-space:nowrap'><fmt:message key="signupSelectPackageForm.monthlyRate.header" /></th>
					<th style='white-space:nowrap'>&#160;</th>
				</tr>
				<logic:iterate scope="request" name="packageDefinitions" id="packageDefinition" indexId="packageDefinitionIndex">
					<skin:lightDarkTableRow>
						<td style="white-space:nowrap"><html:radio styleId="packageDefinition_${packageDefinition.pkey}" property="packageDefinition" idName="packageDefinition" value="pkey" /></td>
						<td style="white-space:nowrap">
							<label for="packageDefinition_${fn:escapeXml(packageDefinition.pkey)}"><b><ao:write name="packageDefinition" /></b></label>
							<skin:popup>
								<table cellspacing="0" cellpadding="2" style='font-size:80%;'>
									<tr>
										<td colspan="4" class='aoPopupLightRow' style='font-size:100%;'>
											<table style="width:100%" cellspacing="0" cellpadding="0">
												<tr>
													<th class='aoPopupLightRow'><ao:write name="packageDefinition" /></th>
													<td class='aoPopupLightRow' align="right"><skin:popupClose /></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<th class='aoPopupDarkRow'><fmt:message key="signupSelectPackageForm.resource.header" /></th>
										<th class='aoPopupDarkRow'><fmt:message key="signupSelectPackageForm.included.header" /></th>
										<th class='aoPopupDarkRow'><fmt:message key="signupSelectPackageForm.maximum.header" /></th>
										<th class='aoPopupDarkRow'><fmt:message key="signupSelectPackageForm.additionalRate.header" /></th>
									</tr>
									<% int row2 = 0; %>
									<c:forEach items="${packageDefinition.limits}" var="limit">
										<tr class='<%= ((row2++)&1)==0 ? "aoPopupLightRow" : "aoPopupDarkRow" %>'>
											<td style="white-space:nowrap"><b><ao:write name="limit" property="resource"/></b></td>
											<td style="white-space:nowrap">
												<c:choose>
													<c:when test="${limit.softLimit==-1}"><fmt:message key="signupSelectPackageForm.unlimited" /></c:when>
													<c:otherwise><ao:write name="limit" method="getSoftLimitDisplayUnit"/></c:otherwise>
												</c:choose>
											</td>
											<td style="white-space:nowrap">
												<c:choose>
													<c:when test="${limit.hardLimit==-1}"><fmt:message key="signupSelectPackageForm.unlimited" /></c:when>
													<c:otherwise><ao:write name="limit" method="getHardLimitDisplayUnit"/></c:otherwise>
												</c:choose>
											</td>
											<td style="white-space:nowrap">
												<c:if test="${limit.additionalRate!=null}"><ao:write name="limit" method="getAdditionalRatePerUnit"/></c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</skin:popup>
						</td>
						<td style="white-space:nowrap; text-align:center">
							<logic:empty name="packageDefinition" property="setupFee"><fmt:message key="signupSelectPackageForm.setup.none" /></logic:empty>
							<logic:notEmpty name="packageDefinition" property="setupFee"><ao:write name="packageDefinition" property="setupFee" /></logic:notEmpty>
						</td>
						<td style="white-space:nowrap; text-align:center"><ao:write name="packageDefinition" property="monthlyRate" /></td>
						<logic:equal name="packageDefinitionLimit" value="0">
							<bean:size scope="request" name="packageDefinitions" id="packageDefinitionsSize" />
							<td rowspan="<%= packageDefinitionsSize %>" style="white-space:nowrap">
								<html:errors bundle="/signup/ApplicationResources" property="packageDefinition" />
							</td>
						</logic:equal>
					</skin:lightDarkTableRow>
				</logic:iterate>
				<tr><td colspan="5" align="center"><br /><ao:input type="submit"><fmt:message key="signupSelectPackageForm.submit.label" /></ao:input><br /><br /></td></tr>
			</table>
		</fmt:bundle>
	</skin:popupGroup>
</skin:lightArea>

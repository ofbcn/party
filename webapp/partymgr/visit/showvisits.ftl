<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<div class="screenlet">
  <#if partyId??>
    <#assign title = uiLabelMap.PartyParty>
  <#else>
    <#assign title = uiLabelMap.PartyActive>
  </#if>
  <div class="screenlet-title-bar">
    <ul>
      <li class="h3">${title}&nbsp;${uiLabelMap.PartyVisitListing}</li>
      <#if !partyId?? && showAll?lower_case == "true">
        <li><a href="<@noerpUrl>showvisits?showAll=false</@noerpUrl>">${uiLabelMap.PartyShowActive}</a></li>
      <#elseif !partyId??>
        <li><a href="<@noerpUrl>showvisits?showAll=true</@noerpUrl>">${uiLabelMap.PartyShowAll}</a></li>
      </#if>
    </ul>
    <br class="clear"/>
  </div>
  <div class="screenlet-body">
      <br />
        <div class="align-float">
            <span class="label">
            <#if (visitSize > 0)>
                <#if (viewIndex > 1)>
                  <a href="<@noerpUrl>showvisits?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}<#if sort?has_content>&amp;sort=${sort}</#if><#if partyId?has_content>&amp;partyId=${partyId}</#if>&amp;showAll=${showAll}</@noerpUrl>" class="smallSubmit">${uiLabelMap.CommonPrevious}</a> |
                </#if>
                ${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${visitSize}
                <#if highIndex < visitSize>
                  | <a href="<@noerpUrl>showvisits?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}<#if sort?has_content>&amp;sort=${sort}</#if><#if partyId?has_content>&amp;partyId=${partyId}</#if>&amp;showAll=${showAll}</@noerpUrl>" class="smallSubmit">${uiLabelMap.CommonNext}</a>
                </#if>
            </#if>
            </span>
        </div>
        <br class="clear"/>
      <br />
      <table class="basic-table hover-bar" cellspacing="0">
        <tr class="header-row">
          <td><a href="<@noerpUrl>showvisits?sort=visitId&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.PartyVisitId}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=visitorId&amp;showAll=${showAll}<#if visitorId?has_content>&amp;visitorId=${visitorId}</#if></@noerpUrl>">${uiLabelMap.PartyVisitorId}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=partyId&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.PartyPartyId}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=userLoginId&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.CommonUserLoginId}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=-userCreated&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.PartyNewUser}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=webappName&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.PartyWebApp}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=clientIpAddress&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.PartyClientIP}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=fromDate&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.CommonFromDate}</a></td>
          <td><a href="<@noerpUrl>showvisits?sort=thruDate&amp;showAll=${showAll}<#if partyId?has_content>&amp;partyId=${partyId}</#if></@noerpUrl>">${uiLabelMap.CommonThruDate}</a></td>
        </tr>
        <#assign alt_row = false>
        <#list visitList as visitObj>
          <tr<#if alt_row> class="alternate-row"</#if>>
            <td class="button-col"><a href="<@noerpUrl>visitdetail?visitId=${visitObj.visitId}</@noerpUrl>">${visitObj.visitId}</a></td>
            <td>${visitObj.visitorId!}</td>
            <td class="button-col"><a href="<@noerpUrl>viewprofile?partyId=${visitObj.partyId!}</@noerpUrl>">${visitObj.partyId!}</a></td>
            <td>${visitObj.userLoginId!}</td>
            <td>${visitObj.userCreated!}</td>
            <td>${visitObj.webappName!}</td>
            <td>${visitObj.clientIpAddress!}</td>
            <td>${(visitObj.fromDate?string)!}</td>
            <td>${(visitObj.thruDate?string)!}</td>
          </tr>
          <#assign alt_row = !alt_row>
        </#list>
      </table>
      <br />
      <div class="align-float">
          <span class="label">
          <#if (visitSize > 0)>
              <#if (viewIndex > 1)>
                <a href="<@noerpUrl>showvisits?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex-1}<#if sort?has_content>&amp;sort=${sort}</#if><#if partyId?has_content>&amp;partyId=${partyId}</#if>&amp;showAll=${showAll}</@noerpUrl>" class="smallSubmit">${uiLabelMap.CommonPrevious}</a> |
              </#if>
              ${lowIndex} - ${highIndex} ${uiLabelMap.CommonOf} ${visitSize}
              <#if highIndex < visitSize>
                | <a href="<@noerpUrl>showvisits?VIEW_SIZE=${viewSize}&amp;VIEW_INDEX=${viewIndex+1}<#if sort?has_content>&amp;sort=${sort}</#if><#if partyId?has_content>&amp;partyId=${partyId}</#if>&amp;showAll=${showAll}</@noerpUrl>" class="smallSubmit">${uiLabelMap.CommonNext}</a>
              </#if>
           </#if>
           </span>
      </div>
      <br class="clear"/>
  </div>
</div>
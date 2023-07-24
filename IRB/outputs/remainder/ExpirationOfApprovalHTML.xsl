<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="name"></xsl:param>
  <xsl:param name="IRBName"></xsl:param>
	<xsl:param name="IRBNum"></xsl:param>
	<xsl:param name="PIName"></xsl:param>
	<xsl:param name="PIDept"></xsl:param>
	<xsl:param name="irbDIV"></xsl:param>	
	<xsl:param name="PIAddressA1"></xsl:param>
	<xsl:param name="PIAddressA2"></xsl:param>
	<xsl:param name="PIAddressA3"></xsl:param>
	<xsl:param name="PIAddressA4"></xsl:param>
	<xsl:param name="hasRevision"/>
	<xsl:param name="meetingDate"/>
	<xsl:param name="irbBoard"/>
	<xsl:param name="subType"/>
	<xsl:param name="tabled"/>
	<xsl:param name="subName"/>
	<xsl:param name="revProcess"/>
	<xsl:param name="CHAIR"/>
	<xsl:param name="dHeadName"/>    
	<xsl:param name="CONAMEND"/>
	<xsl:param name="HASADDITIONALINFO"/>
	<xsl:param name="startDate"/>
	<xsl:param name="endDate"/>
	<xsl:param name="dToendDate"/>
	<xsl:param name="DOCS"/>
	<xsl:param name="CCs"/>
	<xsl:param name="TODAY"/>
	<xsl:param name="REVDate"/>
	<xsl:param name="subReceiptDate"/>
	<xsl:param name="PrefSites"/>
	<xsl:param name="irbDEPT"/>
	<xsl:template match="reportXML">
    <html>
	  <body>
			<!--<xsl:if test="count(remType) &gt; 0">
				<h2><u>EXPIRATION OF IRB APPROVAL</u></h2>								
			</xsl:if>-->
				<h2 align='center'><u>EXPIRATION OF IRB APPROVAL</u></h2>	
		 <div id="subjectDiv">
		  Date: <xsl:value-of select="$TODAY"/><br/>
		  To:  <xsl:value-of select="$PIName"/><br/><br/>
		  
		On <xsl:value-of select="$endDate"/> the Institutional Review Board (IRB) approval of the following human subject research expired.
		</div>
		<br/>
		<br/>
		<div id="projectDetailDiv">
		   <table border="1" align="center" width="100%">
			   <tr>
			   <td>Project Title:</td>
				<td><xsl:value-of select="$IRBName"/></td>
			   </tr>  
			   <tr>
			   <td>Investigator:</td>
				<td><xsl:value-of select="$PIName"/></td>
			   </tr>   
			   <tr>
			   <td>Department:</td>
				<td><xsl:value-of select="$irbDEPT"/></td>
			   </tr>
				<tr>
			   <td>Project #:</td>
				<td><xsl:value-of select="$IRBNum"/></td>
			   </tr>
				<tr>
			   <td>Sites:</td>
				<td>
					<xsl:for-each select="siteName">
						<xsl:choose>
							<xsl:when test="position() = 1"><xsl:value-of select="."/>
							</xsl:when>
							<xsl:otherwise>, <xsl:value-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</td></tr>
			   <tr>
			   <td>Funding Agency - ABCD:</td>
				<td><xsl:value-of select="facultySponsor/@num"/> - <xsl:value-of select="facultySponsor/@sponsor"/></td>
			   </tr>
			   <tr>
			   <td>IND (if any):</td>
				<td><xsl:choose>
					<xsl:when test="count(Drug[@drugValidIND='1']) &gt; 0">
						<xsl:for-each select="Drug[@drugValidIND='1']">
						
							<xsl:choose>
								<xsl:when test="position() = 1"><xsl:value-of select="@nonRoutineDrugsINDNumber"/> - <xsl:value-of select="@typeINDHolder"/>
								</xsl:when>
								<xsl:otherwise>, <xsl:value-of select="@nonRoutineDrugsINDNumber"/> - <xsl:value-of select="@typeINDHolder"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>NO IND
					</xsl:otherwise>
				</xsl:choose></td>
			   </tr>
			   <tr>
			   <td>IDE (if any):</td>
				<td><xsl:choose>
					<xsl:when test="count(Device[@ideStudy='1']) &gt; 0">
						<xsl:for-each select="Device[@ideStudy='1']">
						
							<xsl:choose>
								<xsl:when test="position() = 1"><xsl:value-of select="@deviceIDE"/> - <xsl:value-of select="@deviceSponsor"/>
								</xsl:when>
								<xsl:otherwise>, <xsl:value-of select="@deviceIDE"/> - <xsl:value-of select="@deviceSponsor"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>NO IDE
					</xsl:otherwise>
				</xsl:choose></td>
			   </tr>
			</table>
			</div>
		<br/><br/>
	<div id="descriptionDiv">
		 All research activities must stop. This includes recruitment, advertisement, screening, enrollment, consent, interventions, interactions, and collection of private identifiable information. Advertisements currently running in the media must be pulled.
		<br/><br/>
		
		<u>Continuation of research activities without prior IRB review and approval is a violation of federal regulations.</u>
		<br/><br/>
		
		<b>If you believe that current subjects are at risk of harm by stopping research procedures:</b>
		<br/>
		<ul>
		  <li><b>Prepare a written list of subjects who will be harmed, the research procedures that need to continue, and the reasons that these procedures need to continue.</b></li>
		  <li><b>Immediately contact the Program for Protection of Human Subjects (PPHS) office and provide them with a copy of this list.</b></li>		  
		</ul>
		
		An IRB member (if needed, in consultation with others) will decide whether there is an over-riding safety concern or ethical issue involved such that it is in the best interest of individual subjects.
		<br/><br/>
		
		<b>If you have not already done so, please submit a Continuation and required attachments or Final Report to request continuing approval or study closure.</b>
		<br/>
		
		A copy of this letter will be forwarded to your supervisor.
		<br/><br/>
		
		Sincerely,	<br/>
		The Program for the Protection of Human Subjects Staff<br/>

	
	</div>
	 
  </body>
  </html>
   </xsl:template>
</xsl:stylesheet>

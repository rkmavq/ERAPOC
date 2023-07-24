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
			<xsl:if test="count(remType) &gt; 0">
							<xsl:choose>
								<xsl:when test="remType = 'rem30'">
									<h2 align='center'><u>30 DAY CONTINUATION / FINAL REPORT REMINDER</u></h2>
								</xsl:when>
								<xsl:when test="remType = 'rem60'">
								<h2 align='center'><u>60 DAY CONTINUATION / FINAL REPORT REMINDER</u></h2>
									
								</xsl:when>
								<xsl:when test="remType = 'rem90'">
								<h2 align='center'><u>90 DAY CONTINUATION / FINAL REPORT REMINDER</u></h2>
									
								</xsl:when>
							</xsl:choose>						
						</xsl:if>
		 <div id="subjectDiv">
		  Date: <xsl:value-of select="$TODAY"/><br/>
		  To:  <xsl:value-of select="$PIName"/><br/><br/>
		  

		An Institutional Review Board (IRB) of the Icahn School of Medicine at Mount Sinai, approved the following human subject research to be conducted through <xsl:value-of select="$endDate"/>.
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
			   <td>Funding Agency ABCD:</td>
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
		 Keeping in mind the Program for Protection of Human Subjects (PPHS) submission deadline schedule (
		<a href="http://icahn.mssm.edu/research/resources/program-for-the-protection-of-human-subjects/researchers-palette/meeting-dates-and-deadlines">http://icahn.mssm.edu/research/resources/program-for-the-protection-of-human-subjects/researchers-palette/meeting-dates-and-deadlines
		</a>), please submit a Continuation or Final Report by:
		<br/><br/>
		
		
			<xsl:choose>
			<xsl:when test="remType ='rem30'">
			<u>The next PPHS deadline</u> in order to request continuing IRB approval or study closure.
			</xsl:when>
			<xsl:when test="remType = 'rem60'">

				The PPHS submission deadline immediately prior to <xsl:value-of select="remApprovalEndDate"/> or within 30 days of study closure, whichever is earlier, in order to request continuing IRB approval or study closure.
				
			</xsl:when>
			<xsl:when test="remType = 'rem90'">
				The PPHS submission deadline immediately prior to <xsl:value-of select="remApprovalEndDate"/> or within 30 days of study closure, whichever is earlier, in order to request continuing IRB approval or study closure.
			</xsl:when>
		</xsl:choose>
		<br/>
			If you do not submit a completed Continuation or Final Report to request continuing approval or study closure by <xsl:value-of select="remApprovalEndDate"/> you will not be able to submit new research to the PPHS until this information has been submitted.	<br/><br/>
			
		 If the Continuation submission is not approved before the expiration date of <xsl:value-of select="$endDate"/>, approval of this research expires on that date. If the IRB approval expires,<u> all research activities must stop</u>. This includes recruitment, advertisement, screening, enrollment, consent, interventions, interactions, and collection of private identifiable information. Advertisements currently running in the media must be pulled.<br/><br/>	
									
		
		If you have any questions about how to submit this request, need help with the process, or have general questions, please feel free to call us at 212-824-8200 or email us at IRB@mssm.edu.	<br/><br/>
		Sincerely,	<br/>
		The Program for the Protection of Human Subjects Staff<br/>

	
	</div>
	 
  </body>
  </html>
   </xsl:template>
</xsl:stylesheet>

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
	<xsl:param name="TODAYWITHTIME"/>
	<xsl:param name="REVDate"/>
	<xsl:param name="subReceiptDate"/>
	<xsl:param name="PrefSites"/>
	<xsl:param name="irbDEPT"/>
	<xsl:param name="todayPLUS3"/>	
	<xsl:template match="reportXML">
    <html>
	  <body>
		 <div id="subjectDiv">
		  Subject: <xsl:value-of select="$IRBNum"/> - <xsl:value-of select="$PIName"/> - Deferrable Issues Communication<br/>
		  Date: <xsl:value-of select="$TODAYWITHTIME"/><br/>
		  To:  <xsl:value-of select="$PIName"/><br/><br/>
		Your project has been reviewed by the IRB reviewers from <xsl:value-of select="$irbBoard"/> and is scheduled for the <xsl:value-of select="$meetingDate"/> meeting.
		</div>
		<br/><br/>		
	<div id="descriptionDiv">
		There are two sets of comments in the attached document. The first set of comments (Deferrable Issues) are issues the IRB would like to have addressed by 10:00 a.m. next Monday. These are the significant issues that may cause the Board to defer the project to a future meeting. Your response(s) should indicate how changes will be made to all relevant documents, i.e. you should provide full textual responses including any proposed changes.			
		<br/><br/>
		The second set of issues (Directive Issues) are to be addressed only once you receive your notification after the meeting, but we wanted to provide additional time to prepare your responses. Please note that there may also be additional issues raised at the IRB meeting and those comments will be included in your notification after the meeting as well.
		<br/><br/>
		Remember, please reply to this message through Ideate with comments/answers to the first set of issues by 10:00 a.m. next Monday. Please use the attached document to respond to the deferrable issues (no changes should be made to the submission in Ideate nor any study documents at this time).
		<br/><br/>
		Sincerely,	<br/>
		The Program for the Protection of Human Subjects Staff<br/>	
	</div>
	 
  </body>
  </html>
   </xsl:template>
</xsl:stylesheet>

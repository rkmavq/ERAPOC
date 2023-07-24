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
		Greetings:
		<br/><br/>
		Your project has now been evaluated by PPHS staff and the primary reviewers for the IRB.  The next step involves its review by the full IRB next week.
		</div>
		<br/><br/>		
	<div id="descriptionDiv">
		We are sending 2 sets of questions/comments.  The first group, labeled DEFERRABLE, must be answered by noon Monday, so that the responses can be reviewed by the board at its Tuesday meeting.  They are called deferrable because if they are not responded to completely it is likely your project will not be approvable at the IRB meeting and will be delayed.  Please be certain to provide us, where appropriate, with the actual language you are proposing to use in the consent or in the IDEATE application.
		<br/><br/>
		The second group of comments is labeled DIRECTIVE.  These comments do not need a response as they are “directing you” to do something.  Please look them over.  If you do object to any, please submit your reasoning and proposed alternative by the deadline above so the full board can consider them.  We request that you wait to make all directive changes until AFTER the full IRB meeting.  You can then integrate these directive responses into any other changes requested by the full board, at which point you will return the fully updated project to the PPHS for review and approval.
		<br/><br/>
		Sincerely,	<br/>
		The Program for the Protection of Human Subjects Staff<br/>	
	</div>
	 
  </body>
  </html>
   </xsl:template>
</xsl:stylesheet>

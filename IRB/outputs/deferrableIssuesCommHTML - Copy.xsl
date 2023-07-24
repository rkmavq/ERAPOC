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
	<xsl:param name="todayPLUS3"/>
	
	<xsl:template match="reportXML">
    <html>
	  <body>
		 <div id="subjectDiv">
		  Subject: <xsl:value-of select="$IRBNum"/> - <xsl:value-of select="$PIName"/> - Deferrable Issues Communication<br/>
		  Date: <xsl:value-of select="$TODAY"/><br/>
		  To:  <xsl:value-of select="$PIName"/><br/><br/>
		Your project, as indicated below, has been reviewed by the IRB reviewers from <xsl:value-of select="$irbBoard"/> and is scheduled for the <xsl:value-of select="$meetingDate"/> meeting.
		</div>
		<br/><br/>		
	<div id="descriptionDiv">
		There are two sets of comments in the attached document. The first set of comments (Deferrable Issues) are issues the IRB would like to have addressed before the meeting, by <xsl:value-of select="$todayPLUS3"/> at 10am. These are the significant issues that are either non-directive and require clarification from you, or are larger issues that may cause the Board to defer the project for consideration at a future meeting. Your responses will aid in the discussion of your project at the Board meeting. Your response(s) should indicate how changes will be made to all relevant documents, i.e. you should provide full textual responses including any proposed changes.			
		<br/><br/>
		The second set of issues (Directive Issues) are to be addressed only once you receive your notification after the meeting, but we wanted to provide additional time to prepare your response and provide the majority of identified issues earlier in the review process. Please note that there may also be additional issues raised at the IRB meeting and those comments will be included in your notification after the meeting as well.
		<br/><br/>
		Remember, please reply to this message through Ideate with comments/answers to the first set of issues by  <xsl:value-of select="$todayPLUS3"/> at 10am. Please use the attached document to respond to the deferrable issues (no changes should be made to the submission in Ideate at this time). The changes which will be made to the directive issues do not need to be addressed in your response right now.
		<br/><br/>
		If you have any questions about this part of the IRB review process, need help answering the questions presented, or have a general inquiry, we would be happy to help you. Please feel free to call us at 212-824-8200 to speak with the analyst reviewing this project. 
		<br/><br/>
		Sincerely,	<br/>
		The Program for the Protection of Human Subjects Staff<br/>	
	</div>
	 
  </body>
  </html>
   </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"  xmlns:date="http://exslt.org/dates-and-times"
    extension-element-prefixes="date"
	exclude-result-prefixes="fo">
	<!--<xsl:strip-space elements="*"/>-->
	<xsl:param name="LOGO_URL"/>
	<xsl:output indent="yes"/>
	<xsl:template name="splitlines">
		<xsl:param name="pText"/>
		<xsl:if test="string-length($pText)">
			<fo:block>
				<xsl:choose>
					<xsl:when test="contains($pText, '-eol-')">	<!-- &#x000A; -->
						<xsl:value-of select="normalize-space(substring-before($pText, '-eol-'))"/>
					</xsl:when><xsl:otherwise><xsl:value-of select="normalize-space($pText)"/></xsl:otherwise>
				</xsl:choose>
			</fo:block>
			<xsl:call-template name="splitlines">
				<xsl:with-param name="pText" select="substring-after($pText, '-eol-')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="/*">    
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Calibri">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="all-pages" page-width="8.5in" page-height="11in" margin-top="36pt" margin-bottom="16.55pt" margin-right="72pt" margin-left="54pt">
					<fo:region-body margin-top="1.5in" margin-bottom="1in"/>
					<fo:region-before extent="1.5in"/>
					<fo:region-after extent="0.75in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="all-pages">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block space-after="20pt" widows="2" orphans="2" font-size="10pt" white-space-collapse="false">
						<fo:block text-align="justify">
							<!-- <fo:external-graphic src="url('https://researchadminsystem.umanitoba.ca/pix/letterhead.png')" content-width="468.75pt"/>  -->
							<fo:external-graphic>
                                    <xsl:attribute name="src"><xsl:value-of select="$LOGO_URL"/></xsl:attribute>
                                    <xsl:attribute name="content-width">468.75pt</xsl:attribute>
                                </fo:external-graphic>  
						</fo:block>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block space-before="10pt" border-top-style="solid" border-top-width="thick" border-top-color="grey"/>
					<fo:block text-align="center" font-family="Calibri" font-size="11pt" color="grey">
						<fo:page-number/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<!-- Start Body Section -->
					<fo:block widows="2" orphans="2" font-size="10pt" line-height="1.147" white-space-collapse="false">
						<fo:block space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" 
							language="EN-US" text-align="center"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:block font-weight="bold" color="#323299" font-size="16pt">
								<fo:leader leader-length="0pt"/>REB Meeting Minutes
							</fo:block>
							<fo:block color="#323299" font-size="14pt">
								<fo:leader leader-length="0pt"/>
								<xsl:value-of select="agenda/Meeting/boardName"/>
							</fo:block>
							<fo:block color="#323299" font-size="14pt">
								<fo:leader leader-length="0pt"/>
								<!--<xsl:value-of select="concat(substring(agenda/Meeting/date, 6, 2), '/', substring(agenda/Meeting/date, 9, 2), '/', substring(agenda/Meeting/date, 1, 4))"/>-->														<xsl:value-of select="agenda/Meeting/meetingLongDate"/>		
							</fo:block>							
							<xsl:if test="agenda/Meeting/actualMeetingStartTime!='' or agenda/Meeting/actualMeetingEndTime!=''">
								<fo:block color="#323299" font-size="14pt">
									<fo:leader leader-length="0pt"/>
									<xsl:value-of select="agenda/Meeting/actualMeetingStartTime"/> - <xsl:value-of select="agenda/Meeting/actualMeetingEndTime"/>
								</fo:block>
							</xsl:if>
							<fo:block color="#323299" font-size="14pt">
								<fo:leader leader-length="0pt"/><xsl:value-of select="agenda/Meeting/scheduledMeetingLocation"/></fo:block>
						</fo:block>
						<fo:block space-after="20pt" line-height="1.3190500000000002" border-top-style="solid" border-top-width="thick" border-top-color="#323299"/>
						
						<fo:block space-after="0pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
								<fo:leader leader-length="0pt"/>Members in Attendance</fo:block>
							<xsl:for-each select="agenda/Meeting/attendance/member[@attendance='1' or @conference='1']">
								<fo:block>
									<fo:inline font-family="Calibri" font-size="12pt" color="black">
										<fo:leader leader-length="0pt"/>
										<xsl:value-of select="@name"/>
									</fo:inline>
								</fo:block>
							</xsl:for-each>
						</fo:block>
						<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:leader/>
						</fo:block>
						<fo:block space-after="0pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
								<fo:leader leader-length="0pt"/>Members Absent</fo:block>
							<xsl:for-each select="agenda/Meeting/attendance/member[@attendance!='1' and @conference!='1']">
								<fo:block>
									<fo:inline font-family="Calibri" font-size="12pt" color="black">
										<fo:leader leader-length="0pt"/>
										<xsl:value-of select="@name"/>
									</fo:inline>
								</fo:block>
							</xsl:for-each>
						</fo:block>

						<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:leader/>
						</fo:block>
						
						<fo:block space-after="0pt" space-after.conditionality="retain"
						line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
						language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
						xmlns:svg="http://www.w3.org/2000/svg">
							<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
								<fo:leader leader-length="0pt"/>Administrative Items<xsl:value-of select="concat(' (',count(//agenda/Meeting/adminItem[@type!='']),')')"/>
							</fo:block>
						</fo:block>
						<xsl:for-each select="//agenda/Meeting/adminItem[@type!='']">
							<xsl:sort select="@order"/>
							<xsl:variable name="innerMostIndex" select="position()"/>
							<xsl:variable name="adminItemType" select="@type"/>
							<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>		
							<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
								<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
									<fo:list-item-label font-family="Calibri" text-indent="0pt">
										<fo:block>
											<xsl:value-of select="concat($innerMostIndex,'.')"/>
										</fo:block>
									</fo:list-item-label>
									<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
										<fo:table table-layout="auto">
											<fo:table-column column-width="35%"/>
											<fo:table-column column-width="65%"/>
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell text-align="left">
														<fo:block>
															<fo:inline font-family="Calibri"  color="black">
																<fo:leader leader-length="0pt"/>Type:
															</fo:inline>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell text-align="left">
														<fo:block>
															<fo:inline font-family="Calibri"  color="black">
																<fo:leader leader-length="0pt"/>
																<xsl:value-of select="//boardMeetingAdminTypes/type[@id=$adminItemType]/@name"/>
															</fo:inline>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell text-align="left">
														<fo:block>
															<fo:inline font-family="Calibri"  color="black">
																<fo:leader leader-length="0pt"/>Title:
															</fo:inline>
														</fo:block>
													</fo:table-cell>
													<fo:table-cell text-align="left">
														<fo:block>
															<fo:inline font-family="Calibri"  color="black">
																<fo:leader leader-length="0pt"/>
																<xsl:value-of select="@title"/>
															</fo:inline>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell text-align="left">
														<fo:block>
															<fo:inline font-family="Calibri"  color="black">
																<fo:leader leader-length="0pt"/>Comments:
															</fo:inline>
														</fo:block>
													</fo:table-cell>													
													<fo:table-cell text-align="left">	<!--   number-columns-spanned="2" -->													
														<fo:block font-family="Calibri" wrap-option="wrap" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve">					
														<xsl:call-template name="splitlines">
															<xsl:with-param name="pText" select="description"/>
														</xsl:call-template>
														</fo:block>
													</fo:table-cell>
												</fo:table-row>																																								
											</fo:table-body>
										</fo:table>
									</fo:list-item-body>
								</fo:list-item>
							</fo:list-block>									
						</xsl:for-each>
						<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:leader/>
						</fo:block>
						<xsl:if test="count(//metaReview[process='full']) &gt; 0">
							<!-- Submissions for Convened IRB Review -->
							<fo:block space-after="0pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
								<fo:block font-weight="bold" font-size="12pt" color="black">
									<fo:leader leader-length="0pt"/>Submissions for Full Review</fo:block>
							</fo:block>
							<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>
							<!-- Initial Reviews Section -->
							<xsl:if test="count(//metaReview[reviewType='protocol' and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Initial Reviews<xsl:value-of select="concat(' (',count(//metaReview[reviewType='protocol' and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[reviewType='protocol' and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>	
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Amendments  -->
							<xsl:if test="count(//metaReview[(reviewType='amendments' or reviewType='amendment') and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Amendments<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='amendments' or reviewType='amendment') and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='amendments' or reviewType='amendment') and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>										
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Renewals  -->
							<xsl:if test="count(//metaReview[(reviewType='renewals' or reviewType='renewal') and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Renewals<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='renewals' or reviewType='renewal') and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='renewals' or reviewType='renewal') and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>	
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>								
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- REB Events Section -->
							<xsl:if test="count(//metaReview[((reviewType='problems' or reviewType='problem')) and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>REB Events<xsl:value-of select="concat(' (',count(//metaReview[((reviewType='problems' or reviewType='problem')) and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[((reviewType='problems' or reviewType='problem')) and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Study Closures  -->
							<xsl:if test="count(//metaReview[reviewType='finalreps' and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Study Closures<xsl:value-of select="concat(' (',count(//metaReview[reviewType='finalreps' and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[reviewType='finalreps' and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>										
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>							
						
							<!-- Personnel Changes  -->
							<xsl:if test="count(//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and process='full']) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Personnel Changes<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and process='full']),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and process='full']">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Discussion:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/reviewDiscussion" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Decision:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/decision" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>										
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
						</xsl:if>
						<xsl:if test="count(//metaReview[(process='expedited' or process='chair')]) &gt; 0">
							<!-- Submissions Reviewed and Approved under Expedited Review Procedures -->
							<fo:block page-break-before="always" space-after="0pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
								<fo:block font-weight="bold" font-size="12pt" color="black">
									<fo:leader leader-length="0pt"/>Submissions Reviewed and Approved under Delegated Review</fo:block>
							</fo:block>
							<fo:block space-after="10pt" space-after.conditionality="retain"
							line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>
							<!-- Initial Reviews Section -->
							<xsl:if test="count(//metaReview[reviewType='protocol' and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Initial Reviews<xsl:value-of select="concat(' (',count(//metaReview[reviewType='protocol' and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[reviewType='protocol' and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Approval Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>																									
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Amendments  -->
							<xsl:if test="count(//metaReview[(reviewType='amendments' or reviewType='amendment') and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Amendments<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='amendments' or reviewType='amendment') and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='amendments' or reviewType='amendment') and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Approval Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>		
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Renewals -->
							<xsl:if test="count(//metaReview[(reviewType='renewals' or reviewType='renewal') and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Renewals<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='renewals' or reviewType='renewal') and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='renewals' or reviewType='renewal') and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Approval Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>	
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- REB Events -->
							<xsl:if test="count(//metaReview[((reviewType='problems' or reviewType='problem')) and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>REB Events<xsl:value-of select="concat(' (',count(//metaReview[((reviewType='problems' or reviewType='problem')) and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[((reviewType='problems' or reviewType='problem')) and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Review Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<!--<xsl:value-of select="caseData/apprStart" />-->
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Study Closures -->
							<xsl:if test="count(//metaReview[reviewType='finalreps' and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Study Closures<xsl:value-of select="concat(' (',count(//metaReview[reviewType='finalreps' and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[reviewType='finalreps' and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>														
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Approval Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>																										
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
							<!-- Personnel Changes  -->
							<xsl:if test="count(//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and (process='expedited' or process='chair')]) &gt; 0">
								<fo:block space-after="0pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-family="Calibri" font-size="12pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:block font-weight="bold" font-size="12pt" color="black" text-decoration="underline">
										<fo:leader leader-length="0pt"/>Personnel Changes<xsl:value-of select="concat(' (',count(//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and (process='expedited' or process='chair')]),')')"/>
									</fo:block>
								</fo:block>
								<xsl:for-each select="//metaReview[(reviewType='amendmentsPC' or reviewType='amendmentPC') and (process='expedited' or process='chair')]">
									<xsl:variable name="innerMostIndex" select="position()"/>
									
									<fo:list-block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg">
										<fo:list-item space-before="10pt" font-size="12pt" space-before.conditionality="retain" space-after="10pt"  space-after.conditionality="retain" text-align="justify" font-family="Calibri" language="EN-NZ" color="black" line-height="1.3525041666666666">
											<fo:list-item-label font-family="Calibri" text-indent="0pt">
												<fo:block>
													<xsl:value-of select="concat($innerMostIndex,'.')"/>
												</fo:block>
											</fo:list-item-label>
											<fo:list-item-body end-indent="inherit" start-indent="15pt" text-indent="0pt">
												<fo:table table-layout="auto">
													<fo:table-column column-width="35%"/>
													<fo:table-column column-width="65%"/>
													<fo:table-body>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Number:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="id8ID" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Protocol Title:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="title" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>PI:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="PIName" />
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>Approval Date:
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell text-align="left">
																<fo:block>
																	<fo:inline start-indent="55pt" font-family="Calibri"  color="black">
																		<fo:leader leader-length="0pt"/>
																		<xsl:value-of select="caseData/apprStart"/>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>		
													</fo:table-body>
												</fo:table>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>
								</xsl:for-each>
							</xsl:if>
							
						</xsl:if>
					</fo:block> 
					<!-- End Body Section -->
					<fo:block id="d0"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
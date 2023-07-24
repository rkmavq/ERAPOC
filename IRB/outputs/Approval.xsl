<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	exclude-result-prefixes="fo">
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
	<xsl:param name="irbDEPT"/>
	<!--AB: sprint 3 new fields to be sent in-->
	<xsl:param name="boardFullName"/>
	<xsl:param name="REVProcessType"/>
	<xsl:param name="REVType"/>
	<xsl:param name="contactName"/>
	<xsl:param name="contactPhone"/>
	<xsl:param name="contactEmail"/>
	<xsl:param name="riskLevel"/>
    <xsl:param name="LOGO_URL"/>
	<xsl:template match="/*">    
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Arial">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="all-pages" page-width="8.5in" page-height="11in" margin-top="36pt" margin-bottom="16.55pt" margin-right="72pt" margin-left="54pt">
					<fo:region-body margin-top="80pt" margin-bottom="48.25pt"/>
					<fo:region-before extent="0.5in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="all-pages">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
						xmlns:svg="http://www.w3.org/2000/svg" font-family="TimesNewRoman"
						font-size="10pt" language="EN-US" text-align="center">
						<fo:inline
							font-family="Arial" font-size="10pt">
							<!-- <fo:external-graphic
								content-width="204.75pt" content-height="48pt"
								src="url(&#34;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a&#xA;HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy&#xA;MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACXAoADASIA&#xA;AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA&#xA;AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3&#xA;ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm&#xA;p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA&#xA;AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx&#xA;BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK&#xA;U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3&#xA;uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDg6KPw&#xA;o/CvUPdCij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/Cg&#xA;Aoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/&#xA;CgAoo/Cj8KACij8KPwoA0vD3/IzaT/1+Rf8AoYr6oHSvlfw7/wAjNpP/AF+Q/wDoYr6oHSuTE7o8&#xA;/G/EhaKKK5jiCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA&#xA;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&#xA;L4V/597j/v8Amj6xAPrlPsfPtFfQX/CpfCv/AD73H/f80n/CpfCv/Pvcf9/zR9YgH1yn2Pn6jmvc&#xA;Ne+GXhzT/D2pXlvBOJre1llQmYn5lQkfqK8OrSE1O9jalVjUvboLzRzR+NH41ZoHNHNH40fjQAc0&#xA;c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRz&#xA;R+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH&#xA;40fjQAc0c0fjR+NABzRzR+NH40AfXdFFFeWeEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR&#xA;RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGN4s/5E/Wv+vGf&#xA;/wBFtXy7X1F4s/5E7Wv+vGf/ANFtXy7XXhtmehgtmFFFFdJ2hRRRQAUUUUAFFFFABRRRQAUUUUAF&#xA;FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH13RRRXl&#xA;nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU&#xA;AFFFFABRRRQAUUUUAFFFFABRRRQBjeKlLeEdZUdTYzAf98NXzP8A2ddf88v/AB4f40UV1Yd6M78G&#xA;9GH9nXX/ADy/8eH+NH9nXX/PL/x4f40UV0XZ2XYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf&#xA;2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf&#xA;88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/&#xA;AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f&#xA;40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2&#xA;ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf8&#xA;8v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8A&#xA;x4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f4&#xA;0UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUX&#xA;YXZ//9l=&#xA;&#34;)"
                            /> -->
                            <fo:external-graphic>
                                <xsl:attribute name="src"><xsl:value-of select="$LOGO_URL"/></xsl:attribute>
                                <xsl:attribute name="content-width">204.75pt</xsl:attribute>
                                <xsl:attribute name="content-height">48pt</xsl:attribute>
                            </fo:external-graphic>
                        </fo:inline></fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<!-- Start Body Section -->
					<fo:block widows="2" orphans="2" font-size="10pt" line-height="1.147" white-space-collapse="false">						
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" text-align="justify" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>                        
                        <fo:table font-family="Arial" language="EN-US" start-indent="0pt">
                            <fo:table-column column-number="1" column-width="160.9pt"/>
                            <fo:table-column column-number="2" column-width="389.9pt"/>
                            <fo:table-body start-indent="0pt" end-indent="0pt">
                            	<fo:table-row>
                            		<fo:table-cell padding-top="0pt" padding-left="0pt"
                            			padding-bottom="0pt" padding-right="5.4pt">
                            			<fo:block-container>
                            				<fo:block font-family="Arial" font-size="10pt" language="EN-US" keep-with-next.within-page="always">
                            					<fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>DATE:</fo:inline>
                            				</fo:block>
                            			</fo:block-container>
                            		</fo:table-cell>
                            		<fo:table-cell padding-top="0pt" padding-left="0pt"
                            			padding-bottom="0pt" padding-right="5.4pt">
                            			<fo:block-container>
                            				<fo:block font-family="Arial" font-size="10pt" language="EN-US">
                            					<fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/><xsl:value-of select="$TODAY"/></fo:inline>
                            				</fo:block>
                            			</fo:block-container>
                            		</fo:table-cell>
                            	</fo:table-row>
                            	<fo:table-row>
                            		<fo:table-cell padding-top="0pt" padding-left="0pt"
                            			padding-bottom="0pt" padding-right="5.4pt">
                            			<fo:block-container>
                            				<fo:block font-family="Arial" font-size="10pt" language="EN-US" keep-with-next.within-page="always">
                            					<fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                            				</fo:block>
                            			</fo:block-container>
                            		</fo:table-cell>
                            		<fo:table-cell padding-top="0pt" padding-left="0pt"
                            			padding-bottom="0pt" padding-right="5.4pt">
                            			<fo:block-container>
                            				<fo:block font-family="Arial" font-size="10pt" language="EN-US">
                            					<fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                            				</fo:block>
                            			</fo:block-container>
                            		</fo:table-cell>
                            	</fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>TO:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"
                                                    /><xsl:value-of select="$PIName"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>FROM:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"
                                                    /><xsl:value-of select="$irbBoard"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>PROJECT TITLE:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/><xsl:value-of select="$IRBName"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row> 
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>STUDY #:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/><xsl:value-of select="$IRBNum"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>SUBMISSION TYPE:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/><xsl:value-of select="$subName"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>   
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>ACTION:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/>APPROVED</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>APPROVAL DATE:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/><xsl:if test="$REVDate!='' and $REVDate!='undefined'"><xsl:value-of select="$REVDate"/></xsl:if></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row> 
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>EXPIRATION DATE:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/><xsl:if test="$endDate!='' and $endDate!='undefined'"><xsl:value-of select="$endDate"/></xsl:if></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>REVIEW TYPE:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="0pt"
                                        padding-bottom="0pt" padding-right="5.4pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                    letter-spacing="-0.15pt" font-size="10pt"
                                                    ><fo:leader leader-length="0pt"/><xsl:value-of select="$REVProcessType"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>                        
                        
                        <!--<fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>-->
                        <!--<fo:block font-family="Arial" font-size="10pt" language="EN-US">
                            <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"
                                ><fo:leader leader-length="0pt"/><xsl:value-of select="$CHAIR"/>, <xsl:value-of select="$irbBoard"/></fo:inline>
                        </fo:block>-->
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" text-align="justify" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Thank you for your submission of <xsl:value-of select="$subName"/> materials for this project. The HonorHealth Institutional Review Board has APPROVED your submission. This approval is based on an appropriate risk/benefit ratio and a project design wherein the risks have been minimized. All research must be conducted in accordance with this approved submission.</fo:inline>                                           
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>This submission has received <xsl:value-of select="$REVProcessType"/> based on applicable federal regulations.</fo:inline> 
                        </fo:block>
						<xsl:if test="hasDocs=1">
							<fo:block space-after="0pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" 
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>							
							<fo:block space-after="10pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-family="Arial" font-size="10pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline>
									<fo:leader leader-length="0pt"/>The following items were included in the review of this submission:</fo:inline>
							</fo:block>
							<fo:table font-family="Arial" language="EN-US" start-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:table-column column-number="1" column-width="129.9pt"/>
								<fo:table-column column-number="2" column-width="222pt"/>
								<fo:table-column column-number="3" column-width="63pt"/>
								<fo:table-column column-number="4" column-width="63.9pt"/>
								<fo:table-body start-indent="0pt" end-indent="0pt">
									<fo:table-row height="18.85pt">
										<fo:table-cell padding-top="0pt" padding-left="5.4pt"
											padding-bottom="0pt" padding-right="5.4pt" border-top-style="solid"
											border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black"
											border-left-width="0.5pt" border-bottom-style="solid"
											border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black"
											border-right-width="0.5pt">
											<fo:block-container>
												<fo:block space-after="10pt" space-after.conditionality="retain"
													line-height="1.3190500000000002" font-family="Arial"
													font-size="10pt" language="EN-US">
													<fo:inline font-weight="bold" font-size="9pt">
														<fo:leader
															leader-length="0pt"/>Type</fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="5.4pt"
											padding-bottom="0pt" padding-right="5.4pt" border-top-style="solid"
											border-top-color="black" border-top-width="0.5pt"
											border-bottom-style="solid" border-bottom-color="black"
											border-bottom-width="0.5pt" border-left-style="solid"
											border-left-color="black" border-left-width="0.5pt"
											border-right-style="solid" border-right-color="black"
											border-right-width="0.5pt">
											<fo:block-container>
												<fo:block space-after="10pt" space-after.conditionality="retain"
													line-height="1.3190500000000002" font-family="Arial"
													font-size="10pt" language="EN-US">
													<fo:inline font-weight="bold" font-size="9pt">
														<fo:leader
															leader-length="0pt"/>Description</fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="5.4pt"
											padding-bottom="0pt" padding-right="5.4pt" border-top-style="solid"
											border-top-color="black" border-top-width="0.5pt"
											border-bottom-style="solid" border-bottom-color="black"
											border-bottom-width="0.5pt" border-left-style="solid"
											border-left-color="black" border-left-width="0.5pt"
											border-right-style="solid" border-right-color="black"
											border-right-width="0.5pt">
											<fo:block-container>
												<fo:block space-after="10pt" space-after.conditionality="retain"
													line-height="1.3190500000000002" font-family="Arial"
													font-size="10pt" language="EN-US">
													<fo:inline font-weight="bold" font-size="9pt">
														<fo:leader
															leader-length="0pt"/>Version #</fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="5.4pt"
											padding-bottom="0pt" padding-right="5.4pt" border-top-style="solid"
											border-top-color="black" border-top-width="0.5pt"
											border-right-style="solid" border-right-color="black"
											border-right-width="0.5pt" border-bottom-style="solid"
											border-bottom-color="black" border-bottom-width="0.5pt"
											border-left-style="solid" border-left-color="black"
											border-left-width="0.5pt">
											<fo:block-container>
												<fo:block space-after="10pt" space-after.conditionality="retain"
													line-height="1.3190500000000002" font-family="Arial"
													font-size="10pt" language="EN-US">
													<fo:inline font-weight="bold" font-size="9pt">
														<fo:leader
															leader-length="0pt"/>Date</fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="doc">
										<fo:table-row>
											<fo:table-cell padding-top="0pt" padding-left="5.4pt"
												padding-bottom="0pt" padding-right="5.4pt" border-left-style="solid"
												border-left-color="black" border-left-width="0.5pt"
												border-bottom-style="solid" border-bottom-color="black"
												border-bottom-width="0.5pt" border-top-style="solid"
												border-top-color="black" border-top-width="0.5pt"
												border-right-style="solid" border-right-color="black"
												border-right-width="0.5pt">
												<fo:block-container>
													<fo:block space-after="0pt" space-after.conditionality="retain"
														line-height="1.3190500000000002" font-family="Arial"
														font-size="10pt" language="EN-US">
														<fo:inline font-size="9pt">
															<fo:leader leader-length="0pt"
															/>
															<xsl:value-of select="@type"/>
														</fo:inline>
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="5.4pt"
												padding-bottom="0pt" padding-right="5.4pt"
												border-bottom-style="solid" border-bottom-color="black"
												border-bottom-width="0.5pt" border-top-style="solid"
												border-top-color="black" border-top-width="0.5pt"
												border-left-style="solid" border-left-color="black"
												border-left-width="0.5pt" border-right-style="solid"
												border-right-color="black" border-right-width="0.5pt">
												<fo:block-container>
													<fo:block space-after="0pt" space-after.conditionality="retain"
														line-height="1.3190500000000002" font-family="Arial"
														font-size="10pt" language="EN-US">
														<fo:inline font-size="9pt">
															<fo:leader leader-length="0pt"
															/>
															<!--<xsl:value-of select="replace(@description,'&quot;','')"/>-->
															<xsl:value-of select="@description"/>
														</fo:inline>
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="5.4pt"
												padding-bottom="0pt" padding-right="5.4pt"
												border-bottom-style="solid" border-bottom-color="black"
												border-bottom-width="0.5pt" border-top-style="solid"
												border-top-color="black" border-top-width="0.5pt"
												border-left-style="solid" border-left-color="black"
												border-left-width="0.5pt" border-right-style="solid"
												border-right-color="black" border-right-width="0.5pt">
												<fo:block-container>
													<fo:block space-after="0pt" space-after.conditionality="retain"
														line-height="1.3190500000000002" font-family="Arial"
														font-size="10pt" language="EN-US">
														<fo:inline font-size="9pt">
															<fo:leader leader-length="0pt"
															/>
															<xsl:value-of select="@ver"/>
														</fo:inline>
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="5.4pt"
												padding-bottom="0pt" padding-right="5.4pt"
												border-right-style="solid" border-right-color="black"
												border-right-width="0.5pt" border-bottom-style="solid"
												border-bottom-color="black" border-bottom-width="0.5pt"
												border-top-style="solid" border-top-color="black"
												border-top-width="0.5pt" border-left-style="solid"
												border-left-color="black" border-left-width="0.5pt">
												<fo:block-container>
													<fo:block space-after="0pt" space-after.conditionality="retain"
														line-height="1.3190500000000002" font-family="Arial"
														font-size="10pt" language="EN-US">
														<fo:inline font-size="9pt">
															<fo:leader leader-length="0pt"
															/>
															<xsl:value-of select="@date"/>
														</fo:inline>
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</xsl:if>						
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>                        
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Please remember that informed consent is a process beginning with a description of the project and insurance of participant understanding followed by a signed consent form. Informed consent must continue throughout the project via a dialogue between the researcher and research participant. Federal regulations require that each participant receives a copy of the consent document.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Please note that any revision to previously approved materials must be approved by this committee prior to initiation. Please use the appropriate revision forms for this procedure.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>All UNANTICIPATED PROBLEMS involving risks to subjects or others (UPIRSOs) and SERIOUS and UNEXPECTED adverse events must be reported promptly to this office. Please use the appropriate reporting forms for this procedure. All FDA and sponsor reporting requirements should also be followed.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>All NON-COMPLIANCE issues or COMPLAINTS regarding this project must be reported promptly to this office.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>This project has been determined to be a <xsl:value-of select="$riskLevel"/> project. Based on the risks, this project requires continuing review by this committee on an annual basis. Please use the appropriate forms for this procedure. Your documentation for continuing review must be received with sufficient time for review and continued approval before the expiration date of <xsl:value-of select="$endDate"/>.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Please note that all research records must be retained for a minimum of three years after the completion of the project.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>If you have any questions, please contact <xsl:value-of select="$contactName"/> at <xsl:if test="$contactPhone!='' and $contactPhone!='undefined'"><xsl:value-of select="$contactPhone"/> or </xsl:if><xsl:value-of select="$contactEmail"/>. Please include your project title and study number in all correspondence with this committee.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>                        
                        <fo:block font-family="Arial" font-size="9pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" text-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="8pt"><fo:leader leader-length="0pt"/>This letter has been electronically signed in accordance with all applicable regulations, and a copy is retained within <xsl:value-of select="$irbBoard"/>'s records.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>   					
					</fo:block>
					<!-- End Body Section -->					
					<fo:block id="d0"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
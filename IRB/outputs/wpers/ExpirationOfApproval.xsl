<xsl:stylesheet version="1.1"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="fo" >
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
    
    <xsl:template match="/*">
<fo:root font-family="Arial" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml">
    <fo:layout-master-set xmlns:rx="http://www.renderx.com/XSL/Extensions"
        xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml"
        xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
        xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
        xmlns:w10="urn:schemas-microsoft-com:office:word"
        xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
        <fo:simple-page-master master-name="section1-first-page" page-width="8.5in"
            page-height="11in" margin-top="72pt" margin-bottom="72pt" margin-right="36pt"
            margin-left="36pt">
            <fo:region-body margin-top="-36pt" margin-bottom="-36pt"/>
            <fo:region-before region-name="first-page-header" extent="11in"/>
            <fo:region-after region-name="first-page-footer" extent="11in" display-align="after"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="section1-odd-page" page-width="8.5in" page-height="11in"
            margin-top="72pt" margin-bottom="72pt" margin-right="36pt" margin-left="36pt">
            <fo:region-body margin-top="-36pt" margin-bottom="-36pt"/>
            <fo:region-before region-name="odd-page-header" extent="11in"/>
            <fo:region-after region-name="odd-page-footer" extent="11in" display-align="after"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="section1-even-page" page-width="8.5in"
            page-height="11in" margin-top="72pt" margin-bottom="72pt" margin-right="36pt"
            margin-left="36pt">
            <fo:region-body margin-top="-36pt" margin-bottom="-36pt"/>
            <fo:region-before region-name="even-page-header" extent="11in"/>
            <fo:region-after region-name="even-page-footer" extent="11in" display-align="after"/>
        </fo:simple-page-master>
        <fo:page-sequence-master master-name="section1-page-sequence-master">
            <fo:repeatable-page-master-alternatives>
                <fo:conditional-page-master-reference odd-or-even="odd"
                    master-reference="section1-odd-page"/>
                <fo:conditional-page-master-reference odd-or-even="even"
                    master-reference="section1-even-page"/>
            </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="section1-page-sequence-master" id="IDAFICIC" format="1"
        xmlns:rx="http://www.renderx.com/XSL/Extensions"
        xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml"
        xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
        xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
        xmlns:w10="urn:schemas-microsoft-com:office:word"
        xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
        <fo:static-content flow-name="first-page-header">
            <fo:retrieve-marker retrieve-class-name="first-page-header"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="first-page-footer">
            <fo:retrieve-marker retrieve-class-name="first-page-footer"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="odd-page-header">
            <fo:retrieve-marker retrieve-class-name="odd-page-header"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="odd-page-footer">
            <fo:retrieve-marker retrieve-class-name="odd-page-footer"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="even-page-header">
            <fo:retrieve-marker retrieve-class-name="odd-page-header"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="even-page-footer">
            <fo:retrieve-marker retrieve-class-name="odd-page-footer"
                retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:static-content>
        <fo:static-content flow-name="xsl-footnote-separator">
            <fo:block>
                <fo:leader leader-pattern="rule" leader-length="144pt" rule-thickness="0.5pt"
                    rule-style="solid" color="gray"/>
            </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block widows="2" orphans="2" font-size="10pt" line-height="1.147"
                white-space-collapse="false">
                <fo:marker marker-class-name="first-page-header"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"/>
                <fo:marker marker-class-name="first-page-footer"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"/>
                <fo:marker marker-class-name="odd-page-header"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg">                    
                    <fo:block font-family="Arial" font-size="12pt" language="EN-US">
                        <fo:leader/>
                    </fo:block>
                </fo:marker>
                <fo:marker marker-class-name="odd-page-footer"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"/>
                <fo:marker marker-class-name="even-page-header"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"/>
                <fo:marker marker-class-name="even-page-footer"
                    xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"/>
                <fo:block id="IDAKIOTD" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg">
                    
                    <fo:block id="IDALIOTD">
                        <fo:table xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" font-family="Calibri" language="EN-IN" start-indent="0pt">
                            <fo:table-column column-number="1" column-width="37%"/>
                            <fo:table-column column-number="2" column-width="35%"/>
                            <fo:table-column column-number="3" column-width="28%"/>
                            <fo:table-body start-indent="0pt" end-indent="0pt">
                                <fo:table-row height="64.2pt" border="1">
                                    <fo:table-cell background-color="white" color="black">
                                        <fo:block-container>
                                            <fo:block text-align="justify">
                                                <fo:external-graphic src="url('https://ideate.mssm.edu/pix/nonreg_MSMC_RGB_Vrtl.png')" content-width="2cm"/>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell background-color="white" color="black">
                                        <fo:block-container>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Icahn School of Medicine at Mount Sinai</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai Beth Israel</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai Brooklyn</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>The Mount Sinai Hospital</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai Queens</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>New York Eye and Ear Infirmary</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>of Mount Sinai</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai St. Luke's</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai West</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell background-color="white" color="black">
                                        <fo:block-container>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-weight="bold" font-size="10pt"><fo:leader leader-length="0pt"/>Program for the Protection</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-weight="bold" font-size="10pt"><fo:leader leader-length="0pt"/>of Human Subjects</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-style="italic" font-size="10pt"><fo:leader leader-length="0pt"/>Institutional Review Boards</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="0.5" language="EN-US">
                                                <fo:inline font-style="italic" font-size="10pt"><fo:leader leader-length="0pt"/></fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>Mount Sinai Health System</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>One Gustave L. Levy Place, Box 1081</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>New York, NY 10029-6574</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>T 212-824-8200</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>F 212-876-6789</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>irb@mssm.edu</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt" space-after.conditionality="retain" line-height="1.1" language="EN-US">
                                                <fo:inline font-size="10pt"><fo:leader leader-length="0pt"/>icahn.mssm.edu/pphs</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" text-align="justify" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            keep-with-next.within-page="always" text-align="center"
                            font-weight="bold" letter-spacing="-0.15pt" text-decoration="underline">
                            <fo:inline font-size="12pt"><fo:leader leader-length="0pt"/>EXPIRATION OF IRB APPROVAL</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" text-align="justify" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                            <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"
                                ><fo:leader leader-length="0pt"/>Date: <xsl:value-of select="$TODAY"/></fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                            <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"
                                ><fo:leader leader-length="0pt"/>To: <xsl:value-of select="$PIName"/></fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block font-family="Arial" font-size="12pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt" 
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>On <xsl:value-of select="$endDate"/> the Institutional Review Board (IRB) approval of the following human subject research expired.</fo:inline>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>                        
                        <fo:table font-family="Arial" language="EN-US" start-indent="0pt">
                            <fo:table-column column-number="1" column-width="160.9pt"/>
                            <fo:table-column column-number="2" column-width="389.9pt"/>
                            <fo:table-body start-indent="0pt" end-indent="0pt">
                                
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Project Title:</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/><xsl:value-of select="$IRBName"/></fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Investigator:</fo:inline>
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
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Department:</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                  letter-spacing="-0.15pt" font-size="10pt"
                                                  ><fo:leader leader-length="0pt"
                                                  />
													<xsl:value-of select="$irbDEPT"/>
												<!--	<xsl:choose>
														<xsl:when test="$irbDIV = ''"><xsl:value-of select="$irbDIV"/>
														</xsl:when>
														<xsl:otherwise> - <xsl:value-of select="$irbDIV"/>
														</xsl:otherwise>
													</xsl:choose>	-->													
												  </fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Project #:</fo:inline>
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
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Sites:</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial"
                                                  letter-spacing="-0.15pt" font-size="10pt"
                                                  ><fo:leader leader-length="0pt"/>
													<xsl:for-each select="siteName">
														<xsl:choose>
															<xsl:when test="position() = 1"><xsl:value-of select="."/>
															</xsl:when>
															<xsl:otherwise>, <xsl:value-of select="."/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>																						
												</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Funding Agency:</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt">
                                                    <fo:leader leader-length="0pt"/>
                                                        <xsl:for-each select="facultySponsor">
                                                            <xsl:choose>
                                                                <xsl:when test="position() = 1"><xsl:value-of select="@num"/> - <xsl:value-of select="@sponsor"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>, <xsl:value-of select="@num"/> - <xsl:value-of select="@sponsor"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:for-each>
                                                  </fo:inline>
                                              </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>IND (if any):</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/>
                                                <xsl:choose>
                                                    <xsl:when test="count(Drug[@drugValidIND='1']) &gt; 0">
                                                        <xsl:for-each select="Drug[@drugValidIND='1']">
                                                            <xsl:choose>
                                                                <xsl:when test="position() = 1"><xsl:value-of select="@nonRoutineDrugsINDNumber"/> - <xsl:value-of select="@nonRoutineDrugsINDHolder"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>, <xsl:value-of select="@nonRoutineDrugsINDNumber"/> - <xsl:value-of select="@nonRoutineDrugsINDHolder"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>NO IND
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
								<fo:table-row>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-left-style="solid" border-left-color="black"
                                        border-left-width="0.5pt" border-bottom-style="solid"
                                        border-bottom-color="black" border-bottom-width="0.5pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>IDE (if any):</fo:inline>
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
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/>
													<xsl:choose>
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
												</xsl:choose>
												</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>

                            </fo:table-body>
                        </fo:table>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline color="black"><fo:leader leader-length="0pt"/>All research activities must stop. This includes recruitment, advertisement, screening, enrollment, consent, interventions, interactions, and collection of private identifiable information. Advertisements currently running in the media must be pulled.</fo:inline>
						</fo:block>
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline color="black" text-decoration="underline"><fo:leader leader-length="0pt"/>Continuation of research activities without prior IRB review and approval is a violation of federal regulations.</fo:inline>
						</fo:block>
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline color="black" font-weight="bold"><fo:leader leader-length="0pt"/>If you believe that current subjects are at risk of harm by stopping research procedures:</fo:inline>
						</fo:block>
						<fo:list-block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:list-item space-after="0.5ex">
								<fo:list-item-label start-indent="1em">
									<fo:block>
										-
									</fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block start-indent="2em">
										<fo:inline color="black" font-weight="bold"><fo:leader leader-length="0pt"/>Prepare a written list of subjects who will be harmed, the research procedures that need to continue, and the reasons that these procedures need to continue.</fo:inline>							
									</fo:block>										
								</fo:list-item-body>
							</fo:list-item>
							<fo:list-item space-after="0.5ex">
								<fo:list-item-label start-indent="1em">
									<fo:block>
										-
									</fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
									<fo:block start-indent="2em">
										<fo:inline color="black" font-weight="bold"><fo:leader leader-length="0pt"/>Immediately contact the Program for Protection of Human Subjects (PPHS) office and provide them with a copy of this list.</fo:inline>							
									</fo:block>
								</fo:list-item-body>
							</fo:list-item>
						</fo:list-block>
						
						
                        
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black"><fo:leader leader-length="0pt"/>An IRB member (if needed, in consultation with others) will decide whether there is an over-riding safety concern or ethical issue involved such that it is in the best interest of individual subjects.</fo:inline>
						</fo:block>	
						
						
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black" font-weight="bold"><fo:leader leader-length="0pt"/>If you have not already done so, please submit a completed Continuing/Final Review Progress Report and required attachments to request continuing approval or study closure.</fo:inline>
						</fo:block>	
						                                         						
							
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black" ><fo:leader leader-length="0pt"/>If you have already submitted a Continuation/Final Report application in Ideate, please disregard this reminder notice.</fo:inline>
						</fo:block>	
						                                         						
												
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black"><fo:leader leader-length="0pt"/>A copy of this letter will be forwarded to your supervisor.</fo:inline>							
						</fo:block>													
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black"><fo:leader leader-length="0pt"/>Sincerely,</fo:inline>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black"><fo:leader leader-length="0pt"/>The Program for the Protection of Human Subjects Staff</fo:inline>
						</fo:block>
						
                    </fo:block>
                </fo:block>
            </fo:block>
            <fo:block id="IDACICIC"/>
        </fo:flow>
    </fo:page-sequence>
</fo:root>

    </xsl:template>
</xsl:stylesheet>
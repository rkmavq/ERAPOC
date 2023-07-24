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
                            <fo:inline font-size="12pt"><fo:leader leader-length="0pt"/>APPROVAL OF HUMANITARIAN USE DEVICE</fo:inline>
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
                        <fo:block font-family="Arial" font-size="12pt" language="EN-US">
                            <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"
                                ><fo:leader leader-length="0pt"/>On <xsl:value-of select="$meetingDate"/>, an Institutional Review Board (IRB) of the Icahn School of Medicine at Mount Sinai, in accordance with Mount Sinai&apos;s Federal Wide Assurances (#FWA00005656, FWA#00005651) to the Department of Health and Human Services approved your request to use the following Humanitarian Use Device (HUD) from  <xsl:value-of select="$startDate"/> until <xsl:value-of select="$endDate"/> inclusive:</fo:inline>
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
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-left-style="solid"
                                        border-left-color="black" border-left-width="0.5pt"
                                        border-bottom-style="solid" border-bottom-color="black"
                                        border-bottom-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt"
                                                language="EN-US" keep-with-next.within-page="always">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Type of Review:</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt"
                                        padding-bottom="0pt" padding-right="5.4pt"
                                        border-top-style="solid" border-top-color="black"
                                        border-top-width="0.5pt" border-right-style="solid"
                                        border-right-color="black" border-right-width="0.5pt"
                                        border-bottom-style="solid" border-bottom-color="black"
                                        border-bottom-width="0.5pt" border-left-style="solid"
                                        border-left-color="black" border-left-width="0.5pt">
                                        <fo:block-container>
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/><xsl:value-of select="$subName"/></fo:inline>
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
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>HUD Name :</fo:inline>
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
                                                    <xsl:when test="dataHUD =''">NO HUD</xsl:when>
                                                    <xsl:otherwise><xsl:value-of select="dataHUD"/>
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
                                            <fo:block font-family="Arial" font-size="10pt" language="EN-US">
                                                <fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>HDE :</fo:inline>
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
													<xsl:when test="hudNum =''">NO HDE</xsl:when>
													<xsl:otherwise><xsl:value-of select="hudNum"/>,<xsl:value-of select="manufacturer"/>
													</xsl:otherwise>
												</xsl:choose>
												</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
								
								
								<xsl:if test="$subType = 'AM'">
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
													<fo:inline font-family="Arial" font-size="10pt"><fo:leader leader-length="0pt"/>Submission Details (if any):</fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="5.4pt"
											padding-bottom="0pt" padding-right="5.4pt"
											border-bottom-style="solid" border-bottom-color="black"
											border-bottom-width="0.5pt" border-right-style="solid"
											border-right-color="black" border-right-width="0.5pt"
											border-top-style="solid" border-top-color="black"
											border-top-width="0.5pt" border-left-style="solid"
											border-left-color="black" border-left-width="0.5pt">
											<fo:block-container>
												<fo:block font-family="Arial" font-size="10pt"
													language="EN-US">
													<fo:inline font-family="Arial" letter-spacing="-0.15pt" font-size="10pt"><fo:leader leader-length="0pt"/><xsl:value-of select="modificationSummary"/></fo:inline>
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
									</fo:table-row>
								</xsl:if>
                                
								
								
								
                            </fo:table-body>
                        </fo:table>
                        
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline color="black"><fo:leader leader-length="0pt"/>Before <xsl:value-of select="$endDate"/> or within 30 days of discontinuation of HUD use, whichever is earlier, you are to submit a completed Continuation and required attachments to request continuing approval or study closure.</fo:inline>                            
                        </fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
                            text-indent="36pt" letter-spacing="-0.15pt">
                            <fo:leader/>
                        </fo:block>	
                        <fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
                            orphans="1" color="#000000" end-indent="0pt"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline color="black"><fo:leader leader-length="0pt"/>If continuing review approval is not granted before the expiration date of </fo:inline>
                            <fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="$endDate"/></fo:inline>
                            <fo:inline color="black"><fo:leader leader-length="0pt"/>, approval for use of the HUD expires on that date.</fo:inline>
                        </fo:block>
                        
						
						<!--<xsl:if test="requestingWaiverAlteration = '1'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>The IRB approved the request for Waiver of Authorization for use and disclosure of PHI for this project on </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="orgApprovalDate"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>. This request was reviewed and approved by </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="reviewLevel"/> review procedures. This approval is based on the fact that the waiver of authorization satisfies the following criteria: 1. The use or disclosure of PHI involves no more than a minimal risk to the privacy of individuals, based on, at least, the presence of: A. an adequate plan to protect the identifiers from improper use and disclosure;  B. an adequate plan to destroy the identifiers at the earliest opportunity consistent with the conduct of research, unless there is a health or research justification for retaining the identifiers or such retention  is otherwise required by law; and C. the PI has provided adequate written assurances that the PHI will not be reused or disclosed to any other person or entity, except as required by law, for authorized oversight of the research study or for other research for which the use or disclosure of PHI would be permitted by the Privacy Regulations. 2. The research could not practicably be conducted without the waiver; and 3. The research could not practicably be conducted without access to and use of the PHI.</fo:inline>								
							</fo:block>							
						</xsl:if>
						-->						
                        
						<!--<xsl:if test="requestingWaiverAlteration = '2'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>The IRB approved the request for Alteration of Authorization waiver of signature for use and disclosure of PHI for this project on </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="orgApprovalDate"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>. This request was reviewed and approved by expedited review procedures. The IRB determined that the waiver of authorization satisfies the following criteria:</fo:inline>								
							</fo:block>
							<fo:list-block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:list-item space-after="0.5ex">
									<fo:list-item-label start-indent="1em">
										<fo:block>
											1.
										</fo:block>
									</fo:list-item-label>
									<fo:list-item-body>
										<fo:block start-indent="2em">
											<fo:inline color="black"><fo:leader leader-length="0pt"/>The use or disclosure of PHI involves no more than a minimal risk to the privacy of individuals, based on, at least, the presence of:</fo:inline>							
										</fo:block>
										<fo:list-block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
											orphans="1" color="#000000" end-indent="0pt"
											xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
											xmlns:svg="http://www.w3.org/2000/svg">
											<fo:list-item space-after="0.5ex">
												<fo:list-item-label start-indent="2em">
													<fo:block>
														i.
													</fo:block>
												</fo:list-item-label>
												<fo:list-item-body>
													<fo:block start-indent="3em">
														<fo:inline color="black"><fo:leader leader-length="0pt"/>an adequate plan to protect the identifiers from improper use and disclosure;</fo:inline>							
													</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item space-after="0.5ex">
												<fo:list-item-label start-indent="2em">
													<fo:block>
														ii.
													</fo:block>
												</fo:list-item-label>
												<fo:list-item-body>
													<fo:block start-indent="3em">
														<fo:inline color="black"><fo:leader leader-length="0pt"/>an adequate plan to destroy the identifiers at the earliest opportunity consistent with the conduct of research, unless there is a health or research justification for retaining the identifiers or such retention is otherwise required by law; and</fo:inline>							
													</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item space-after="0.5ex">
												<fo:list-item-label start-indent="2em">
													<fo:block>	
														iii.
													</fo:block>
												</fo:list-item-label>
												<fo:list-item-body>
													<fo:block start-indent="3em">
														<fo:inline color="black"><fo:leader leader-length="0pt"/>the PI has provided adequate written assurances that the PHI will not be reused or disclosed to any other person or entity, except as required by law, for authorized oversight of the research study or for other research for which the use or disclosure of PHI would be permitted by the Privacy Regulations.</fo:inline>							
													</fo:block>
												</fo:list-item-body>
											</fo:list-item>
										</fo:list-block>
									</fo:list-item-body>
								</fo:list-item>
								<fo:list-item space-after="0.5ex">
									<fo:list-item-label start-indent="1em">
										<fo:block>
											2.
										</fo:block>
									</fo:list-item-label>
									<fo:list-item-body>
										<fo:block start-indent="2em">
											<fo:inline color="black"><fo:leader leader-length="0pt"/>The research could not practicably be conducted without the waiver;</fo:inline>							
										</fo:block>
									</fo:list-item-body>
								</fo:list-item>
								<fo:list-item space-after="0.5ex">
									<fo:list-item-label start-indent="1em">
										<fo:block>	
											3.
										</fo:block>
									</fo:list-item-label>
									<fo:list-item-body>
										<fo:block start-indent="2em">
											<fo:inline color="black"><fo:leader leader-length="0pt"/>The research could not practicably be conducted without access to and use of the PHI.</fo:inline>							
										</fo:block>
									</fo:list-item-body>
								</fo:list-item>
							</fo:list-block>		
						</xsl:if>-->
						
					<!--	<xsl:if test="obtainingHIPAAAuthorization = '0'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>The PHI for which access has been determined to be necessary for this project [which are the minimum necessary] include the following:</fo:inline>								
							</fo:block>
							<xsl:for-each select="dataRecord">
								<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="."/></fo:inline>								
							</fo:block>
							</xsl:for-each>
							
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">								
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="healthInfoViewedRecordedDescription"/></fo:inline>								
							</fo:block>	
						</xsl:if>-->
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
						<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
							orphans="1" color="#000000" end-indent="0pt"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="addLetterText"/></fo:inline>
						</fo:block>
						
					<!--	<xsl:if test="HIVInfoInformedConsent = '1'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>This project is conducting HIV testing as part of the research activity.</fo:inline>
							</fo:block>							
						</xsl:if>-->
						
						<!--<xsl:if test="requestingWaiverForAnyProcedures = '1'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>The request for waiver of informed consent was approved on </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="$meetingDate"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/> This waiver is granted for </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="requestingWaiverFor"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>. This research presents no more than minimal risk to the subjects, will not adversely affect the rights and welfare of the subjects, and could not practicably be carried out without a waiver. In addition, subjects will be provided with additional pertinent information after participation if the investigator believes this would be appropriate.</fo:inline>								
							</fo:block>							
						</xsl:if>-->
						
						<!--<xsl:if test="consentWaiver = '1'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>The request for alteration of signed consent was approved on </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="$meetingDate"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>. This waiver is granted for a </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="describeAlterationConsent"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>. The research presents no more than minimal risks of harm to subjects and involves no procedures for which written informed consent is normally required outside of the research context.</fo:inline>								
							</fo:block>							
						</xsl:if>-->
						
						<!--<xsl:if test="renewalDateFlag = '1'">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>This application was not submitted to the IRB in sufficient time to allow IRB review and re-approval prior to the expiration date of IRB approval. It must be noted that if any subjects were entered or studied between </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><xsl:value-of select="prevApprovalEndDate"/></fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/>and the final IRB approval date of this continuing review, the research was unauthorized by the IRB.</fo:inline>															
							</fo:block>							
						</xsl:if>		-->										
						
						<fo:block font-family="Arial" font-size="10pt" language="EN-US"
							text-indent="36pt" letter-spacing="-0.15pt">
							<fo:leader/>
						</fo:block>
					<!--	
						<xsl:if test="count(Drug/@typeINDHolder[.='1']) &gt; 0">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline font-weight="bold" color="black"><fo:leader leader-length="0pt"/>It is the responsibility of the Investigator to be aware of the requirements of holding an IND, which include, but are not limited to, an annual report to the FDA due on the anniversary of the effective date of the IND. Please note that the annual report requirement is NOT dependent on whether the project was IRB approved, or whether any subjects were enrolled.</fo:inline>								
							</fo:block>							
						</xsl:if>
						
						<xsl:if test="facultySponsor[@sponsor = 'Department Of Defense' or @sponsor = 'Army Research Office' or @sponsor = 'Department Of The Army']">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>This letter should be send to the Director of Defense Research and Engineering at </fo:inline>
								<fo:inline color="black"><fo:leader leader-length="0pt"/><fo:basic-link external-destination="url('ddre@dtic.mil')" color="blue" text-decoration="underline">ddre@dtic.mil</fo:basic-link></fo:inline>	
							</fo:block>							
						</xsl:if>-->
						<!--<xsl:if test="facultySponsor[@sponsor = 'Environmental Protection Agency']">
							<fo:block font-family="Arial" font-size="10pt" language="EN-US"
								text-indent="36pt" letter-spacing="-0.15pt">
								<fo:leader/>
							</fo:block>
							<fo:block font-family="Arial" font-size="10pt" language="EN-US" widows="1"
								orphans="1" color="#000000" end-indent="0pt"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:inline color="black"><fo:leader leader-length="0pt"/>For research sponsored by the Environmental Protection Agency (EPA), this letter should be sent to EPA Human Subject Board Official at ORD-OSA-HSRB@epa.gov.</fo:inline>
							</fo:block>							
						</xsl:if>-->
                    </fo:block>
                </fo:block>
            </fo:block>
            <fo:block id="IDACICIC"/>
        </fo:flow>
    </fo:page-sequence>
</fo:root>

    </xsl:template>
</xsl:stylesheet>
<?xml version='1.1' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:ibex="http://www.xmlpdf.com/2003/ibex/Format">
    
    <xsl:strip-space elements='*'/>
    
    
    <xsl:attribute-set name="heading">
        <xsl:attribute name='space-before'>18pt</xsl:attribute>
        <xsl:attribute name='font'>bold 14pt Helvetica</xsl:attribute>
        <xsl:attribute name='text-align'>left</xsl:attribute>
        <xsl:attribute name='keep-with-next.within-page'>always</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name='leader-ahead'>
        <xsl:attribute name='rule-thickness'>.2pt</xsl:attribute>
        <xsl:attribute name='leader-length'>100%</xsl:attribute>
        <xsl:attribute name='leader-pattern'>rule</xsl:attribute>
    </xsl:attribute-set>
        
      
    <xsl:template match="pdf">        
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml" font-family="Helvetica">
            
            <!-- define a set of page layouts -->
            <fo:layout-master-set>
                
                <fo:simple-page-master  master-name="page" page-width="8.5in" page-height="11in" margin-top="26pt" margin-bottom="26pt" margin-right="22pt" margin-left="22pt">                    
                    <fo:region-body region-name="body"/>
                    <!--<fo:region-end extent="2cm"/>-->
                </fo:simple-page-master>
                <!--<fo:simple-page-master master-name="page" page-width="8.5in" page-height="11in" margin-top="26pt" margin-bottom="26pt" margin-right="22pt" margin-left="22pt">
                    <fo:region-body margin-top="26pt" margin-bottom="26pt"/>
                    <fo:region-before region-name="first-page-header" extent="11in"/>
                    <fo:region-after region-name="first-page-footer" extent="11in" display-align="after"/>
                </fo:simple-page-master>-->
                <fo:simple-page-master master-name="section1-first-page" page-width="8.5in" page-height="11in" margin-top="26pt" margin-bottom="26pt" margin-right="22pt" margin-left="22pt">
                    <fo:region-body margin-top="26pt" margin-bottom="26pt"/>
                    <fo:region-before region-name="first-page-header" extent="11in"/>
                    <fo:region-after region-name="first-page-footer" extent="11in" display-align="after"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="section1-odd-page" page-width="8.5in" page-height="11in" margin-top="26pt" margin-bottom="26pt" margin-right="22pt" margin-left="22pt">
                    <fo:region-body margin-top="26pt" margin-bottom="26pt"/>
                    <fo:region-before region-name="odd-page-header" extent="11in"/>
                    <fo:region-after region-name="odd-page-footer" extent="11in" display-align="after"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="section1-even-page" page-width="8.5in" page-height="11in" margin-top="26pt" margin-bottom="26pt" margin-right="22pt" margin-left="22pt">
                    <fo:region-body margin-top="26pt" margin-bottom="26pt"/>
                    <fo:region-before region-name="even-page-header" extent="11in"/>
                    <fo:region-after region-name="even-page-footer" extent="11in" display-align="after"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="section1-page-sequence-master">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference odd-or-even="odd" master-reference="section1-odd-page"/>
                        <fo:conditional-page-master-reference odd-or-even="even" master-reference="section1-even-page"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>
            
            <!-- table of pdfs -->
            <fo:page-sequence  xmlns:rx="http://www.renderx.com/XSL/Extensions" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml" 
                xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" xmlns:aml="http://schemas.microsoft.com/aml/2001/core" xmlns:w10="urn:schemas-microsoft-com:office:word" 
                xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" master-reference="page"  id="{generate-id(.)}" format="1" force-page-count="no-force">
                <fo:static-content flow-name="first-page-header">
                    <fo:retrieve-marker retrieve-class-name="first-page-header" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="first-page-footer">
                    <fo:retrieve-marker retrieve-class-name="first-page-footer" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="odd-page-header">
                    <fo:retrieve-marker retrieve-class-name="odd-page-header" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="odd-page-footer">
                    <fo:retrieve-marker retrieve-class-name="odd-page-footer" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="even-page-header">
                    <fo:retrieve-marker retrieve-class-name="odd-page-header" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="even-page-footer">
                    <fo:retrieve-marker retrieve-class-name="odd-page-footer" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
                </fo:static-content>
                <fo:static-content flow-name="xsl-footnote-separator">
                    <fo:block>
                        <fo:leader leader-pattern="rule" leader-length="144pt" rule-thickness="0.5pt" rule-style="solid" color="gray"/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="body">
                    <fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
                    
                    
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="first-page-header"></fo:marker>
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="first-page-footer"/>
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="odd-page-header"/>
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="odd-page-footer"/>
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="even-page-header"/>
                        <fo:marker xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" marker-class-name="even-page-footer"/>
                        <fo:table xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" font-family="Calibri" language="EN-IN" start-indent="0pt">
                            <fo:table-column column-number="1" column-width="300pt"/>
                            <fo:table-column column-number="2" column-width="432.3pt"/>
                            <fo:table-body start-indent="0pt" end-indent="0pt">
                                <fo:table-row height="64.2pt" border="1">
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" border-bottom-color="black" border-bottom-width="0.5pt" border-right-style="solid" border-right-color="black" border-right-width="1.5pt" background-color="white" color="black" display-align="before">
                                        <fo:block-container>
                                            <!--<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;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&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-->
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US">
                                                <fo:inline font-weight="bold" font-size="14pt"><fo:leader leader-length="0pt"/>Icahn School of Medicine at</fo:inline>      
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US">                                          
                                                <fo:inline font-weight="bold" font-size="18pt"><fo:leader leader-length="0pt"/>Mount Sinai</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" border-bottom-color="black" border-bottom-width="0.5pt" border-left-style="solid" border-left-color="black" border-left-width="1.5pt" background-color="white" color="black" display-align="center">
                                        <fo:block-container>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US">
                                                <fo:inline font-weight="bold" font-size="12pt"><fo:leader leader-length="0pt"/>Institutional Animal Care and Use Committee</fo:inline>                                            
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>One Gustave L. Levy Place</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>Box 1155</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>New York, NY 10029</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>Tel: (212) 241-0153</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>Fax: (212) 241-5550</fo:inline>
                                            </fo:block>
                                            <fo:block space-after="0pt"
                                                space-after.conditionality="retain" line-height="1.147"
                                                font-family="Calibri" font-size="11pt" language="EN-US"
                                                start-indent="108pt">
                                                <fo:inline font-size="9pt"><fo:leader leader-length="0pt"/>Email: iacuc@mssm.edu</fo:inline>
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block space-after="10pt" space-after.conditionality="retain"
                        line-height="1.3190500000000002" font-size="11pt"
                        language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                        xmlns:svg="http://www.w3.org/2000/svg">
                        <fo:leader/>
                    </fo:block>
                    
                    <fo:block space-after="0pt"
                        space-after.conditionality="retain" line-height="1.147"
                        font-family="Calibri" font-size="11pt" language="EN-US"  text-align="center">
                        <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//DEBUG[1]/@opName"/></fo:inline>      
                    </fo:block>
                    <fo:block space-after="0pt"
                        space-after.conditionality="retain" line-height="1.147"
                        font-family="Calibri" font-size="11pt" language="EN-US"  text-align="center">
                        <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//pdf/@id8ID"/></fo:inline>      
                    </fo:block>
                    <fo:block space-after="0pt"
                        space-after.conditionality="retain" line-height="1.147"
                        font-family="Calibri" font-size="11pt" language="EN-US"  text-align="center">
                        <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//pdf/@PIName"/></fo:inline>      
                    </fo:block>
                    <fo:block space-after="10pt" space-after.conditionality="retain"
                        line-height="1.3190500000000002" font-size="11pt"
                        language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                        xmlns:svg="http://www.w3.org/2000/svg">
                        <fo:leader/>
                    </fo:block>
                    <fo:block space-after="10pt" space-after.conditionality="retain"
                        line-height="1.3190500000000002" font-size="11pt"
                        language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                        xmlns:svg="http://www.w3.org/2000/svg" text-align="center">
                        <fo:inline font-size="12pt" font-weight="bold"><fo:leader leader-length="0pt"/>Table of Contents</fo:inline>
                    </fo:block>
                    <xsl:apply-templates select="DEBUG | DEBUG/heading" mode="toc"/>
                </fo:flow>
            </fo:page-sequence>
            
            <!-- pdfs -->
            <xsl:apply-templates select="DEBUG"/>
            
        </fo:root>
        
    </xsl:template>
    
    
    
    
    <xsl:template match="DEBUG" mode="toc">
        
        <fo:block text-align='justify' text-align-last="justify" space-after="3pt">            
            <!-- the actual pdf -->
            <fo:basic-link>                
                <xsl:variable name="DEBUG-number">
                    <xsl:number level="multiple" count="DEBUG" format="1.1.1. "/>
                </xsl:variable>
                
                <xsl:variable name="reference">
                    <xsl:number level="multiple" count="DEBUG" format="1.1"/>
                </xsl:variable>
                
                <xsl:attribute name='internal-destination'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                
                <!-- insert the DEBUG number -->
                <!-- the introduction comes before DEBUG one and has no DEBUG number -->
                
                <xsl:value-of select="$DEBUG-number"/>                
                <xsl:value-of select='@heading'/>                
                <!-- the default leader width is 0,12pt,100% which works for this -->
                <!--&#160;-->
                <fo:leader leader-pattern='dots' rule-thickness='.2pt' 
                    leader-alignment='reference-area' font-size="10pt"/>
                <!--&#160;-->
                
                <!-- can click on page number -->                
                <fo:page-number-citation>
                    <xsl:attribute name='ref-id'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                </fo:page-number-citation>
                
            </fo:basic-link>
            
        </fo:block>
    </xsl:template>
    
    <xsl:template match="heading" mode='toc'>
        <!--<fo:block text-align='justify' text-align-last="justify" space-after="3pt" margin-left="1cm" 
            margin-right='.1cm'  font-size='0.9em'>-->
            <fo:block text-align='justify' text-align-last="justify" space-after="3pt" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
            
            <xsl:variable name="DEBUG-number">
                <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
            </xsl:variable>
            
            <xsl:variable name="reference">
                <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
            </xsl:variable>
            
            <fo:basic-link>
                
                
                <xsl:attribute name='internal-destination'>ahead-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                
                <!-- insert the DEBUG number -->
                
                <xsl:value-of select='$DEBUG-number'/>
                
                <!-- allows </prod> in title -->
                <xsl:apply-templates/>
                <!-- the default leader width is 0,12pt,100% which works for this -->
                <!--&#160;-->
                <fo:leader leader-pattern='dots' rule-thickness='.2pt' 
                    leader-alignment='reference-area' font-size="10pt"/>
                
                <!--&#160;-->
                
                <!-- can click on page number -->
                
                <fo:page-number-citation>
                    <xsl:attribute name='ref-id'>ahead-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                </fo:page-number-citation>
                
            </fo:basic-link>
            
        </fo:block>
    </xsl:template>
    
    <!-- header across page for one attribute -->
    <xsl:template match="heading">
        
        <xsl:variable name="DEBUG-number">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
        </xsl:variable>
        
        <xsl:variable name="reference">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
        </xsl:variable>
        
        
        <!-- use a list so the number is outside the pdf -->
        <fo:list-block margin-left='-2cm' provisional-distance-between-starts="2cm" 
            provisional-label-separation=".25cm">
            
            <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                    <fo:block text-align="right">
                        <!-- destination for toc -->
                        <xsl:attribute name='id'>ahead-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                        
                        <fo:inline >
                            <xsl:value-of select="$DEBUG-number"/>
                        </fo:inline>
                    </fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                    <fo:block>
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:list-item-body>
            </fo:list-item>
        </fo:list-block>
        
    </xsl:template>
    
    
    <xsl:template match="DEBUG">
        
        <xsl:variable name="DEBUG-number">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
        </xsl:variable>
        
        <xsl:variable name="reference">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
        </xsl:variable>
        
        <!-- if first DEBUG, set page number to 1 -->
        <fo:page-sequence>
            
            <xsl:attribute name='master-reference'>page</xsl:attribute>
            <xsl:attribute name='force-page-count'>no-force</xsl:attribute>
            
            
            
            <xsl:if test='position() = 1'>
                <xsl:attribute name='initial-page-number'>1</xsl:attribute>
            </xsl:if>
            
            <fo:flow flow-name="body">
                <fo:table start-indent="5pt" border-style="none" border-width="0.5pt">								
                    <fo:table-column column-width="33%"/>
                    <fo:table-column column-width="33%"/>
                    <fo:table-column column-width="33%"/>
                        <fo:table-body start-indent="0pt">    
                <fo:table-row height="15.0pt">
                    <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" border-bottom-color="black" 
                        border-bottom-width="0.5pt" border-right-style="none" border-right-color="black" border-right-width="1.5pt" background-color="white" color="black" display-align="before">
                        <fo:block-container>
                            <!--<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;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&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-->
                            <fo:block space-after="0pt"
                                space-after.conditionality="retain" line-height="1.147"
                                font-family="Calibri" font-size="11pt" language="EN-US"  text-align="left">
                                <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//pdf/@id8ID"/></fo:inline>      
                            </fo:block>
                            
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" border-bottom-color="black" 
                        border-bottom-width="0.5pt" border-right-style="none" border-right-color="black" border-right-width="1.5pt" background-color="white" color="black" display-align="before">
                        <fo:block-container>
                            <!--<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;IQuBwCJLIJtgMGDAgI/oM8GYYAw4nHPgHC7nnHPOOXA5+KIvxz/hvu9V96TVsiv/Vne/02zzQ9M7&#xA;Xf3q1Vevvvfq1RulVne97TOfedvqWq63WiME3jc19b41ErUuZlUIfHgK15+squl6ozVB4Jb3EvI3&#xA;7lgTYetCVoPAtp8i5N94cDVt19usBQL/5Dg/PjX1t5XKV62FtHUZyyLwhS9kj279K8f5tz986MEg&#xA;+JY3rON1BhH41mTm40b8q/secJyfe75c/uep3z6DHU686Fv/YS753K2E4eMzSfIlZ+tdwUcfmpr6&#xA;lYkH5swB8OpMMpO8Cvm3fm5uLnnh76694hPfBRf63v88c11OuORNx5K5ZO6Oq5X6mSSZ2zfzy0r9&#xA;LqOWqd+fcGDO2PD3bn7HdUmy/5HZHZuueXRmZuaZ8sV7N/8OEP++B998xjqdbMHbnOLJJPmlIDi4&#xA;wflKYH80OPLrzmffODX1fCW4ebKhOUOjv8cpFp1jzwSV4MSljvNA8lIQvPQBx/mzqW8Oyh/90fX8&#xA;1trDvnGD4xSdj32xEvxjct01jvMHQeXo/hmA/1sPVsrftJ7fWnvE1TaH1+5DwR/v3zd3m7P5O4Ly&#xA;iYTg776y/C8g9A+fgT4nW+Qm4F10tir18jPJzFzy/nvUoVeSJJm5bat607f/MCPFdWpZWwsBrRQd&#xA;5/j5Sv08opZk5oduUHv/gzf7f0CpP5dI8TfWtseJl3YRfadzj1Lnb7gUSO8/eq/a9tq/A/JXZnfc&#xA;7/wiEP/r4PqJR2ktAdhEG3e2QeRWx7kt2feRoPL9jvP+ZN+JcuXgHuez3z310IPl2RvWsssJl7Vx&#xA;M5l8w16lduPmmut+LAiOfs9rAH//0Urlj04WnZ+dej4oB++ZcJjWcvhbwSpFZ5NS15LSi5ceDYIT&#xA;c8cA/k+UKx9JPvWOovOrlXIQBI+vZacTLYumndMKsb//YPAS8lsnnW1XB8GPJMkxZ/MbjpTL5Urw&#xA;ponGae0Gfy1pxdm8Ual3M1B0LlE7vrgfOcXrPnaLuvFuZLqSk4+pm4NKpVy+fO16nWhJWwEzTBu0&#xA;splO9G+A/a/NwcrnflCp33wUNzN/Aet+cwWpgMpXTDRSazX43YL4JRD3Folb3qrUJucDM/uSE8Eh&#xA;dRPyW8m+R67E0yuDcqVcuXitup1gOedvIM57bpFoBbfnKbVxQ/GaRxGbl2d/GvmtueTucoDs7YWz&#xA;sPLKkSv+97EqrKrLMFymWdjyuu3aqmQMGi0r7TTlnKo5AnFcb1fq3M3OE45zDtpgX4Ts7Svl8pOI&#xA;WpwX7giCcvmTSj1eRqBYedeX0Wcp1lp/Ge/hFRdv+iu+amlfa+vUzUpxHH2v1qeBuaVtI60W7xqb&#xA;bs92V1RmpQaPCeKfR7NzuP90ziWt0Nr/HgHKHXMnHedLTwZBRRznQUBfCXBoNHYVLChW4j/L2Znl&#xA;rQI3pQoN120UomHsClZzFbMVWvPLQn7YjlRB+waqkoWrr2iBf5WWKB1aqbapRFuPIWzZ2l4J0fHn&#xA;tTFczpeU7TnwmOcR8eIFpBUJYP718uDuJPnUa855h4B4ObhRqStmae+zS+q3XBtWoXX9dZSBGa6s&#xA;aqS77mJs61FDgvSVX1WWv4yVl7QG4zQzK0+pqJfL22JjcaSnkA47Fyu3/dGlE8Z+exXKDDWxOuN6&#xA;GVqBxzwXSRZgL7TCfMsm9eyT+xAfHsNXd2EbJI7z4koFFv91Szt17c4yyzpra63CVGs2Rw8SGhXl&#xA;2qvhJMzpqTWIxnrugjUyuysA/lPzBNQVaYUlK3fpmnj9Kcgl9VtxE1Skx1TnEPoNwP4eIl5kuuXb&#xA;ECnOJN9Ax0lCOQLrvhGb0DICmfGrvuyyziFfBW7TBgpLDGxwgc1XYViWPfZa/s746x78ylXmYQuL&#xA;cxnI7eU8wypUGWmSrZf+d2YTRNM+jzzuvBu0cjzfFz3mvIAA8W4ms64HsQQBHOcORIpB8DUXjneM&#xA;ceU4DXHlAu5zyH0SyxCNig31H0urXEY1o92dDYtBiEv6RNPc4EjA/f77vY1Z06DREsjBLbvM+zFu&#xA;M8iHtA4tK+zTlGiA7mtufmfUKOFjSA+4iBHzp48wb45DfpPQCjzmuXKDAwocDhF8pFvOP+589Uxy&#xA;R1AxjhN8Tmp59kM083uXQp4t60ZsN5u6LVDFdreqe0YVC5C7jFta/MvD4q6Xpn3dqQ5pqnVT1ORw&#xA;VMnTVS+OPw05th/O22DdSB7yex0bv4Eupqu+RxkjkKPRLjQCnB65G70NFJ52p7PwJYprtnGPB+IY&#xA;xi+qLcgb8PYWRRq+LE2LLpFiJIOe2cKt9fB0i1F4l+/1tNcPUl2Ia+oYrzKSsuHptuf9G9MWWuHd&#xA;8WsZrfCO+yLuSR+YeQShOHacO2Zp5qSWh8vg8yWbUNc3y3rRJoYuw4PIj6EDAMog76RxZKWmXakG&#xA;NxS3rVo8cGVKVbXuNTK9wegNpUIdE3K7ebgWpj55B99DNv6dh5jUrqJ5qmP0OQx53shfRISSgnGG&#xA;V5PnRrbxgV6KAISQu3YvVIVcMr6xtpBYQgsRC9QtxZyYMNahVfM5NKum9RbtFiyjhuVDgbDZH0rk&#xA;+1CrTd1Dq6F1Y7BCYdqAdZRWwDTF4n+ZLC4yXH9JEi9ju381CaX8Mjq4F550SZHFdkMKGDfCXyiP&#xA;mED4QGF4hqC1AAMDeVGmALZEX9nouzL+IRbZFmOu6mliSrGYTiILX4dJyKYQTWuQLWEIsEB3w5BX&#xA;9RbKMGw3HvBM1/GCLQIXDOQFjTBSqXliVDUBTEYskfhkz2/mukB/WRbQE8qolriZO20C39B2Rn3G&#xA;sUGhJasv85g4eyOtFIukFUYrTvGdSj2HdEvRuekGhoUVbvdvhJVXKojJ4Utxx6+GrozL2z5VQFiG&#xA;NbrgcaFiUGL++BSf5WW2AMhpz6NOD+BiGfpYrTAjotC2sVJc3ZFZ4GgXMmZCnN0mPYkKbc7bEOTo&#xA;X3DBJ/Bzx8LTrovVQcBaVRItWrY6nAHOkNqp9U5R18Q/ol4mLvVjQNqHXBavyI60zXcGCpTanLbs&#xA;75FICrSC/74WT4XSNwP7TWSVotBKxvK/gBClUnkYMfkRAB0wJr+eOUX60hHIRUVbbFNZApFcuR/K&#xA;FeqaFrAcCY7HnZ5bZYTfzAwU6xKjBBTCNh3Ag1VB68LQ7R7+p/VJg9qwm5K/eWH2DJLDl+cSRLxZ&#xA;bWSQY/o9r3tfFTPo+qavzOmJelhRHJvo0odc4lmgDdkwiea05wkXDV2ZseU2xycIxAHvW3B3gWAP&#xA;j2lKWfZkh0NOkSz/HuaygmcRk+OjEvA3FQfJNsFIfiuzcnuYmj/d7sHnZbFbbs65ld9nWg5DXhBP&#xA;utAG5gv1If1zM6VF9iMjJhC0mTZQB6x6SFK/EfzWKSFXmNiFnQAXLxkX6/Kq17lgRKRlfI4IHYrG&#xA;hiCXdSS7DSgsr7tuHlNF7ZibQ7NQhsJnBOLF4obnlHqrxOYMxD8vd6AV7kmd4k2UeuEsWFy2+w+D&#xA;wstlnDnvmMUsVI58/dCUYtTGyvsbO7Wo42hBWWbR9nvuE4u9BPIoC90YuQ0PE35CeuKeHQ7CGPAI&#xA;5GShoWBsMC9YCku4HFZO3k3bIOA+5PlQ2p0McrP7FKHZ2EyTbGuc8QtMmLw0FsPDn0dgus5AhHn3&#xA;AmGO3TDtPUIrMO13ylf/jYcX0e4ZPOJ6HBYdMJOoLgfHlGcRk3MTWgn+dAjybCsUc8GayzIMbJxo&#xA;f6Wqbp/Ll0BuibvBCgaDNLIIiH/nzMBhRn4WSHPXHtuxvNDitnwIcgYJIkgsAFwxpChs+jJ5EnPu&#xA;DJfnPoF92UYJvNQ3UfQ5SIllSZfsA+/LOyOMUtL2BzliMxMDYhGP6VyE7y4hzkIrgv2ejVmkKLTC&#xA;6y5mWBi1fJK7fYnJ3wWn+qFg6EdEmYrwS2LTYSNfjldlJppzet/KOwZyYwpyWTpLX2Aplmz9lHzZ&#xA;KA0gt+uqYJtGNXJ6andkKTdt+LKhBVzQHWFa44PHIxZaOcmA/g8vIWJu2LaZ7FYIcqahhLt8CchF&#xA;aME3Ebtiui3LJGnowue08pL2jX+BrmYcMiYYG7Ub6MX9fXED4H27mDZp5RIyOrO4eyWvxeBRris+&#xA;QaQZohxirBIcwt3l+CzPDlLn9cwqjBGGW5rsGFohQvbDiKFsRmmDiMVAPpQ3QhNxu5YGHXgS1cOq&#xA;LYUVJHpoDftEWMaBtDuIG01kRA9Ngx2ytbYEF2raZ3B52Zj7jPkOZoOKwsNAyTC2ZR7TO0PEj3gn&#xA;RCIxi1hoqSnjJqU+yG7kBXrvjMu5hrsSxCJmXRA9MQ7MeAF0Xqi1GNtGqnY439+LaRedJ4rHQSv3&#xA;y76I0QpoBZehFV44cwZ3k1ruor2TWm5m5rxfZGG5nq3nXWgX2XZqNe7kLhIuKn0xnvb9JpjNbSOq&#xA;cwsRNqBxPVLy6crXul3PvA4sV7ctK4oZwIdNe1cjmtbYPVV9G5bJPWO1bYWeXY2wRalyeFGsF9Ee&#xA;wBdaSPEefjGTFHp+9QAblRRet31vPg+hCm7T1+0D2Otj5vAHtr/zB5AW117UqLJfxPpxN45h+E1v&#xA;52LT1s1WAbucXiNKEbxvN0rUPduuplYhbWq/2yqUqrraiDxjMLjwrdeK25g97n+ruulis/ycgNqn&#xA;FZq2Iq0UeTiEdPkTksXtXy9LAvGGLCYPfhIPaPDlvH7LMg5blmJ7l666nPQwBaxYqh4C4cJ2PN4O&#xA;yOt1173sACDndaCAvwaOPpq35qvar6YCXNjwetUUmLlsdJkyMQW62DnveV62SS20cI9GQE+a9fN+&#xA;B9peVxpRNXQ6gJxi8FcN/2fd8+4qL26K1hiA59XDUpvj6cchDa8KpJUy+ubDRadGfeharS72Ow/T&#xA;nu65Ya0rHFZKva6sjPVrHYF1BNYRWEdgHYF1BM5WBEwu6XWv0sjWb6XW689XQACZ9360u0xT7I36&#xA;SYYJwjNi6FvPExGMvYdC5JVxiNx0kO1FZJze1/XSWpvHS0jHDRJlp5SE/dMy58wrd/z/uEXkVlEP&#xA;Ikl77tEBQjrYlaw8LrSX7bO5WrpZs+Z9SX1iL6gXX18Astz5aczKPZ1NLe5jftiYOc4LV6qwGBv5&#xA;SGlDZBIaNWO7DS+VPeHyVyk97XLDswN4j2Yu6buCzXP803JpsHIkrLKrmVFz/fRknB0wns4ovFbH&#xA;N+bZQMlDVjhVaCx6aQMhBypDwO4sCERyBdlQfCBbEqXTKabGYu3CYl72ofJyzhA1CSwgRMZUPgqq&#xA;1vcQyE2ydhG9QTKenY6mZ01bz2WxH8feayHbliWM9XQdCb6rVAn/MoXaQiqX5ww84HzKs3m4XJOi&#xA;EFapZAtDakSkkCWUchdkbL0OvqshWdkxVQIRU4tNm8fySNza5nxp4i7PRQaaZzAluwDIiR/Oz+BQ&#xA;QxSnwL6RgGZmOQSG9JTgHju2wi3G545UBsYEUW8xqUIsALYPfV/34p2lns3ENk75mXnNSgsPa92d&#xA;OLg5YKQpYxhtQaWHeXoLK89LLBE342scGcuBHOyaicyumRWc1/MUacR94lhLzN4EMeAofrJ6HPaN&#xA;GkJIYcExz2fMYT9KvkzNwKRdgBzY2g0VNxQYgKUIGSlHHULDwnwDoVg5ZoX7FxqxAW8oSJRyZJam&#xA;0RvjhlOEQxqe23A68NGWw7hsolgRMWloy3i97TwWs6s1nOd3YZMWTq/MyRh/kSDFEGLlGeRdUwqA&#xA;0gW2QcshyHFIQMjB37Br3zZWbmYKx4nmTI5eExI5G+D7CYUciOwCMD3YH06pAGTG6DzdFMgNWJlB&#xA;wzTJBjlF+IMyyQUacCFCHY6gDIYRyLPaQUwEke/Zuse4SCAfqZ2ZIHs3xSFAAVEEQADXouAzr0sg&#xA;5IYScoPO2ICWSmLx7X5lquWbY3JUmpBSIGrEyrlWWnC9aJRZPqZ2Mq2cp3twmB1TbEsgOQEklgMd&#xA;7ddyYkFYIxD2IZdpGY5Y+pUVrIESwhYuz4gFsuQPHtJnCwBlyZMJeZO+zvNlA9pFSIeIBW6ThZ+L&#xA;Ngt8yOWcDdtEIDnkJjUg1FMwG3tTuyu8zRt40WErl7UCUYCcrpcRy6RyeY0V1nnxsYlYiBlLQhCC&#xA;78SxPABKrXZsonROjuFysXJskFrhYeNBgSRL4RHPS40nOIffZ9GJoSfIuLNQQOWC32psyWdvgkhc&#xA;hmrCOpSdYWODghVG0SyfjPUut9fpidWijsvH3pHTgZ8oAEmsBHI/EFZ17kPNDyg4C6h/cetAPFQo&#xA;TmFZifnwSvyVj918ChVVIJVmirfsefObh8nb8uNXAvKznxJMHQkRlEBKyiRkViRPcNWQUEeBlfzs&#xA;Ek/lBzn4fQ2+kGKT/NcThUYYPX377bc/TRSlNVqZD8mn8B3rO2//PRSdRO2na9l3Kx4d/Z8vgv8B&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-->
                            <fo:block space-after="0pt"
                                space-after.conditionality="retain" line-height="1.147"
                                font-family="Calibri" font-size="11pt" language="EN-US"  text-align="center">
                                <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//DEBUG[1]/@opName"/></fo:inline>      
                            </fo:block>
                            
                        </fo:block-container>
                    </fo:table-cell>
                    <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" 
                        border-bottom-color="black" border-bottom-width="0.5pt" border-left-style="none" border-left-color="black" border-left-width="1.5pt" background-color="white" color="black" display-align="before">
                        <fo:block-container>                                            
                            <fo:block space-after="0pt"
                                space-after.conditionality="retain" line-height="1.147"
                                font-family="Calibri" font-size="11pt" language="EN-US"  text-align="right">
                                <fo:inline font-weight="bold" font-size="11pt"><fo:leader leader-length="0pt"/><xsl:value-of select="//pdf/@PIName"/></fo:inline>
                            </fo:block>
                        </fo:block-container>
                    </fo:table-cell>
                </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block border-top-style="solid" border-top-color="black" border-top-width="0.3pt" text-align="center"><fo:inline font-family="Helvetica"  color="black"><fo:leader leader-length="0pt"/></fo:inline></fo:block> 
                	
                <!-- the DEBUG heading -->
                <!--<fo:block font-weight="bold" space-after="1cm">-->
                <fo:block keep-with-previous.within-page="always" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg" 
                    space-before.conditionality="retain" text-align="left"
                    font-family="Helvetica" text-decoration="underline" 
                    font-size="14pt" font-style="italic" 
                    language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                    <xsl:attribute name='id'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>                    
                     <xsl:value-of select="$DEBUG-number"/>                    
                    <xsl:value-of select="@heading"/>
                </fo:block>
                <!-- BODY Start -->
                <fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
                <xsl:variable name="outerHeading" select="@formname"/>
                    <xsl:variable name="pageHeading" select="@heading"/>
					<xsl:variable name="innerIndex" select="position()"/>
					
						<!--<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg" 
							space-after.conditionality="retain" text-align="left"
							font-family="Helvetica" text-decoration="underline" 
							font-size="14pt" font-style="italic" 
							language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
							<fo:inline>
								<fo:leader leader-length="0pt"/><xsl:value-of select="@heading"/></fo:inline>
						</fo:block>-->
	                   
	                   <!-- Species Table -->
                    <xsl:if test="@heading='Animal Use Summary' or @heading='Species'">
                        <fo:block start-indent="5pt" space-after.conditionality="retain"
                            line-height="1.147" font-family="Helvetica" font-size="10pt"
                            language="EN-US" text-align="left" font-weight="bold"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline><fo:leader leader-length="0pt"/>Indicate the number of animals used in the <b>previous</b> year. If you do not have an estimate, please contact CCMS or the IACUC office. </fo:inline>
                        </fo:block>		
                        <fo:block space-after="10pt" space-after.conditionality="retain"
                            line-height="1.147" font-family="Helvetica" font-size="10pt"
                            language="EN-US" text-align="center" font-weight="bold"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:inline><fo:leader leader-length="0pt"/></fo:inline>
                        </fo:block>		
                        
                        <xsl:if test="count(//crossTab[@formType='speciesCrossTab']) &gt; 0">   
                        <fo:table start-indent="5pt" border-style="solid" border-width="0.5pt">								
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="35mm"/>	
                            <fo:table-column column-width="35mm"/>	 
                            <fo:table-body start-indent="0pt">                            
                                <xsl:for-each select="//crossTab[@formType='speciesCrossTab']">		
                                        <fo:table-row>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@col1"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@col2"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@col3"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@col4"/></fo:block>
                                            </fo:table-cell>                   
                                        </fo:table-row>											
                                    </xsl:for-each> 
                            </fo:table-body>  
                        </fo:table>		                            
                        </xsl:if>
                        <fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg" 
                            space-after.conditionality="retain" text-align="left"
                            font-family="Helvetica" text-decoration="underline" 
                            font-size="14pt" font-style="italic" 
                            language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                            <fo:inline>
                                <fo:leader leader-length="0pt"/></fo:inline>
                        </fo:block>
                    </xsl:if>
                    
                    
                    <!-- Summary of Changes -->
                    <!--<xsl:if test="@heading='Summary of Changes'">
                        <fo:block space-after="10pt" space-after.conditionality="retain"
                            line-height="1.147" font-family="Helvetica" font-size="10pt"
                            language="EN-US" text-align="center" font-weight="bold"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:leader/>
                        </fo:block>															
                        <fo:table start-indent="5pt" border-style="solid" border-width="0.5pt">								
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="45mm"/>
                            <fo:table-column column-width="35mm"/>	
                            <fo:table-column column-width="35mm"/>	
                            <fo:table-column column-width="35mm"/>
                            <fo:table-header>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Location</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Field</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Original Value</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">New Value</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Justification</fo:block>
                                </fo:table-cell>
                            </fo:table-header>			
                            <xsl:if test="count(//diffsTable[@formType='diffsTab']) &gt; 0">
                                <fo:table-body start-indent="0pt">
                                    <xsl:for-each select="//diffsTable[@formType='diffsTab']">		
                                        <fo:table-row>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Location"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Field"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:call-template name="intersperse-with-zero-spaces">
                                                    <xsl:with-param name="str" select="@OriginalValue"/>
                                                </xsl:call-template><!-\-<xsl:value-of select="@OriginalValue"/>-\-></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:call-template name="intersperse-with-zero-spaces">
                                                    <xsl:with-param name="str" select="@NewValue"/>
                                                </xsl:call-template><!-\-<xsl:value-of select="@NewValue"/>-\-></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Justification"/></fo:block>
                                            </fo:table-cell>                                              
                                        </fo:table-row>											
                                    </xsl:for-each>
                                </fo:table-body>										
                            </xsl:if>
                        </fo:table>		
                        <fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg" 
                            space-after.conditionality="retain" text-align="left"
                            font-family="Helvetica" text-decoration="underline" 
                            font-size="14pt" font-style="italic" 
                            language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                            <fo:inline>
                                <fo:leader leader-length="0pt"/></fo:inline>
                        </fo:block>
                    </xsl:if>-->
                    
                    
					    <!-- Attachments/crossTab -->
                    <xsl:if test="@heading='Attachments'">
                        <fo:block space-after="10pt" space-after.conditionality="retain"
                            line-height="1.147" font-family="Helvetica" font-size="10pt"
                            language="EN-US" text-align="center" font-weight="bold"
                            xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg">
                            <fo:leader/>
                        </fo:block>													
                        
                        <xsl:if test="count(//crossTab[@formType='crossTab']) &gt; 0">
                        <fo:table start-indent="5pt" border-style="solid" border-width="0.5pt">								
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="15mm"/>	
                            <fo:table-column column-width="15mm"/>	
                            <fo:table-column column-width="35mm"/>	
                            <fo:table-column column-width="20mm"/>	
                            <fo:table-header>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Type</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Name</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Version</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Status</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Filename</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                    border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                    border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                    <fo:block font-weight="bold" text-align="left">Uploaded Date</fo:block>
                                </fo:table-cell>
                            </fo:table-header>			
                                <fo:table-body start-indent="0pt">
                                    <xsl:for-each select="//crossTab[@formType='crossTab']">		
                                        <fo:table-row>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Type"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Name"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Version"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Status"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="@Filename"/></fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
                                                border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
                                                border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
                                                <fo:block><xsl:value-of select="concat(substring(@Uploaded, 6, 2),'/',substring(@Uploaded, 9, 2),'/',substring(@Uploaded, 1, 4))"/></fo:block>
                                            </fo:table-cell>       
                                        </fo:table-row>											
                                    </xsl:for-each>
                                </fo:table-body>
                        </fo:table>
                        </xsl:if>
                        <fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg" 
                            space-after.conditionality="retain" text-align="left"
                            font-family="Helvetica" text-decoration="underline" 
                            font-size="14pt" font-style="italic" 
                            language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                            <fo:inline>
                                <fo:leader leader-length="0pt"/></fo:inline>
                        </fo:block>
                    </xsl:if>
                    
						<!-- Research Personnel -->
						<xsl:if test="@heading='Research Personnel'">
							<fo:block space-after="10pt" space-after.conditionality="retain"
								line-height="1.147" font-family="Helvetica" font-size="10pt"
								language="EN-US" text-align="center" font-weight="bold"
								xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>															
						    <xsl:if test="count(//crossTab[@formType='personnelCrossTab']) &gt; 0">
						    <fo:table start-indent="5pt" border-style="solid" border-width="0.5pt">								
								<fo:table-column column-width="35mm"/>
								<fo:table-column column-width="35mm"/>
								<fo:table-column column-width="18mm"/>	
								<fo:table-column column-width="18mm"/>	
								<fo:table-column column-width="24mm"/>	
								<fo:table-column column-width="25mm"/>	
								<fo:table-column column-width="35mm"/>	
									<fo:table-header>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Name/Department</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Role/Status</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Contact</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Access</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Signature Authority</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Phone</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											<fo:block font-weight="bold" text-align="left">Email</fo:block>
										</fo:table-cell>
									</fo:table-header>			
								
									<fo:table-body start-indent="0pt">
										<xsl:for-each select="//crossTab[@formType='personnelCrossTab']">		
										<fo:table-row>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											    <fo:block><xsl:value-of select="@name"/> / <xsl:value-of select="@department"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
											    <fo:block><xsl:value-of select="@role"/> / <xsl:value-of select="@unistatus"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
												<fo:block><xsl:value-of select="@contact"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
												<fo:block><xsl:value-of select="@access"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
												<fo:block><xsl:value-of select="@sigAuthority"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
												<fo:block><xsl:value-of select="@phone"/></fo:block>
											</fo:table-cell>
											<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt" display-align="before">
												<fo:block><xsl:value-of select="@email"/></fo:block>
											</fo:table-cell>
										</fo:table-row>											
										</xsl:for-each>
									</fo:table-body>
						    </fo:table>		
						    </xsl:if>
							<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg" 
								space-after.conditionality="retain" text-align="left"
								font-family="Helvetica" text-decoration="underline" 
								font-size="14pt" font-style="italic" 
								language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
								<fo:inline>
									<fo:leader leader-length="0pt"/></fo:inline>
							</fo:block>
						</xsl:if>
						
						<!-- Other Personnel -->
					<xsl:if test="@heading='Other Personnel'">
						<fo:block space-after="5pt" space-after.conditionality="retain"
							line-height="1.147" font-family="Helvetica" font-size="10pt"
							language="EN-US" text-align="center" font-weight="bold"
							xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg">
							<fo:leader/>
						</fo:block>
						<xsl:if test="count(//crossTab[@formType='personnelOtherCrossTab']) &gt; 0">
						<fo:table start-indent="5pt" border-style="solid" border-width="0.5pt">								
							<fo:table-column column-width="35mm"/>
							<fo:table-column column-width="20mm"/>
							<fo:table-column column-width="20mm"/>	
							<fo:table-column column-width="35mm"/>		
							<fo:table-column column-width="35mm"/>
							<fo:table-header>
								<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
									border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
									border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
									<fo:block font-weight="bold" text-align="left">Name / Department</fo:block>
								</fo:table-cell>
									<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
									border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
									border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
									<fo:block font-weight="bold" text-align="left">Contact</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
									border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
									border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
									<fo:block font-weight="bold" text-align="left">Access</fo:block>
								</fo:table-cell>
									<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
									border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
									border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
									<fo:block font-weight="bold" text-align="left">Phone</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="0pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
									border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
									border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
									<fo:block font-weight="bold" text-align="left">Email</fo:block>
								</fo:table-cell>
							</fo:table-header>										
							
							<fo:table-body start-indent="0pt">
								<xsl:for-each select="//crossTab[@formType='personnelOtherCrossTab']">		
									<fo:table-row>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
										    <fo:block><xsl:value-of select="@name"/> / <xsl:value-of select="@department"/></fo:block>
										</fo:table-cell>					
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
											<fo:block><xsl:value-of select="@contact"/></fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
											<fo:block><xsl:value-of select="@access"/></fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
											<fo:block><xsl:value-of select="@phone"/></fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="0pt" padding-left="1pt"	padding-bottom="1pt" padding-right="1pt" border-top-style="solid" border-top-color="black" border-top-width="0.5pt"
											border-left-style="solid" border-left-color="black" border-left-width="0.5pt" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="0.5pt"
											border-right-style="solid" border-right-color="black" border-right-width="0.5pt">
											<fo:block><xsl:value-of select="@email"/></fo:block>
										</fo:table-cell>
									</fo:table-row>											
								</xsl:for-each>
							</fo:table-body>		
						</fo:table>			
						<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
						xmlns:svg="http://www.w3.org/2000/svg" 
						space-after.conditionality="retain" text-align="left"
						font-family="Helvetica" text-decoration="underline" 
						font-size="14pt" font-style="italic" 
						language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
						<fo:inline>
							<fo:leader leader-length="0pt"/></fo:inline>
						</fo:block>
						</xsl:if>
						<xsl:if test="count(//crossTab[@formType='personnelOtherCrossTab']) = 0">
							<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg" 
								space-after.conditionality="retain" text-align="left"
								font-family="Helvetica"  
								font-size="14pt" font-style="italic" 
								language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
								<fo:inline>
									<fo:leader leader-length="0pt"/>None</fo:inline>
							</fo:block>
						</xsl:if>
					</xsl:if>
							
                    <!--<xsl:for-each select="//entry[@formname=$outerHeading and (@type='field' or @type='radiobuttons' or @type='entity' or @type='instructions' or @type='instructionsBold' or @type='checkbox' or @type='textSpecial' or @type='text2Special' or @type='text3Special' or @type='dropdown2Special' or @type='checkboxSpecial'  or @type='box' or @type='bigbox' or @type='textbox' or @type='textarea' or @type='yesnobuttons' or @type='line' or @type='text' or @type='dropdown' or @type='manual' or @type='bordertextarea')]">	-->								
                    <xsl:for-each select="//entry[@formname=$outerHeading and @heading=$pageHeading]">
						<xsl:variable name="innerMostIndex" select="position()"/>
						<xsl:variable name="innerHeading" select="@heading"/>
						<xsl:choose>
							<xsl:when test="@type='line'">
								<fo:block border-top-style="solid" border-top-color="black" border-top-width="0.3pt" text-align="center"><fo:inline font-family="Helvetica"  color="black"><fo:leader leader-length="0pt"/></fo:inline></fo:block> 
							</xsl:when>									
							
							<xsl:when test="@formType='entryTable' or @formType='special' or @formType='drillIn' ">				
								<xsl:if test="count(//entry[@heading=$innerHeading and (@formType='entryTable' or @formType='special' or @formType='drillIn')]) &gt; 0">
								<fo:table start-indent="43pt">
									<fo:table-column column-width="45mm"/>
									<fo:table-column column-width="140mm"/>																			
									<fo:table-body start-indent="0pt">
										<fo:table-row>			
											<fo:table-cell padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="5pt" border-bottom-style="none" border-bottom-color="black" 
												border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before">														
													<fo:block font-weight="bold" text-align="left"><xsl:value-of select="@label"/></fo:block>
												</fo:table-cell>
											<fo:table-cell space-after="5mm" padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="7pt" border-bottom-style="none" border-bottom-color="black" 
												border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before">														
											    <fo:block-container>
											        <fo:block wrap-option="wrap" space-after="5mm" padding-right="5pt"><xsl:value-of select="normalize-space(.)"/></fo:block></fo:block-container>
											</fo:table-cell>															
										</fo:table-row>	
									</fo:table-body>											
								</fo:table>	
								</xsl:if>
							</xsl:when>
						    <xsl:when test="@formType='diffsTab'">				
						        <xsl:if test="count(//diffsTable[@heading=$innerHeading and (@formType='diffsTab')]) &gt; 0">
						            <fo:table start-indent="43pt">
						                <fo:table-column column-width="45mm"/>
						                <fo:table-column column-width="140mm"/>																			
						                <fo:table-body start-indent="0pt">
						                    <fo:table-row>			
						                        <fo:table-cell padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="5pt" border-bottom-style="none" border-bottom-color="black" 
						                            border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before">														
						                            <fo:block font-weight="bold" text-align="left"><xsl:value-of select="@label"/></fo:block>
						                        </fo:table-cell>
						                        <fo:table-cell space-after="5mm" padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="7pt" border-bottom-style="none" border-bottom-color="black" 
						                            border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before">														
						                            <fo:block text-align="left"><xsl:value-of select="normalize-space(.)"/></fo:block>
						                        </fo:table-cell>															
						                    </fo:table-row>	
						                </fo:table-body>											
						            </fo:table>	
						        </xsl:if>
						    </xsl:when>
						    <xsl:when test="(@type='field' or @type='radiobuttons' or @type='entity' or @type='checkbox' or @type='textSpecial' or @type='text2Special' or @type='text3Special' or @type='dropdown2Special' or @type='checkboxSpecial' or @type='textbox' or @type='yesnobuttons' or @type='line' or @type='text' or @type='dropdown' or @type='manual') and @formType!='entryTable' and not(@type='textarea' and @label='Species')">
							    <!-- @type='field' or @type='radiobuttons' or @type='entity' or @type='instructions' or @type='instructionsBold' or @type='checkbox' or @type='textSpecial' or @type='text2Special' or @type='text3Special' or @type='dropdown2Special' or @type='checkboxSpecial'  or @type='box' or @type='bigbox' or @type='textbox' or @type='textarea' or @type='yesnobuttons' or @type='line' or @type='text' or @type='dropdown' or @type='manual' or @type='bordertextarea' -->
								<fo:table xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" font-family="Helvetica" language="EN-IN" start-indent="0pt">
									<fo:table-column column-number="1" column-width="220pt"/>
									<fo:table-column column-number="2" column-width="200.3pt"/>
									<fo:table-body start-indent="0pt" end-indent="0pt">
										<fo:table-row>
											<fo:table-cell padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="5pt" border-bottom-style="none" border-bottom-color="black" 
											    border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" background-color="white" color="white" display-align="before">
												<fo:block-container>
													<fo:block font-family="Helvetica" font-weight="bold" start-indent="43pt" text-indent="0pt" wrap-option="wrap">
														<fo:inline font-family="Helvetica"  color="black">
															<fo:leader leader-length="0pt"/><xsl:value-of select="@label" /></fo:inline>
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
											<fo:table-cell padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="0pt" border-bottom-style="none" border-bottom-color="black" 
											    border-bottom-width="0.5pt" border-left-style="solid" border-left-color="white" border-left-width="0pt" background-color="white" color="white" display-align="before">												
												<fo:block-container>
													<fo:block wrap-option="wrap" space-after="5mm" padding-right="5pt">
														<!--<xsl:if test="@type='checkbox' and .=''">
														<fo:inline font-family="Helvetica"  color="black">
															<fo:leader leader-length="0pt"/>No</fo:inline>
														</xsl:if>
														<xsl:if test="@type='checkbox' and .!=''">
															<fo:inline font-family="Helvetica"  color="black">
																<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>
														</xsl:if>
														<xsl:if test="@type!='checkbox'">-->
															<fo:inline font-family="Helvetica"  color="black">
																<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>
														<!--</xsl:if>-->
													</fo:block>
												</fo:block-container>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>										
							</xsl:when>
							<!--<xsl:when test="(@type='textarea' or @type='box' or @type='bigbox' or @type='bordertextarea' or @type='text') and @formType!='entryTable' and not(@type='textarea' and @label='Species')">
								<!-\-<fo:block space-after="10pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-size="10pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:leader/>
								</fo:block>-\->
							    <!-\-<fo:block font-family="Helvetica" font-weight="bold" start-indent="43pt" text-indent="0pt" wrap-option="wrap" padding-before="3pt" padding-after="2pt">
									<xsl:value-of select="@label" />
								</fo:block>
								<!-\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space-collapse="true" padding-before="3pt">
									<xsl:call-template name="intersperse-with-zero-spaces">
										<xsl:with-param name="str" select="."/>
									</xsl:call-template>											
									</fo:block>	-\->	
								<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap">
									<fo:inline font-family="Helvetica" font-size="10pt" color="black">
										<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>	
								</fo:block>	-\->
							    
							    <fo:block font-family="Helvetica" font-weight="bold" start-indent="43pt" text-indent="0pt" wrap-option="wrap" padding-before="3pt">
							        <xsl:value-of select="@label" />
							    </fo:block>
							    <!-\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space-collapse="true" padding-before="3pt">
							        <xsl:call-template name="intersperse-with-zero-spaces">
							        <xsl:with-param name="str" select="."/>
							        </xsl:call-template>											
							        </fo:block>	-\->	
							    <!-\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space="nowrap" white-space-collapse="true" padding-before="3pt">
							        <fo:inline font-family="Helvetica" font-size="10pt" color="black">
							            <fo:leader leader-length="0pt"/><xsl:value-of select="normalize-space(.)"/></fo:inline>	
							            </fo:block>		-\->
							    <!-\-<fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
							        
							        <xsl:call-template name="intersperse-with-zero-spaces">
							            <xsl:with-param name="str" select="."/>
							        </xsl:call-template>
							        </fo:block>		-\->
							    <fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space="nowrap" white-space-collapse="true" padding-before="3pt">
							        <fo:inline font-family="Helvetica" font-size="10pt" color="black">
							            <fo:leader leader-length="0pt"/><xsl:value-of select="normalize-space(.)"/></fo:inline>	
							    </fo:block>	
							</xsl:when>	-->	
						    <xsl:when test="(@type='textarea' or @type='box' or @type='bigbox' or @type='bordertextarea' or @type='text') and @formType!='entryTable' and not(@type='textarea' and @label='Species') ">				
						        <!--<xsl:variable name="txtArea">
						            <xsl:call-template name="intersperse-with-zero-spaces">
						                <xsl:with-param name="str" select="normalize-space(.)"/>
						            </xsl:call-template>
						        </xsl:variable>    -->
						        <fo:table start-indent="43pt">
						                <fo:table-column column-width="100%"/>																		
						                <fo:table-body start-indent="0pt">
						                    <fo:table-row>			
						                        <fo:table-cell padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="5pt" border-bottom-style="none" border-bottom-color="black" 
						                            border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before">														
						                            <fo:block font-weight="bold" text-align="left"><xsl:value-of select="@label"/></fo:block>
						                        </fo:table-cell>						                  															
						                    </fo:table-row>	
						                    <fo:table-row>	
						                        <fo:table-cell space-after="5mm" padding-top="2pt" padding-left="0pt" padding-bottom="2pt" padding-right="7pt" border-bottom-style="none" border-bottom-color="black" 
						                            border-bottom-width="0.5pt" border-right-style="solid" border-right-color="white" border-right-width="0pt" display-align="before" wrap-option="wrap">			
						                            <fo:block wrap-option="wrap" space-after="5mm" padding-right="5pt"><xsl:value-of select="."/></fo:block>
						                        </fo:table-cell>															
						                    </fo:table-row>	
						                </fo:table-body>											
						            </fo:table>	
						        
						    </xsl:when>
							<xsl:when test="(@type='instructions' or @type='instructionsBold') and @formType!='entryTable' and not(@type='textarea' and @label='Species')">
								<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" white-space="pre" white-space-collapse="false">
									<fo:inline font-family="Helvetica" font-style="italic" font-size="12pt" font-weight="bold" color="black">
									    <fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>	
								</fo:block>		
							</xsl:when>			
							<xsl:otherwise>
								<!--<fo:block space-after="10pt" space-after.conditionality="retain"
									line-height="1.3190500000000002" font-size="10pt"
									language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
									xmlns:svg="http://www.w3.org/2000/svg">
									<fo:leader/>
								</fo:block>-->
							</xsl:otherwise>									
						</xsl:choose>
						</xsl:for-each>
					
						<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
							xmlns:svg="http://www.w3.org/2000/svg" 
							space-after.conditionality="retain" text-align="center"
							font-family="Helvetica" text-decoration="underline" 
							font-size="28pt" font-style="italic" 
							language="EN-NZ" start-indent="150pt" end-indent="150pt" font-weight="bold">
							<fo:inline>
								<fo:leader leader-length="0pt"/></fo:inline>
						</fo:block>
                    </fo:block>
                <!-- BODY END -->
                <!--<xsl:apply-templates select="heading | paragraph"/>-->
                
                <xsl:if test='position() = last()'>
                    <fo:block id='last-page'/>
                </xsl:if>
                <fo:block text-align="end">
                    Page <fo:page-number/> of 
                    <fo:page-number-citation 
                        ref-id="last-page"/>
                </fo:block>
            </fo:flow>            
        </fo:page-sequence>        
    </xsl:template>
</xsl:stylesheet>
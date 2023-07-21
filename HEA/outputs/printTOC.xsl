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
        <xsl:attribute name='leader-length'>527pt</xsl:attribute>
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
            <!--<fo:page-sequence  xmlns:rx="http://www.renderx.com/XSL/Extensions" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml"
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
                        <fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                            xmlns:svg="http://www.w3.org/2000/svg" font-family="TimesNewRoman"
                            font-size="10pt" language="EN-US" text-align="center">
                            <fo:inline
                                font-family="Arial" font-size="10pt">
                                <fo:external-graphic
                                    content-width="204.75pt" content-height="48pt"
                                    src="url(&#34;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a&#xA;HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy&#xA;MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACXAoADASIA&#xA;AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA&#xA;AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3&#xA;ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm&#xA;p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA&#xA;AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx&#xA;BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK&#xA;U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3&#xA;uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDg6KPw&#xA;o/CvUPdCij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/Cg&#xA;Aoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/&#xA;CgAoo/Cj8KACij8KPwoA0vD3/IzaT/1+Rf8AoYr6oHSvlfw7/wAjNpP/AF+Q/wDoYr6oHSuTE7o8&#xA;/G/EhaKKK5jiCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA&#xA;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&#xA;L4V/597j/v8Amj6xAPrlPsfPtFfQX/CpfCv/AD73H/f80n/CpfCv/Pvcf9/zR9YgH1yn2Pn6jmvc&#xA;Ne+GXhzT/D2pXlvBOJre1llQmYn5lQkfqK8OrSE1O9jalVjUvboLzRzR+NH41ZoHNHNH40fjQAc0&#xA;c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRz&#xA;R+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH&#xA;40fjQAc0c0fjR+NABzRzR+NH40AfXdFFFeWeEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR&#xA;RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGN4s/5E/Wv+vGf&#xA;/wBFtXy7X1F4s/5E7Wv+vGf/ANFtXy7XXhtmehgtmFFFFdJ2hRRRQAUUUUAFFFFABRRRQAUUUUAF&#xA;FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH13RRRXl&#xA;nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU&#xA;AFFFFABRRRQAUUUUAFFFFABRRRQBjeKlLeEdZUdTYzAf98NXzP8A2ddf88v/AB4f40UV1Yd6M78G&#xA;9GH9nXX/ADy/8eH+NH9nXX/PL/x4f40UV0XZ2XYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf&#xA;2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf&#xA;88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/&#xA;AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f&#xA;40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2&#xA;ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf8&#xA;8v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8A&#xA;x4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f4&#xA;0UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUX&#xA;YXZ//9l=&#xA;&#34;)"
                                /></fo:inline></fo:block>
                        <!-\-<fo:table xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" font-family="Calibri" language="EN-IN" start-indent="0pt">
                            <fo:table-column column-number="1" column-width="195pt"/>
                            <fo:table-column column-number="2" column-width="184pt"/>
                            <fo:table-column column-number="3" column-width="147pt"/>
                            <fo:table-body start-indent="0pt" end-indent="0pt">
                                <fo:table-row height="64.2pt" border="1">
                                    <fo:table-cell background-color="white" color="black">
                                        <fo:block-container>
                                            <fo:block text-align="justify">
                                                <fo:external-graphic
                                                    content-width="204.75pt" content-height="48pt"
                                                    src="url(&#34;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a&#xA;HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy&#xA;MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACXAoADASIA&#xA;AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA&#xA;AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3&#xA;ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm&#xA;p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA&#xA;AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx&#xA;BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK&#xA;U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3&#xA;uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDg6KPw&#xA;o/CvUPdCij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/Cg&#xA;Aoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/CgAoo/Cj8KACij8KPwoAKKPwo/&#xA;CgAoo/Cj8KACij8KPwoA0vD3/IzaT/1+Rf8AoYr6oHSvlfw7/wAjNpP/AF+Q/wDoYr6oHSuTE7o8&#xA;/G/EhaKKK5jiCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKA&#xA;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&#xA;L4V/597j/v8Amj6xAPrlPsfPtFfQX/CpfCv/AD73H/f80n/CpfCv/Pvcf9/zR9YgH1yn2Pn6jmvc&#xA;Ne+GXhzT/D2pXlvBOJre1llQmYn5lQkfqK8OrSE1O9jalVjUvboLzRzR+NH41ZoHNHNH40fjQAc0&#xA;c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRz&#xA;R+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH40fjQAc0c0fjR+NABzRzR+NH40AHNHNH&#xA;40fjQAc0c0fjR+NABzRzR+NH40AfXdFFFeWeEFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABR&#xA;RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGN4s/5E/Wv+vGf&#xA;/wBFtXy7X1F4s/5E7Wv+vGf/ANFtXy7XXhtmehgtmFFFFdJ2hRRRQAUUUUAFFFFABRRRQAUUUUAF&#xA;FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH13RRRXl&#xA;nhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU&#xA;AFFFFABRRRQAUUUUAFFFFABRRRQBjeKlLeEdZUdTYzAf98NXzP8A2ddf88v/AB4f40UV1Yd6M78G&#xA;9GH9nXX/ADy/8eH+NH9nXX/PL/x4f40UV0XZ2XYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf&#xA;2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf&#xA;88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/&#xA;AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f&#xA;40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2&#xA;ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf8&#xA;8v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8A&#xA;x4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f4&#xA;0UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUXYXYf2ddf88v/AB4f40f2ddf88v8Ax4f40UUX&#xA;YXZ//9l=&#xA;&#34;)"
                                                />
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
                        </fo:table>-\->
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
            </fo:page-sequence>-->
     <fo:page-sequence>

            <xsl:attribute name='master-reference'>page</xsl:attribute>
            <xsl:attribute name='force-page-count'>no-force</xsl:attribute>



            <xsl:if test='position() = 1'>
                <xsl:attribute name='initial-page-number'>1</xsl:attribute>
            </xsl:if>

            <fo:flow flow-name="body">
                <fo:table start-indent="5pt" border-style="none" border-width="0.5pt">
                    <fo:table-column column-width="173pt"/>
                    <fo:table-column column-width="173pt"/>
                    <fo:table-column column-width="173pt"/>
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
                            <!--<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;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&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-->
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
                <!--<fo:block keep-with-previous.within-page="always" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg"
                    space-before.conditionality="retain" text-align="left"
                    font-family="Helvetica" text-decoration="underline"
                    font-size="14pt" font-style="italic"
                    language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                    <xsl:attribute name='id'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                     <xsl:value-of select="$DEBUG-number"/>
                    <xsl:value-of select="@heading"/>
                </fo:block>-->
                <!-- BODY Start -->
                <fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
                    <xsl:variable name="outerHeading">coiSummary</xsl:variable>
                    <xsl:variable name="pageHeading">COI Summary</xsl:variable>
					<xsl:variable name="innerIndex" select="position()"/>

					<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                        xmlns:svg="http://www.w3.org/2000/svg" 
                        space-after.conditionality="retain" text-align="left"
                        font-family="Helvetica" text-decoration="underline" 
                        font-size="14pt" font-style="italic" 
                        language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                        <fo:inline>
                            <fo:leader leader-length="0pt"/></fo:inline>
                    </fo:block>
                    
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
                            <fo:table-column column-width="45mm"/>
                            <fo:table-column column-width="35mm"/>
                            <fo:table-column column-width="20mm"/>
                            <fo:table-column column-width="25mm"/>
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
						                <fo:table-column column-width="527pt"/>
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
                <!--<fo:block text-align="end">
                    Page <fo:page-number/> of
                    <fo:page-number-citation
                        ref-id="last-page"/>
                </fo:block>-->
            </fo:flow>
        </fo:page-sequence>
    

        </fo:root>

    </xsl:template>



<!--
    <xsl:template match="DEBUG" mode="toc">

        <fo:block text-align='justify' text-align-last="justify" space-after="3pt">
            <!-\- the actual pdf -\->
            <fo:basic-link>
                <xsl:variable name="DEBUG-number">
                    <xsl:number level="multiple" count="DEBUG" format="1.1.1. "/>
                </xsl:variable>

                <xsl:variable name="reference">
                    <xsl:number level="multiple" count="DEBUG" format="1.1"/>
                </xsl:variable>

                <xsl:attribute name='internal-destination'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>

                <!-\- insert the DEBUG number -\->
                <!-\- the introduction comes before DEBUG one and has no DEBUG number -\->

                <xsl:value-of select="$DEBUG-number"/>
                <xsl:value-of select='@heading'/>
                <!-\- the default leader width is 0,12pt,527pt which works for this -\->
                <!-\-&#160;-\->
                <fo:leader leader-pattern='dots' rule-thickness='.2pt'
                    leader-alignment='reference-area' font-size="10pt"/>
                <!-\-&#160;-\->

                <!-\- can click on page number -\->
                <fo:page-number-citation>
                    <xsl:attribute name='ref-id'>DEBUG-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                </fo:page-number-citation>

            </fo:basic-link>

        </fo:block>
    </xsl:template>

    <xsl:template match="heading" mode='toc'>
        <!-\-<fo:block text-align='justify' text-align-last="justify" space-after="3pt" margin-left="1cm"
            margin-right='.1cm'  font-size='0.9em'>-\->
            <fo:block text-align='justify' text-align-last="justify" space-after="3pt" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">

            <xsl:variable name="DEBUG-number">
                <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
            </xsl:variable>

            <xsl:variable name="reference">
                <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
            </xsl:variable>

            <fo:basic-link>


                <xsl:attribute name='internal-destination'>ahead-refid-<xsl:value-of select="$reference"/></xsl:attribute>

                <!-\- insert the DEBUG number -\->

                <xsl:value-of select='$DEBUG-number'/>

                <!-\- allows </prod> in title -\->
                <xsl:apply-templates/>
                <!-\- the default leader width is 0,12pt,527pt which works for this -\->
                <!-\-&#160;-\->
                <fo:leader leader-pattern='dots' rule-thickness='.2pt'
                    leader-alignment='reference-area' font-size="10pt"/>

                <!-\-&#160;-\->

                <!-\- can click on page number -\->

                <fo:page-number-citation>
                    <xsl:attribute name='ref-id'>ahead-refid-<xsl:value-of select="$reference"/></xsl:attribute>
                </fo:page-number-citation>

            </fo:basic-link>

        </fo:block>
    </xsl:template>

    <!-\- header across page for one attribute -\->
    <xsl:template match="heading">

        <xsl:variable name="DEBUG-number">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
        </xsl:variable>

        <xsl:variable name="reference">
            <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
        </xsl:variable>


        <!-\- use a list so the number is outside the pdf -\->
        <fo:list-block margin-left='-2cm' provisional-distance-between-starts="2cm"
            provisional-label-separation=".25cm">

            <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                    <fo:block text-align="right">
                        <!-\- destination for toc -\->
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

-->
<!--<xsl:template match="DEBUG">

    <!-\-<xsl:variable name="DEBUG-number">
        <xsl:number level="multiple" count="DEBUG | heading" format="1.1. "/>
    </xsl:variable>

    <xsl:variable name="reference">
        <xsl:number level="multiple" count="DEBUG | heading" format="1.1"/>
    </xsl:variable>-\->

    <!-\- if first DEBUG, set page number to 1 -\->
    <fo:page-sequence>

        <xsl:attribute name='master-reference'>page</xsl:attribute>
        <xsl:attribute name='force-page-count'>no-force</xsl:attribute>



        <xsl:if test='position() = 1'>
            <xsl:attribute name='initial-page-number'>1</xsl:attribute>
        </xsl:if>

        <fo:flow flow-name="body">
            <fo:table start-indent="5pt" border-style="none" border-width="0.5pt">
                <fo:table-column column-width="173pt"/>
                <fo:table-column column-width="173pt"/>
                <fo:table-column column-width="173pt"/>
                    <fo:table-body start-indent="0pt">
            <fo:table-row height="15.0pt">
                <fo:table-cell padding-top="0pt" padding-left="5.4pt" padding-bottom="0pt" padding-right="5.4pt" border-bottom-style="none" border-bottom-color="black"
                    border-bottom-width="0.5pt" border-right-style="none" border-right-color="black" border-right-width="1.5pt" background-color="white" color="black" display-align="before">
                    <fo:block-container>
                        <!-\-<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;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&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-\->
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
                        <!-\-<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags" xmlns:svg="http://www.w3.org/2000/svg" space-after="10pt" space-after.conditionality="retain" line-height="1.3190500000000003" font-family="Calibri" font-size="11pt" language="EN-US"><fo:inline><fo:external-graphic content-width="178.45pt" content-height="33.2pt" src="url(&#34;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAABFCAMAAABg8p2aAAAAAXNSR0IArs4c6QAAAARnQU1BAACx&#xA;jwv8YQUAAALTUExURf///yMfIMzMzCQfIACu75GPj1pXWCQgINcojPHx8ePj4wCt76yrq9bV1dcn&#xA;jNgojDMzMyEecj87PHZzdLq5uZKPj5mZmUxJSoSBgmZmZiMfHwAAM1tXWCEfc1tYWEA7PNoukwCz&#xA;8O76/6fl+iEfcgCy8HdzdE1JStfV1QC98svv/Xd0dADC9CfH9ZGPjv3w+Lu5uUA8PILb+AC38e76&#xA;/mbM/931/m/W+CIfc/vg8SbG9C4edPbB4q2rq+VbsFvQ9u+UzNzo9E1KSgCByd03mpKQj+BCo8wm&#xA;ivzv+OBBogMcUgBAkoWBgvSy2wCl59z1/RwmevGj1Pvh8gCy710feut3vwC98QBtufnR6eyFxfjR&#xA;6e36/vHw9gBJmgDB81tYWUYed8vv/D87O+NOqX8ggO/v86jl+uNOqlpXV7nq+rnq+wBksbwjggCc&#xA;4O2FxggHQO2GxrUkhxUugoLb+e+Uzbrq+wCJ0Ot4wACu8LYliIWCgnd0dYPc+VEeeeJNqfnR6tz1&#xA;/ngWaA03iQkUR4SBgW5xkqAiheZcsZ8ihAB2wgBbqK2sq9gojfOy2627zasjhcolhwCg4Lq209su&#xA;k/jQ6R0ne6yrqk9TemZmmQCT2ACj5DEre1zR99bU5NsulIPb+eZbsP3w+cyZzGsUZFAQWjQLUGAc&#xA;ZcjF20Nytc0sj+fM6Hh0dUIOVQARRikle7u6uQgGP6yByuOt2qtPolklghgIRToedSslWXMffgAk&#xA;Xa4rjd9BogBOiW236ViFvgB4tgBmmYjR8O+VzQAzZokhgZBwtY6QqCpVn0mi1kS87pNVkcrg9QBZ&#xA;mz1CawBEfqWizlxYWVg1cACb31M0kgAHPnQgfsImir/Az+hptwCDwmV9sE4mgoY4mMwzmSBEkjQL&#xA;TwC48SYJSQCp60hbsACS1zwqfZUig6fl+ZMbcqIeeevq9wCOzRwnehk/lM7P2gC38FvR9yd5yfAA&#xA;AAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAADImlUWHRYTUw6Y29tLmFkb2Jl&#xA;LnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtj&#xA;OWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUg&#xA;WE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAi&#xA;PiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5&#xA;bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6&#xA;Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29t&#xA;L3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NU&#xA;eXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1h&#xA;Y2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNkFCQjA5RTREMTQxMUUyQjA2REYw&#xA;NzdDNkM3RDg4OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNkFCQjA5RjREMTQxMUUyQjA2&#xA;REYwNzdDNkM3RDg4OCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAu&#xA;aWlkOkU2QUJCMDlDNEQxNDExRTJCMDZERjA3N0M2QzdEODg4IiBzdFJlZjpkb2N1bWVudElEPSJ4&#xA;bXAuZGlkOkU2QUJCMDlENEQxNDExRTJCMDZERjA3N0M2QzdEODg4Ii8+IDwvcmRmOkRlc2NyaXB0&#xA;aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Eh/dsgAAAAxj&#xA;bVBQSkNtcDA3MTIAAAADSABzvAAAEtZJREFUeF7tW4efHMWVrurcMz0z3dOTd3dmJa1WC6ssAQIh&#xA;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&#xA;FJyTiKGORp4AAAAASUVORK5CYIJ=&#xA;&#34;)"/></fo:inline></fo:block>-\->
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

            <!-\- the DEBUG heading -\->
            <!-\-<fo:block font-weight="bold" space-after="1cm">-\->
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
            <!-\- BODY Start -\->
            <fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">
            <xsl:variable name="outerHeading" select="@formname"/>
                <xsl:variable name="pageHeading" select="@heading"/>
				<xsl:variable name="innerIndex" select="position()"/>

				<fo:block xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
                    xmlns:svg="http://www.w3.org/2000/svg" 
                    space-after.conditionality="retain" text-align="left"
                    font-family="Helvetica" text-decoration="underline" 
                    font-size="14pt" font-style="italic" 
                    language="EN-NZ" start-indent="43pt" end-indent="43pt" font-weight="bold">
                    <fo:inline>
                        <fo:leader leader-length="0pt"/></fo:inline>
                </fo:block>
                
                <!-\- Attachments/crossTab -\->
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
                        <fo:table-column column-width="45mm"/>
                        <fo:table-column column-width="35mm"/>
                        <fo:table-column column-width="20mm"/>
                        <fo:table-column column-width="25mm"/>
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

					<!-\- Research Personnel -\->
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

					<!-\- Other Personnel -\->
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

                <!-\-<xsl:for-each select="//entry[@formname=$outerHeading and (@type='field' or @type='radiobuttons' or @type='entity' or @type='instructions' or @type='instructionsBold' or @type='checkbox' or @type='textSpecial' or @type='text2Special' or @type='text3Special' or @type='dropdown2Special' or @type='checkboxSpecial'  or @type='box' or @type='bigbox' or @type='textbox' or @type='textarea' or @type='yesnobuttons' or @type='line' or @type='text' or @type='dropdown' or @type='manual' or @type='bordertextarea')]">	-\->
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
						    <!-\- @type='field' or @type='radiobuttons' or @type='entity' or @type='instructions' or @type='instructionsBold' or @type='checkbox' or @type='textSpecial' or @type='text2Special' or @type='text3Special' or @type='dropdown2Special' or @type='checkboxSpecial'  or @type='box' or @type='bigbox' or @type='textbox' or @type='textarea' or @type='yesnobuttons' or @type='line' or @type='text' or @type='dropdown' or @type='manual' or @type='bordertextarea' -\->
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
													<!-\-<xsl:if test="@type='checkbox' and .=''">
													<fo:inline font-family="Helvetica"  color="black">
														<fo:leader leader-length="0pt"/>No</fo:inline>
													</xsl:if>
													<xsl:if test="@type='checkbox' and .!=''">
														<fo:inline font-family="Helvetica"  color="black">
															<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>
													</xsl:if>
													<xsl:if test="@type!='checkbox'">-\->
														<fo:inline font-family="Helvetica"  color="black">
															<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>
													<!-\-</xsl:if>-\->
												</fo:block>
											</fo:block-container>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:when>
						<!-\-<xsl:when test="(@type='textarea' or @type='box' or @type='bigbox' or @type='bordertextarea' or @type='text') and @formType!='entryTable' and not(@type='textarea' and @label='Species')">
							<!-\\-<fo:block space-after="10pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-size="10pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>-\\->
						    <!-\\-<fo:block font-family="Helvetica" font-weight="bold" start-indent="43pt" text-indent="0pt" wrap-option="wrap" padding-before="3pt" padding-after="2pt">
								<xsl:value-of select="@label" />
							</fo:block>
							<!-\\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space-collapse="true" padding-before="3pt">
								<xsl:call-template name="intersperse-with-zero-spaces">
									<xsl:with-param name="str" select="."/>
								</xsl:call-template>
								</fo:block>	-\\->
							<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap">
								<fo:inline font-family="Helvetica" font-size="10pt" color="black">
									<fo:leader leader-length="0pt"/><xsl:value-of select="." /></fo:inline>
							</fo:block>	-\\->

						    <fo:block font-family="Helvetica" font-weight="bold" start-indent="43pt" text-indent="0pt" wrap-option="wrap" padding-before="3pt">
						        <xsl:value-of select="@label" />
						    </fo:block>
						    <!-\\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space-collapse="true" padding-before="3pt">
						        <xsl:call-template name="intersperse-with-zero-spaces">
						        <xsl:with-param name="str" select="."/>
						        </xsl:call-template>
						        </fo:block>	-\\->
						    <!-\\-<fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space="nowrap" white-space-collapse="true" padding-before="3pt">
						        <fo:inline font-family="Helvetica" font-size="10pt" color="black">
						            <fo:leader leader-length="0pt"/><xsl:value-of select="normalize-space(.)"/></fo:inline>
						            </fo:block>		-\\->
						    <!-\\-<fo:block keep-with-previous.within-page="always" widows="2" orphans="2" font-size="10pt" line-height="1.147" linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve" wrap-option="wrap">

						        <xsl:call-template name="intersperse-with-zero-spaces">
						            <xsl:with-param name="str" select="."/>
						        </xsl:call-template>
						        </fo:block>		-\\->
						    <fo:block font-family="Helvetica" start-indent="43pt" text-indent="0pt" wrap-option="wrap" space-after="5mm" white-space="nowrap" white-space-collapse="true" padding-before="3pt">
						        <fo:inline font-family="Helvetica" font-size="10pt" color="black">
						            <fo:leader leader-length="0pt"/><xsl:value-of select="normalize-space(.)"/></fo:inline>
						    </fo:block>
						</xsl:when>	-\->
					    <xsl:when test="(@type='textarea' or @type='box' or @type='bigbox' or @type='bordertextarea' or @type='text') and @formType!='entryTable' and not(@type='textarea' and @label='Species') ">
					        <!-\-<xsl:variable name="txtArea">
					            <xsl:call-template name="intersperse-with-zero-spaces">
					                <xsl:with-param name="str" select="normalize-space(.)"/>
					            </xsl:call-template>
					        </xsl:variable>    -\->
					        <fo:table start-indent="43pt">
					                <fo:table-column column-width="527pt"/>
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
							<!-\-<fo:block space-after="10pt" space-after.conditionality="retain"
								line-height="1.3190500000000002" font-size="10pt"
								language="EN-US" xmlns:st1="urn:schemas-microsoft-com:office:smarttags"
								xmlns:svg="http://www.w3.org/2000/svg">
								<fo:leader/>
							</fo:block>-\->
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
            <!-\- BODY END -\->
            <!-\-<xsl:apply-templates select="heading | paragraph"/>-\->

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
</xsl:template>-->
</xsl:stylesheet>

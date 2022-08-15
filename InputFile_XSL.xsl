<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xsl xsd" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    
    <xsl:output indent="yes" method="xml"/>
    
   
    <!-- identity template - copies everything as-is unless overridden -->
    <xsl:template match="@*|node()">
     
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
 
    <!-- Root template -->
    <xsl:template match="/Quickbooks_Journal">
        <xsl:copy>
            
    <!--  Get Specific Node for Company Code  -->
            <Company_Code>   
                <xsl:apply-templates select="Account[4]/col3"/>
            </Company_Code>
    
    <!--  Get Specific Node for Header  -->
            <Header>   
                <xsl:apply-templates select="Account[5]/*"/>
            </Header>
     
     <!--  Get Node 6 up to last Node -->       
                <xsl:apply-templates select="Account[6] | Account[6]/following-sibling::*"/>

        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match = "/">
	
		<table border="1">
        		<xsl:attribute name="id"><xsl:value-of select="//tournament/year"/></xsl:attribute>
			<tr>
				<th><b>Round</b></th>
				<th><b>Player</b></th>
				<th><b>Set 1</b></th>
				<th><b>Set 2</b></th>
				<th><b>Set 3</b></th>
				<th><b>Set 4</b></th>
				<th><b>Set 5</b></th>
			</tr>
			<xsl:apply-templates select="//match">
				<xsl:sort select="round" data-type="number" order="ascending"/>
			</xsl:apply-templates>
			
		</table>

</xsl:template>

<xsl:template match="//match">
	
	<tr>
		<td><xsl:value-of select="round"/></td>
		<xsl:apply-templates select="./player[1]"/>
		<xsl:for-each select="player[1]/set">
			<td><xsl:value-of select="."/></td>
		</xsl:for-each>
	</tr>
	<tr>
		<td><xsl:value-of select="round"/></td>
		<xsl:apply-templates select="./player[2]"/>
		<xsl:for-each select="player[2]/set">
			<td><xsl:value-of select="."/></td>
		</xsl:for-each>
	</tr>

</xsl:template>

<xsl:template match="//player">
	<xsl:choose>
		<xsl:when test="./outcome='won'">
			<td><b><xsl:value-of select="./name"/></b></td>
		</xsl:when>
		<xsl:otherwise>
			<td><xsl:value-of select="./name"/></td>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
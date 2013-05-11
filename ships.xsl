<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="/">

<html>
<head>
	<title>Fallen Galaxy Ships Counters</title>
	<link rel="stylesheet" href="compos.css"/>
	<link rel="stylesheet" href="ships.css"/>
</head>
<body>
	<xsl:for-each select="ships/class">
		<h1><xsl:value-of select="name"/></h1>

		<xsl:for-each select="ship">
			<xsl:sort select="ship/name"/>

			<div class="compo allFactions">
				<xsl:choose>
					<xsl:when test="@faction">
						<xsl:attribute name="class">
							compo <xsl:value-of select="@faction"/>
						</xsl:attribute>
					</xsl:when>
				</xsl:choose>

				<h3>
					<div class="factionimage"/>
					<xsl:value-of select="name"/>
				</h3>
				<div class="ship mainship">
					<div class="shipimage {translate(name, ' ', '')}"/>
				</div>

				<!-- FIXME: Table… for *once*, it’d be best in a table. I think. -->
				<div class="counters">
					<div class="strongAndWeak">
					<div class="strong">
						<h4>Strong against</h4>

						<!-- FIXME: Template -->
						<xsl:call-template name="showShipsIfHas">
							<xsl:with-param name="elem" select="strong" />
						</xsl:call-template>
					</div>
					<div class="weak">
						<h4>Weak against</h4>

						<xsl:call-template name="showShipsIfHas">
							<xsl:with-param name="elem" select="weak" />
						</xsl:call-template>
					</div>
					</div>

					<xsl:choose>
						<xsl:when test="bestwith">
							<div class="bestwith">
								<h4>Best with</h4>

								<div class="ships">
									<xsl:apply-templates select="bestwith" />
								</div>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
		</xsl:for-each>
	</xsl:for-each>
</body>
</html>
</xsl:template>

<xsl:template name="showShipsIfHas">
	<xsl:param name="elem" />
	<div class="ships">
		<xsl:choose>
			<xsl:when test="$elem">
				<xsl:apply-templates select="$elem" />
			</xsl:when>
			<xsl:otherwise>
				<div>
					none in particular
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template match="strong | weak | bestwith">
	<div class="ship">
		<div class="shipimage {translate(., ' ', '')}"/>
	</div>
</xsl:template>

</xsl:stylesheet> 

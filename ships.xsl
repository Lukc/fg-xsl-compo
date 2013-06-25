<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="/">

<html>
<head>
	<title>Contres des vaisseaux de Fallen Galaxy</title>
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

				<h2 class="compname">
					<div class="factionimage"/>
					<xsl:value-of select="name"/>
				</h2>
				<div class="ship mainship">
					<div class="shipimage {translate(name, ' ', '')}"/>
				</div>

				<!-- FIXME: Table… for *once*, it’d be best in a table. I think. -->
				<div class="counters">
					<div class="strongAndWeak">
					<div class="strong">
						<h4>Fort contre</h4>

						<!-- FIXME: Template -->
<<<<<<< HEAD
						<div class="ships">
							<xsl:choose>
								<xsl:when test="strong">
									<xsl:for-each select="strong">
										<div class="ship">
											<div class="shipimage {translate(., ' ', '')}"/>
										</div>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<div>
										aucun en particulier
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
=======
						<xsl:call-template name="showShipsIfHas">
							<xsl:with-param name="elem" select="strong" />
						</xsl:call-template>
>>>>>>> 93c3a308c80a01ba8ddd45dc9aad40c54abfe92c
					</div>
					<div class="weak">
						<h4>Faible contre</h4>

<<<<<<< HEAD
						<div class="ships">
							<xsl:choose>
								<xsl:when test="weak">
									<xsl:for-each select="weak">
										<div class="ship">
											<div class="shipimage {translate(., ' ', '')}"/>
										</div>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<div>
										aucun en particulier
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
=======
						<xsl:call-template name="showShipsIfHas">
							<xsl:with-param name="elem" select="weak" />
						</xsl:call-template>
>>>>>>> 93c3a308c80a01ba8ddd45dc9aad40c54abfe92c
					</div>
					</div>

					<xsl:choose>
						<xsl:when test="bestwith">
							<div class="bestwith">
								<h4>Meilleur avec</h4>

								<div class="ships">
									<xsl:apply-templates select="bestwith" />
								</div>
							</div>
						</xsl:when>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="worstwith">
							<div class="worstwith">
								<h4>Meilleur sans</h4>

								<div class="ships">
									<xsl:for-each select="worstwith">
										<div class="ship">
											<div class="shipimage {translate(., ' ', '')}"/>
										</div>
									</xsl:for-each>
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

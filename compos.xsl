<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="/">

<html>
<head>
	<title>Compositions de flottes de Fallen Galaxy</title>
	<link rel="stylesheet" href="compos.css" />
</head>
<body>
	<xsl:for-each select="fleets/category">
		<xsl:sort select="name"/>

		<h1><xsl:value-of select="name" /></h1>

		<xsl:for-each select="compo">
			<xsl:sort select="name"/>

			<div>
				<!--xsl:if test="@id">
					<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
				</xsl:if-->
				<xsl:choose>
					<xsl:when test="@faction">
						<xsl:attribute name="class">
							<xsl:value-of select="concat('compo ', @faction)" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="class">compo allFactions</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<h2 class="compname">
					<span class="factionimage"></span>

					<xsl:value-of select="name" />

					<xsl:if test="@type = 'aggressive' or @type = 'defensive' or @type = 'architect' or @type = 'cargo'">
						<span class="{@type}"></span>
					</xsl:if>
				</h2>

				<xsl:if test="@min-tech or @min-pow">
					<p class="minPower">
						<xsl:if test="@min-tech">
							<xsl:value-of select="@min-tech" />
							<span class="tech"></span>
						</xsl:if>
						<xsl:text> </xsl:text>
						<xsl:if test="@min-pow">
							<xsl:value-of select="@min-pow" />
							<span class="power"></span>
						</xsl:if>
					</p>
				</xsl:if>

				<xsl:if test="@faction">
					<p class="faction">
						<xsl:choose>
							<xsl:when test="@faction = 'OfficeDiplomatiqueGalactique'">Office Diplomatique Galactique</xsl:when>
							<xsl:when test="@faction = 'RéseauAutonome'">Réseau Autonome</xsl:when>
							<xsl:otherwise><xsl:value-of select="@faction" /></xsl:otherwise>
						</xsl:choose>
					</p>
				</xsl:if>

				<xsl:if test="ships">
					<div class="fleet">
						<xsl:apply-templates select="ships[not(@type)]/*" />
					</div>

					<xsl:if test="ships[@type = 'variation']">
						<div class="fleet variations">
							<h3>Variations</h3>
							<ul>
								<li class="variation selected">
									<p>
										<xsl:choose>
											<xsl:when test="ships[not(@type)]/@title"><xsl:value-of select="ships[not(@type)]/@title"/></xsl:when>
											<xsl:otherwise>Défaut</xsl:otherwise>
										</xsl:choose>
									</p>
									<div class="ships">
										<xsl:apply-templates select="ships[not(@type)]/*" />
									</div>
								</li>
								<xsl:for-each select="ships[@type = 'variation']">
									<li class="variation">
										<p>
											<xsl:choose>
												<xsl:when test="@title"><xsl:value-of select="@title" /></xsl:when>
												<xsl:otherwise>Variation <xsl:value-of select="position()" /></xsl:otherwise>
											</xsl:choose>
										</p>
										
										<div class="ships">
											<xsl:apply-templates select="*" />
										</div>
									</li>
								</xsl:for-each>
							</ul>
						</div>
					</xsl:if>
				</xsl:if>

				<xsl:if test="strength or weakness">
					<div class="counters">
						<h3>Contres</h3>
						<xsl:if test="strength">
							<div class="strongCounter">
								<h4>Fort contre</h4>
								<ul>
									<xsl:apply-templates select="strength" />
								</ul>
							</div>
						</xsl:if>
						<xsl:if test="weakness">
							<div class="weakCounter">
								<h4>Faible contre</h4>
								<ul>
									<xsl:apply-templates select="weakness" />
								</ul>
							</div>
						</xsl:if>
					</div>
				</xsl:if>
				<xsl:if test="note">
					<div class="notes">
						<h4>Notes</h4>
						<ul>
							<xsl:for-each select="note">
								<li class="note"><xsl:value-of select="."/></li>
							</xsl:for-each>
						</ul>
					</div>
				</xsl:if>
			</div>
		</xsl:for-each>
	</xsl:for-each>
	<script type="text/javascript" src="compos.js"></script>
</body>
</html>

</xsl:template>

<xsl:template match="strength | weakness">
	<li>
		<a class="compo-type-link"><xsl:value-of select="." /></a>
	</li>
</xsl:template>

<xsl:template match="front | back">
	<div class="{name(.)}Ships ships">
		<xsl:for-each select="ship">
			<!--xsl:sort select="@amount"/> Do not do it! The order is important. -->
			<div class="ship">
				<div class="shipimage {translate(.,' ','')}"></div>
				<div class="amount">
					<span class="amount{@amount}">
						<xsl:choose>
							<xsl:when test="@amount = '0'">uniquement</xsl:when>
							<xsl:when test="@amount = '1'">énormément</xsl:when>
							<xsl:when test="@amount = '2'">beaucoup</xsl:when>
							<xsl:when test="@amount = '3'">quelques</xsl:when>
							<xsl:when test="@amount = '4'">peu</xsl:when>
							<xsl:when test="@amount = '5'">très peu</xsl:when>
							<xsl:when test="@amount = '6'">unique</xsl:when>
							<xsl:when test="@amount = '-1'">infiniment</xsl:when>
							<xsl:otherwise>???</xsl:otherwise>
						</xsl:choose>
					</span>
				</div>
				<xsl:value-of select="." />
			</div>
		</xsl:for-each>
	</div>
</xsl:template>

</xsl:stylesheet> 

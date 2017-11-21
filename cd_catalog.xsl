<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8" indent="yes"></xsl:output>

	<xsl:template match="/">
		<html>
			<!-- Import de la police "Lobster" -->
			<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css"/>
			<head>
				<title>CD catalog</title>
				<!-- CSS -->
				<style>
					h1, h2, h3, h4 {
						font-family : Lobster, Helvetica;
					}

					p {
						font-family: Arial;
						font-style: italic;
						font-size: 12px;
						margin: 0cm 0cm 0cm 1cm;
						transition: font-size 0.05s;					
					}

					table {
						border: 1px solid black;
						border-radius: 10px;
						border-color: #99e699;
						border-width: 3px;
						margin-left: 1cm;
						width: 6cm;				
					}

					tr {
						text-align: left;               
						transition: background-color 1s;
						font-family: Helvetica;
					}

					td:first-child {
						text-align: right;					
					}

					td:second-child {
						text-align: left;
					}

					td {
					    width: 3cm;
					}

					tr:hover {
						background-color: #99e699;					
					}

					p:hover {
						font-size:14px;
					}

					footer {
						font-style: italic;
						font-size: 12px;
					}

					.bloc {
						display: inline-block;
							width: 8cm;  										
					}				

					img {
						width: 6cm;
						height: 6cm;
						margin-bottom: 1cm;
						margin-left: 1cm;
						border-radius: 50%;
						transition: border-radius 0.5s;
					}

					img:hover {
						border-radius: 5px;					
					}

					a {
						color: #99e699;
					}
					.container {
					    position: fixed;
					}
					nav {
					    position: absolute;
					    left: 0px;
					    width: 200px;
					}
					section {
					    /* position is static by default */
					    margin-left: 300px;
					}
				</style>	
			</head>
			<body>
				<div id="Top"><h1 style="text-align: center; font-size: 30pt">CD catalog</h1></div>
				

				<!-- 1ere boucle pour le sommaire. Les balises nav et container permettent de le placer sur la gauche de la page -->
				<div class="container">
				<nav>
					<h2 style="margin-left: 0.5cm;">Summary</h2>
				<xsl:for-each select="CATALOG/CD">
					<xsl:sort select="ARTIST"/>
					<div class="bloc">
					<p>
						<!-- generate-id permet de faire des ancres facilement -->
						<a href="#{generate-id(TITLE)}">
							<xsl:value-of select="ARTIST"/> - <xsl:value-of select="TITLE"/> 
						</a>
					</p>
					</div>
				</xsl:for-each>
				</nav>
				</div>
				<section>
					<h2 style="margin-left: 0.5cm; margin-top: 1.2cm;">Catalog</h2>

					<!-- 2eme boucle pour le catalogue -->				
					<xsl:for-each select="CATALOG/CD">
						<xsl:sort select="ARTIST"/>
						<div class="bloc">
							<!-- la div de classe bloc permet de mettre cote à cote les éléments -->
							<h4 id="{generate-id(TITLE)}" style="margin-left: 0.5cm;"><xsl:value-of select="ARTIST"/> - <xsl:value-of select="TITLE"/></h4>

							<!-- Image avec lien Deezer (balises ajoutées manuellement dans le fichier XML-->
							<a alt="Click to listen on Deezer !">
								<xsl:attribute name="href">http://www.deezer.com/us/album/<xsl:value-of select='LISTEN'/></xsl:attribute>
								<img>
									<xsl:attribute name="src">../pictures/<xsl:value-of select='PICTURE'/>.jpg</xsl:attribute>
								</img>
							</a>	
							
							<!-- Tableau -->					
							<table cellspacing="0">
								<tr>
									<td>Country : </td>
									<td><xsl:value-of select="COUNTRY"/></td>
								</tr>
								<tr>
									<td>Company : </td>
									<td><xsl:value-of select="COMPANY"/></td>
								</tr>
								<tr>
									<td>Price : </td>
									<td><xsl:value-of select="PRICE"/> $</td>
								</tr>
								<tr>
									<td>Year : </td>
									<td><xsl:value-of select="YEAR"/></td>
								</tr>
							</table>

		                    <p style="margin-top: 10px; margin-bottom: 10px;"><a href="#Top">Back to Top</a></p>
	                	</div>
					</xsl:for-each>
				</section>
			</body>

			<footer>
				Victor Mataigne - Mini projet ESR - Mise en page de documents XML
				Contact : <a href="mailto:victor.mataigne@wanadoo.fr">victor.mataigne@wanadoo.fr</a>.
			</footer>
		</html>
	</xsl:template>
</xsl:stylesheet>
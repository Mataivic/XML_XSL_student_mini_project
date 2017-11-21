<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0" >
<xsl:template match="/">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" >

<!-- Déclaration de la mise en page -->
	<fo:layout-master-set>
		<fo:simple-page-master master-name="lecatalogue" margin="2cm">
			<fo:region-body margin="1.5cm 0 2cm 0" column-count="1" />
			<fo:region-before extent="1cm" />
			<fo:region-after precedence="true" extent="1cm" />
		</fo:simple-page-master>
	</fo:layout-master-set>
	
<!-- Corps du document -->
	<fo:page-sequence master-reference="lecatalogue" 
		font-family="Times" 
		font-size="10pt" 
		line-height="1.5em" 
		text-align="justify">

		<!-- En-tete (table de 3 colonnes et 1 ligne : nom du projet, auteur, date) -->
		<fo:static-content flow-name="xsl-region-before">
			<fo:table
				border-bottom="1px solid #ccc" 
				font-size=".9em" 
				color="#666">
				<fo:table-column column-width="8cm" />
				<fo:table-column column-width="5cm" />
				<fo:table-column column-width="4cm" />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block font-family="Helvetica">Mini-projet ESR - Mise en page de documents XML</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" 
								font-family="Helvetica">Victor Mataigne
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right" 
								font-family="Helvetica">Septembre 2017
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:static-content>

		<!-- Footer -->
		<fo:static-content flow-name="xsl-region-after">
			<fo:block border-top="1px solid #ccc" 
				color="#666" 
				font-size=".9em" 
				text-align="center">page <fo:page-number />					
			</fo:block>
		</fo:static-content>

		<!-- Contenu -->
		<fo:flow flow-name="xsl-region-body">
			<!-- Titre -->
			<fo:block font-size="40pt" 
				font-family="Helvetica" 
				font-weight="bold" 
				space-after="1em" 
				text-align="center" 
				color="green">
				CD Catalog
			</fo:block>
			<!-- ancrage -->
			<fo:block id="ancresom" 
				font-family="Helvetica" 
				font-size="14pt" 
				border-bottom="1px solid #999" 
				space-before="2em" 
				space-after="2em" 
				text-align="center" 
				color="green"> 
			Sommaire
			</fo:block>
			
			<!-- boucle 1 pour avoir le sommaire -->
			<xsl:for-each select="CATALOG/CD">
				<xsl:sort select="ARTIST"/>
				<fo:block text-indent="2em" 
					space-after="0.25em" 
					font-family="Helvetica" 
					font-size="14pt" 
					text-align="left" 
					font-weight="normal">
					<fo:basic-link internal-destination="#{generate-id(TITLE)}" 
						color="black" >
						<xsl:value-of select="ARTIST"/><xsl:text> - </xsl:text><xsl:value-of select="TITLE"/>
					</fo:basic-link>
				</fo:block>
			</xsl:for-each>
			
			<!-- boucle 2 pour les infos CD -->
		   <xsl:for-each select="CATALOG/CD">
		   		<xsl:sort select="ARTIST"/>			   	

				<fo:block id="#{generate-id(TITLE)}"
					break-before="page"
					space-after="3em" 					
					font-size="18pt" 
					font-family="Helvetica" 
					color="green" 
					font-weight="bold" 
					margin-left="1.5cm">
					<xsl:value-of select="ARTIST"/> - <xsl:value-of select="TITLE"/> 
				</fo:block>

				<!-- image avec lien deezer -->
				<fo:block margin-left="3cm">
					<fo:basic-link color="blue">
						<xsl:attribute name="external-destination">http://www.deezer.com/us/album/<xsl:value-of select="LISTEN"/></xsl:attribute>
						<fo:external-graphic content-height="scale-to-fit" 
							width="8cm" 
							content-width="8cm">
							<xsl:attribute name="src">pictures/<xsl:value-of select="PICTURE"/>.jpg</xsl:attribute>
						</fo:external-graphic>
					</fo:basic-link>
				</fo:block>

				<!-- tableau -->
				<fo:table table-layout="fixed"
					width="50%"
					font-family="Helvetica" 
					text-indent="-7em" 
					space-before="2em" 
					margin-left="3cm">
					<fo:table-column column-width="4cm"/>
					<fo:table-column column-width="4cm"/>
					
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt">Country :</fo:block>
							</fo:table-cell>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt"><xsl:value-of select="COUNTRY"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt">Company :</fo:block>
							</fo:table-cell>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt"><xsl:value-of select="COMPANY"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt">Price :</fo:block>
							</fo:table-cell>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt"><xsl:value-of select="PRICE"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt">Year :</fo:block>
							</fo:table-cell>
							<fo:table-cell border="solid 0.5mm black">
								<fo:block font-size="14pt"><xsl:value-of select="YEAR"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>

				<!-- Retour au sommaire -->
				<fo:block space-before="5em" 
					margin-left="3cm" 
					font-family="Helvetica">
					<fo:basic-link internal-destination ="ancresom" 
						color="green"
					>Retour au Sommaire</fo:basic-link>
				</fo:block>
			</xsl:for-each>
		</fo:flow>
	</fo:page-sequence>

</fo:root>
</xsl:template>
</xsl:stylesheet>

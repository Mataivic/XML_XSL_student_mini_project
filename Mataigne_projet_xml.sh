#!/bin/bash
# Auteur : Victor Mataigne
# Date : 18/09/201

# Fenetre yad
choix=$(yad --center --height 150 --width 200 --list --checklist --column=Choix --column=Format false html false pdf)

# Detection du choix utilisateur
if [[ $choix =~ .*html.* ]]
then
    echo "Conversion to html !"
    xsltproc cd_catalog.xsl cd_catalog.xml > outputs/cd_catalog.html
    echo "Done. HTML file is in the \"outputs\" directory."
fi

if [[ $choix =~ .*pdf.* ]]
then
	echo "Conversion to pdf !"
	fop -xml cd_catalog.xml -xsl cd_catalogfo.xsl -pdf outputs/cd_catalog.pdf
	echo "Done. pdf file is in the \"outputs\" directory."
fi

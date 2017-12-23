#!/bin/sh
# fill in script, place in tmp directory to generate new files, or in wiki directory to edit old files (be sure to comment out cp line if wiki directory)
##update csv files
curl "https://docs.google.com/spreadsheets/d/e/2PACX-1vSjdP9bfkGE2foDnasMPqgIZ_kYU7imYBuZwHSEuLE-gHF2GQx3rHdYXOy_tKXUDt0aPuItdv11CteB/pub?gid=421712873&single=true&output=csv" > mablist.csv

curl "https://docs.google.com/spreadsheets/d/e/2PACX-1vSjdP9bfkGE2foDnasMPqgIZ_kYU7imYBuZwHSEuLE-gHF2GQx3rHdYXOy_tKXUDt0aPuItdv11CteB/pub?gid=886389908&single=true&output=csv" > tablemd.csv

curl "https://docs.google.com/spreadsheets/d/e/2PACX-1vSjdP9bfkGE2foDnasMPqgIZ_kYU7imYBuZwHSEuLE-gHF2GQx3rHdYXOy_tKXUDt0aPuItdv11CteB/pubchart?oid=1360516766&format=image" > ../img/mabchart.png

## edits each $trade_name.md file and fills in yml section with relevant info from mablist.csv
## mablist.csv comes from google sheet, showing relevant info in proper columns
## remainder is for last column on sheet (which should be empty) to prevent extra characters from being added
## ifs uses comma separation so '+' signs are used in the google sheet instead. Last line in sed will replace '+' symbols in text with commas for markdown, where they are needed for lists.
## this script now uses freshly downloaded mabist.csv to generate new files
## comment out cp line to only edit current files

while IFS="," read -r trade_name med_name target indication approval_year bla_id patent_year antibody_type remainder
do
	echo $trade_name
	cp template.md $trade_name.md
	sed -i "" "s/title:.*/title: $trade_name/" ./$trade_name.md
	sed -i "" "s/medname:.*/medname: $med_name/" ./$trade_name.md
	sed -i "" "s/target:.*/target: [$target]/" ./$trade_name.md
	sed -i "" "s/targetb:.*/targetb: []/" ./$trade_name.md
	sed -i "" "s/type:.*/type: [$antibody_type]/" ./$trade_name.md
	sed -i "" "s/category:.*/category: [$indication]/" ./$trade_name.md
	sed -i "" "s/year:.*/year: [$approval_year]/" ./$trade_name.md
	sed -i "" "s/patent:.*/patent: [$patent_year]/" ./$trade_name.md
	sed -i "" "s/bla:.*/bla: [$bla_id]/" ./$trade_name.md
	sed -i "" "s/+/, /g" ./$trade_name.md
	echo "done"
	
	#sed -i "s/^Current date.*/Current date ${your_date}/" /path/to/file
done < "mablist.csv"

#makes new table.md file for wiki index
csv2md tablemd.csv > table.md

echo "clean up"
rm OfficialName.md
rm mablist.csv
rm tablemd.csv
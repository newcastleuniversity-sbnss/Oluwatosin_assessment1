# download Uniprot protein sequences 
#find the longest protein
for id in P69905 P68871 P02144 P01942
do 
	wget -q -O "$id.fasta" "https://rest.uniprot.org/uniprotkb/$id.fasta"
done

echo "protein lengths (amino acids):"
for file in *.fasta
do
	if grep -q '^>' "$file"; then
		length=$(grep -v '^>' "$file" | tr -d '\n\r' | wc -c)
		echo "${file%.fasta}: $length amino acids"
	fi
done

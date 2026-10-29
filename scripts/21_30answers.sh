#!/bin/bash
#script for Questions 21-30
#Question 21: List the files in /bin which begin with ‘m’

echo "Question 21"
echo "list files in /bin that starts with m"
ls /bin | grep '^m'

#Question 22:Downloads a DNA sequence and shows how many bases long is the sequence.
echo "Question 22"
wget https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa
#removes the sequence heading, remove spaces and count base length of the sequence.
echo "DNA sequence base length"
grep -v '^>' ~/Assessment/results/22_dna_sequence.fa | tr -d '\n' | wc -c

# Question 23: Downloads a DNA sequence, finds all the ORFs in the peptide sequence
echo "Question 23"
echo "Install Emboss"
sudo apt install emboss -y
#downloads dna sequence as a fasta document, saves it as 23_dna_sequence.fa
echo "downloading dna sequence"
wget -O 23_dna_sequence.fa "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa"
#translates the dna sequence to 6 possible reading frames
echo "translated DNA sequence in 6 possible reading frames"
transeq -sequence ~/Assessment/data/23_dna_sequence.fa -outseq ~/Assessment/results/23_peptides.fa -frame 6
cat ~/Assessment/results/23_peptides.fa
#counts the ORFs from M(methionine) and stops at stop codon(*)
echo "ORFs in the peptide sequences"
grep -oE 'M[^*]*\*' ~/Assessment/results/23_peptides.fa
grep -oE 'M[^*]*\*' ~/Assessment/results/23_peptides.fa | wc -l

#Question 24: Count the length of the longest amino acid in the translation of Question 23
echo "Question 24"
echo "Downloading DNA sequence"
wget -O 24_dna_sequence.fa "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa"
echo "Amino acids with the longest ORF"
grep -oE 'M[^*]*\*' ~/Assessment/results/23_peptides.fa | tr -d '\*' | wc -L

#Question 25:use head, sort, or tail to identify genes with the largest positive fold change
echo "Question 25"
#download file from website
echo "downloading csv file"
wget -O 25_table.csv  "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/table_01.csv"
echo "five genes with the largest positive fold change"
tail -n +2 ~/Assessment/data/25_table.csv > ~/Assessment/data/25_data.txt
sort -t, -k3,3nr ~/Assessment/data/25_data.txt > ~/Assessment/results/25_sorted.txt
head -5 ~/Assessment/results/25_sorted.txt | cut -d, -f1,3

#question 26: using head,sort, or tail to indentify genes with the largest negative fold
echo "Question 26"
echo "five genes with the largest negative fold-change" 
tail -n +2 ~/Assessment/data/25_table.csv > ~/Assessment/data/26_data.txt
sort -t, -k3,3n ~/Assessment/data/26_data.txt > ~/Assessment/results/26_sorted.txt
head -5 ~/Assessment/results/26_sorted.txt | cut -d, -f1,3

# Question 27:install csvkit 
echo "Question 27"
echo "Installing csvkit"
sudo apt install csvkit
echo "significantly expressed genes with the largest positive fold"
csvsql --tables genes --query "SELECT COUNT(*) FROM (SELECT padj FROM genes ORDER BY log2FoldChange DESC LIMIT 5)AS topgenes WHERE padj < 0.05" ~/Assessment/data/25_table.csv
echo "significantly expressed genes with the largest negative fold"
csvsql --tables genes --query "SELECT COUNT(*) FROM (SELECT padj FROM genes ORDER BY log2FoldChange ASC LIMIT 5) AS bottomgenes WHERE padj < 0.05" ~/Assessment/data/26_table.csv
 
echo "Question 28"
#installs csvkit
sudo apt install csvkit
# download Uniprot protein sequences 
#find the longest protein
for id in P69905 P68871 P02144 P01942
do 
        wget -q -O "$HOME/Assessment/data/$id.fasta" "https://rest.uniprot.org/uniprotkb/$id.fasta"
done

echo "protein lengths (amino acids):"
for file in *.fasta
do
        if grep -q '^>' "$file"; then
                length=$(grep -v '^>' "$file" | tr -d '\n\r' | wc -c)
                echo "${file%.fasta}: $length amino acids"
        fi
done


 
echo "Question 29"
#Question 29: Find the first Pubmed ID for the longest protein (P02144)
wget -O ~/Assessment/data/P02144.txt "https://rest.uniprot.org/uniprotkb/P02144.txt"
#Extract the first PubMed ID
grep -m 1 'PubMed=' ~/Assessment/data/P02144.txt > ~/Assessment/results/29_answer.txt
grep -m 1 'PubMed=' ~/Assessment/data/P02144.txt

echo "Question 30"
PMID=6571704
DATA_DIR="$HOME/Assessment/data"
mkdir -p "$DATA_DIR"

curl -fLsS "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=$PMID&rettype=abstract&retmode=text" -o "$DATA_DIR/question30_abstract.txt"

echo "Question 30: PubMed abstract"
cat "$DATA_DIR/question30_abstract.txt"
grep -i -A 2 -B 2 'purine-rich region'~/Assessment/data/question30_abstract.txt
echo "Answer to Question 30: 300 bp"

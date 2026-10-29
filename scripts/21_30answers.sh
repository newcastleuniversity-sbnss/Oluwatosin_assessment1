#!/bin/bash
#script for Questions 21-30
#Question 21: List the files in /bin which begin with ‘m’

echo "Question 21"
ls /bin | grep '^m'

#Question 22:Downloads a DNA sequence and shows how many bases long is the sequence.
echo "Question 22"
wget -O 22_dna_sequence.fa “https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa”
#removes the sequence heading, remove spaces and count base length of the sequence.
grep -v '^>' 22_dna_sequence.fa | tr -d '\n' | wc -c

# Question 23: Downloads a DNA sequence, finds all the ORFs in the peptide sequence
echo "Question 23"
#downloads dna sequence as a fasta document, saves it as 23_dna_sequence.fa
wget -O 23_dna_sequence.fa "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa"
#translates the dna sequence to 6 possible reading frames
transeq -sequence 23_dna_sequence.fa -outseq  23_peptides.fa -frame 6
#counts the ORFs from M(methionine) and stops at stop codon(*)
grep -oE 'M[^*]*\*' 23_peptides.fa | wc -l

#Question 24: Count the length of the longest amino acid in the translation of Question 23
echo "Question 24"

wget -O 24_dna_sequence.fa "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa"

grep -oE 'M[^*]*\*' 23_peptides.fa | tr -d '\*' | wc -L

#Question 25:use head, sort, or tail to identify genes with the largest positive fold change
echo "Question 25"
#download file from website
wget -O 25_table.csv  "https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/table_01.csv"
#
tail -n +2 25_table.csv > 25_data.txt
sort -t, -k3,3nr 25_data.txt > 25_sorted.txt
head -5 25_sorted.txt | cut -d, -f1,3
     26
•	tail -n +2 26_table.csv > 26_data.txt
•	sort -t, -k3,3n 26_data.txt > 26_sorted.txt
•	head -5 26_sortd.txt | cut -d, -f1,3
27
•	sudo apt install csvkit
•	csvsql --tables genes --query "SELECT COUNT(*) FROM (SELECT padj FROM genes ORDER BY log2FoldChange DESC LIMIT 5)AS topgenes WHERE padj < 0.05" 25_table.csv
•	csvsql --tables genes --query "SELECT COUNT(*) FROM (SELECT padj FROM genes ORDER BY log2FoldChange ASC LIMIT 5) AS bottomgenes WHERE padj < 0.05" 26_table.csv
28.
•	Q28.sh

# Author
Name: Oluwatosin Yekpogu
Course:  Mres Biomedical Informatics
Project: Bioinformatics for Biomedical Scientists MMB8052 Practical Assessment
Date: 30/10/2026

# Process
This project contains linux commands and bash scripts I used to complete my Assessment
My scripts are stored in the scripts directory, while downloaded files and generated outputs are stored in the data directory and results directory respectively
## Processes carried out:
Creating directories and files with various linux commands
Downloading DNA sequence data from Uniprot and provided websites
Information extraction using grep command
Documentation of files through Git and Github
## How to run the scripts
### change to the Scripts directory
cd ~/Assessment/scripts
### Run the single script to see all answers from question 21 to 30
bash 21_30answers.sh
# Data
The project uses biological data obtained from the assessment questions on canvas and some from public databases
Canvas Data url: https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/dna_to_translate.fa
                https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01
                https://raw.githubusercontent.com/sjcockell/mmb8052/main/assessments/assessment_01/table_01.csv
UNIPROT :  https://rest.uniprot.org/uniprotkb/$ID.fasta
Uniprot IDs:    P69905,P68871, P02144, P01942
NCBI    :  https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=$PMID&rettype=abstract&retm

# Software Use
linux Operating system (6.17.0-1019-aws)
Bash Shell (version 5.2.21(1)-release (x86_64-pc-linux-gnu))
Git (git version 2.43.0)
Nano Text Editor (version 7.2)
EMBOSS (6.6.0.0)
csvkit (csvformat 1.4.0)

#/usr/bin/env bash
#Author: sYc
#Date: 2021-03-04 16:33:27
#Version: 0.1
#Description: Download files by prefetch, through file: sra_list
#             Conver to fastq by fastq-dump, from sam-tools
#             Alignment by hisat2

source ~/.Scripts/render.sh

msg() {
  echo -e "${BRIGHT}${F_GREEN}==> ${1}${REST_ALL}"
}

declare -a SRA_LIST
for i in `cat sra_list`; do
  SRA_LIST=("${SRA_LIST[@]}" "${i}")
done


warring() {
cat << EOF


EOF
}

# Download sra files
mkdir -p res/sra
msg("CREAT directory 'res/sra'")

msg("Downloading '*.sra' into 'res/sra'")
prefetch -p -C yes --option-file sra_list -O res/sra/

msg("Collectong '*.sra'")
for i in ${SRA_LIST}; do
  mv res/sra/${i}/${i}.sra res/sra/
  rm -rf res/sra/${i}/
done


# Convert sra files to fastq files
mkdir -p res/fastq
msg("CREAT directory 'res/fastq'")

msg("Converting '*.sra' to '*.fastq.gz'")
for i in ${SRA_LIST}; do
  fastq-dump --split-3 res/sra/$i.sra -Fv --gzip -O res/fastq
done


# Building index file
msg("Building index")
GTF_FILE=`ls -l ref/ | grep '.gtf' | awk '{print $9}'`
extract_splice_sites.py ${GTF_FILE} > splice_sites.gft &
extract_exons.py ${GTF_FILE} > exons.gft &

mkdir -p ref/index
msg("CREAT directory 'ref/index'")

FA_FILE=`ls -l ref/ | grep '.fa' | awk '{print $9}'`
hisat2-build -p 8 --ss splice_sites.gtf --exon exons.gtf ${FA_FILE} genome 2>&1 | tee hisat2-build_log.log


mkdir -p res/sam
msg("CREAT directory 'res/sam'")

# Alignment to reference gene
msg("Aligning to refence gene sequence")
for i in ${SRA_LIST}; do
  hisat2 -t --new-summary -p 8 -x ref/index/ra_6.0 \
  -1 "res/fastq/${i}_1.fastq.gz" \
  -2 "res/fastq/${i}_2.fastq.gz" \
  -S "res/sam/${i}.sam" 2>&1 | tee "align-${i}.log"
done

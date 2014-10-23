## Fix Trinity Fastq Output

Trinity outputs fastq files that have been 'corrected'

Unfortunately these files are no longer properly paired and therefore can't be used in most aligners such as bowtie2 and snap

This script attempts to fix that and produce 2 properly paired fastq files and a fastq file containing single reads

version 1.0
Author: Chris Boursnell
cmb211@cam.ac.uk
# My snakefile
# Will run by default when we type 'snakemake'
rule all:
  input:
    "data/0Hour_001_1_fastqc.html",
    "data/6Hour_001_1_fastqc.html",
    "multiqc_report.html"

rule fastqc_a_file:
  input:
    "{filename}.fq.gz"
  output:
    "{filename}_fastqc.html",
    "{filename}_fastqc.zip"
  shell:
    "fastqc {input}"

rule run_multiqc:
  input:
    "data/0Hour_001_1_fastqc.html",
    "data/6Hour_001_1_fastqc.html",
  output:
    "multiqc_report.html",
    directory("multiqc_data")
  shell:
    "multiqc data/"
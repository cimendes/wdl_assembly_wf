# wdl_assembly_wf
A small workflow for the assembly of short-read illumina data

## workflow steps

1. Reads quality control with [fastp](https://github.com/OpenGene/fastp)
2. Assembly with [unicycler](https://github.com/rrwick/Unicycler)
3. Assembly quality assessment with [quast](https://github.com/ablab/quast)
4. Assembly taxonomic identification with [gambit](https://github.com/jlumpe/gambit)

## requirements

The following software is required to run wdl_assembly_wf

* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [miniwdl](https://miniwdl.readthedocs.io/en/latest/getting_started.html)

## usage

To run wdl_assembly_wf with miniwdl, just run the following command from the repo root:

`miniwdl run workflow/wf_assembly.wdl read1=<path to forward read> read2=<path to reverse read>`

To run with example data, you can run the following: 

`miniwdl run workflow/wf_assembly.wdl read1= test/reads/sample01_R1.fastq.gz read2= test/reads/sample01_R2.fastq.gz`

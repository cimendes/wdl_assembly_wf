version 1.0

task fastp {
  meta {
    # task metadata
    description: "Task to trim paired-end read data with fastp"
  }
  input {
    # task inputs
    File read1
    File read2
    String docker = "staphb/fastp:0.23.2"
    Int cpu = 4
    Int memory = 8
  }
  command <<<
    # code block executed
    fastp -i ~{read1} -I ~{read2} -o trimmed_1.fastq.gz -O trimmed_2.fastq.gz
  >>>
  output {
    # task outputs
    File read1_trimmed = "trimmed_1.fastq.gz"
    File read2_trimmed = "trimmed_2.fastq.gz"
  }
  runtime {
    # runtime environment
    docker: "~{docker}"
    memory: "~{memory} GB"
    cpu: cpu
    disks: "local-disk 50 SSD"
    preemptible: 0
  }
}

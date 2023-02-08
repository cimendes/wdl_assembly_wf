version 1.0

task unicycler {
  meta {
    # task metadata
    description: "Task to assemble paired-end read data with unicycler"
  }
  input {
    # task inputs
    File read1
    File read2
    String docker = "staphb/unicycler:0.5.0"
    Int cpu = 4
    Int memory = 16
    Int min_assembly_length = 1000
  }
  command <<<
    # code block executed
    unicycler -1 ~{read1} -2 ~{read2} -o . --min_fasta_length ~{min_assembly_length} \
    -t ~{cpu}
  >>>
  output {
    # task outputs
    File assembly = "assembly.fasta"
    File gfa = "assembly.gfa"
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

version 1.0

task quast {
  meta {
    # task metadata
    description: "Task to evaluate assemblies with quast"
  }
  input {
    # task inputs
    File assembly
    String docker = "staphb/quast:5.0.2"
    Int cpu = 4
    Int memory = 8
  }
  command <<<
    # code block executed
    quast.py ~{assembly} -o . 
  >>>
  output {
    # task outputs
    File quast_tsv = "report.tsv"
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

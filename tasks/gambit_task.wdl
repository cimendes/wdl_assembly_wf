version 1.0

task gambit {
  meta {
    # task metadata
    description: "Task to determine assembly taxonomy with gambit"
  }
  input {
    # task inputs
    File assembly
    String docker = "staphb/gambit:1.0.0"
    Int cpu = 4
    Int memory = 8
  }
  command <<<
    # code block executed
    gambit -d /gambit-db query -f csv -c ~{cpu} -o report.csv ~{assembly} 
  >>>
  output {
    # task outputs
    File gambit_csv = "report.csv"
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

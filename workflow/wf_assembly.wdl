version 1.0

# import block
import "../tasks/fastp_task.wdl" as fastp_task
import "../tasks/unicycler_task.wdl" as unicycler_task

workflow assembly_wf {
  input {
    # workflow inputs
    File read1
    File read2
  }
  # tasks and/or subworkflows to execute
  call fastp_task.fastp {
    input:
      read1 = read1,
      read2 = read2
   }
  call unicycler_task.unicycler {
    input:
      read1 = fastp.read1_trimmed,
      read2 = fastp.read2_trimmed
   }
  output {
    # workflow outputs (output columns in Terra data tables)
    File assembly = unicycler.assembly
    File gfa = unicycler.gfa
    }
}
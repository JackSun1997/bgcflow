if PATRIC == []:
    pass
else:
    rule patric_genome_download:
        output:
            fna = "data/interim/fasta/{patric}.fna",
        conda: 
            "../envs/prokka.yaml"
        log: "workflow/report/logs/{patric}/patric_download.log"
        shell:
            """
            (cd data/interim/fasta && wget -qN "ftp://ftp.patricbrc.org/genomes/{wildcards.patric}/{wildcards.patric}.fna" >> {log})
            """
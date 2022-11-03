if config["reduce_reads"]["reducing"]:

    rule samtools_sort:
        input:
            "results/mapped/{sample}.bam",
        output:
            temp("results/mapped/temp/{sample}.sorted.bam"),
        log:
            "logs/samtools/{sample}.log",
        params:
            extra="-m 4G",
        threads: 8
        wrapper:
            "v1.14.1/bio/samtools/sort"

    rule samtools_convert_tosam:
        input:
            "results/mapped/temp/{sample}.sorted.bam",
        output:
            temp("results/mapped/temp/{sample}.sorted.sam"),
        shell:
            "samtools view -h -o {output} {input}"

    rule reduce_reads:
        input:
            "results/mapped/temp/{sample}.sorted.sam",
        output:
            temp("results/mapped/{sample}.sorted.sam"),
        params:
            config["reduce_reads"]["parameters"]
        script:
            "../scripts/rremove_reads.py"
    
    rule samtools_convert_tobam:
        input:
            "results/mapped/{sample}.sorted.sam",
        output:
            "results/mapped/{sample}.sorted.bam",
        shell:
            "samtools view -bS {input} > {output}"
    
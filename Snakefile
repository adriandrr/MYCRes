# Copyright 2023 Adrian Doerr.
# Licensed under the BSD 2-Clause License (https://opensource.org/licenses/BSD-2-Clause)
# This file may not be copied, modified, or distributed
# except according to those terms.

configfile: "config/config.yaml"

pepfile: config["pepfile"]

include: "rules/common.smk"
include: "rules/qc.smk"
include: "rules/trimm.smk"
include: "rules/map_reads.smk"
include: "rules/reduce_reads.smk"
include: "rules/call_variants.smk"
include: "rules/create_antibiogram.smk"
include: "rules/create_depth_profile.smk"
include: "rules/create_html.smk"
include: "rules/create_report.smk"

rule all:
    input:
        "results/report.html"
// VEP

include { VCF_ANNOTATE_ENSEMBLVEP } from '../../nf-core/vcf_annotate_ensemblvep/main.nf'

workflow RUN_VEP {
    take:
    vcf               // channel: [mandatory] [ meta, vcf ]
    vep_genome        // channel: [mandatory] [ value ]
    vep_species       // channel: [mandatory] [ value ]
    vep_cache_version // channel: [mandatory] [ value ]
    vep_cache         // channel: [optionnal] [ path ]
    fasta             // channel: [optionnal] [ path ]
    vep_extra_files   // channel: [optionnal] [ path ]

    main:
    VCF_ANNOTATE_ENSEMBLVEP(vcf, vep_genome, vep_species, vep_cache_version, vep_cache, fasta, vep_extra_files)

    emit:
    json     = VCF_ANNOTATE_ENSEMBLVEP.out.json
    reports  = VCF_ANNOTATE_ENSEMBLVEP.out.reports
    tab      = VCF_ANNOTATE_ENSEMBLVEP.out.tab
    vcf_tbi  = VCF_ANNOTATE_ENSEMBLVEP.out.vcf_tbi
    versions = VCF_ANNOTATE_ENSEMBLVEP.out.versions

}

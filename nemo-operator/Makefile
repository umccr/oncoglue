# Check if .env file exists
ifeq ($(wildcard .env),)
$(error .env file not found. Execution halted. Please create one from .env.example)
endif

# Include the .env file
include .env

# ---

debug:
	@echo $(RUN_ID)
	@echo $(ONCOANALYSER_WGTS_DNA_SRC)
	@echo $(ONCOANALYSER_WGTS_DNA_DST)
	@echo $(TIDYWIGITS_IMAGE_URL):$(TIDYWIGITS_IMAGE_TAG)

.PHONY: dir
dir:
	@echo "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"
	@mkdir -p "./data/input"
	@mkdir -p "./data/output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)"

# sync only files tidywigits parses (~20 Mb)
sync: dir
	@aws s3 sync --no-progress $(ONCOANALYSER_WGTS_DNA_SRC) $(ONCOANALYSER_WGTS_DNA_DST) \
		--exclude "*" \
		--include "*alignments/*.duplicate_freq.tsv" \
		--include "*alignments/*md.metrics" \
		--include "*amber/amber.version" \
		--include "*amber/*.amber.contamination.tsv" \
		--include "*amber/*.amber.qc" \
		--include "*amber/*.amber.homozygousregion.tsv" \
		--include "*bamtools/*.wgsmetrics" \
		--include "*bamtools/*.bam_metric.coverage.tsv" \
		--include "*bamtools/*.bam_metric.exon_medians.tsv" \
		--include "*bamtools/*.bam_metric.flag_counts.tsv" \
		--include "*bamtools/*.bam_metric.frag_length.tsv" \
		--include "*bamtools/*.bam_metric.gene_coverage.tsv" \
		--include "*bamtools/*.bam_metric.partition_stats.tsv" \
		--include "*bamtools/*.bam_metric.summary.tsv" \
		--include "*chord/*mutation_contexts*" \
		--include "*chord/*prediction*" \
		--include "*chord/*signatures*" \
		--include "*cider/*.cider.blastn_match.tsv.gz" \
		--include "*cider/*.cider.locus_stats.tsv" \
		--include "*cider/*.cider.vdj.tsv.gz" \
		--include "*cobalt/cobalt.version" \
		--include "*cobalt/*.cobalt.gc.median.tsv" \
		--include "*cobalt/*.cobalt.ratio.pcf" \
		--include "*cobalt/*.cobalt.ratio.median.tsv" \
		--include "*cuppa/*.cuppa_data.tsv.gz" \
		--include "*cuppa/*.cuppa.pred_summ.tsv" \
		--include "*cuppa/*.cuppa.vis_data.tsv" \
		--include "*cuppa/*.cup.data.csv" \
		--include "*cuppa/*.cuppa.conclusion.txt" \
		--include "*.flagstat" \
		--include "*isofox/*.isf.alt_splice_junc.csv" \
		--include "*isofox/*.isf.fusions.csv" \
		--include "*isofox/*.isf.gene_collection.csv" \
		--include "*isofox/*.isf.gene_data.csv" \
		--include "*isofox/*.isf.pass_fusions.csv" \
		--include "*isofox/*.isf.retained_intron.csv" \
		--include "*isofox/*.isf.summary.csv" \
		--include "*isofox/*.isf.transcript_data.csv" \
		--include "*lilac/*.lilac.candidates.coverage.tsv" \
		--include "*lilac/*.lilac.qc.tsv" \
		--include "*lilac/*.lilac.tsv" \
		--include "*linx/*.linx.germline.breakend.tsv" \
		--include "*linx/*.linx.germline.clusters.tsv" \
		--include "*linx/*.linx.germline.disruption.tsv" \
		--include "*linx/*.linx.germline.driver.catalog.tsv" \
		--include "*linx/*.linx.germline.links.tsv" \
		--include "*linx/*.linx.germline.svs.tsv" \
		--include "*linx/*linx.version" \
		--include "*linx/*.linx.breakend.tsv" \
		--include "*linx/*.linx.clusters.tsv" \
		--include "*linx/*.linx.driver.catalog.tsv" \
		--include "*linx/*.linx.drivers.tsv" \
		--include "*linx/*.linx.fusion.tsv" \
		--include "*linx/*.linx.links.tsv" \
		--include "*linx/*.linx.neoepitope.tsv" \
		--include "*linx/*.linx.svs.tsv" \
		--include "*linx/*.linx.vis_copy_number.tsv" \
		--include "*linx/*.linx.vis_fusion.tsv" \
		--include "*linx/*.linx.vis_gene_exon.tsv" \
		--include "*linx/*.linx.vis_protein_domain.tsv" \
		--include "*linx/*.linx.vis_segments.tsv" \
		--include "*linx/*.linx.vis_sv_data.tsv" \
		--include "*neo/*.neo.neo_data.tsv" \
		--include "*neo/*.neo.neoepitope.tsv" \
		--include "*peach/*.peach.events.tsv" \
		--include "*peach/*.peach.gene.events.tsv" \
		--include "*peach/*.peach.haplotypes.all.tsv" \
		--include "*peach/*.peach.haplotypes.best.tsv" \
		--include "*peach/*.peach.qc.tsv" \
		--include "*purple/*.purple.cnv.gene.tsv" \
		--include "*purple/*.purple.cnv.somatic.tsv" \
		--include "*purple/*.purple.driver.catalog.germline.tsv" \
		--include "*purple/*.purple.driver.catalog.somatic.tsv" \
		--include "*purple/*.purple.germline.deletion.tsv" \
		--include "*purple/*.purple.purity.range.tsv" \
		--include "*purple/*.purple.purity.tsv" \
		--include "*purple/*.purple.qc" \
		--include "*purple/*.purple.somatic.clonality.tsv" \
		--include "*purple/*.purple.somatic.hist.tsv" \
		--include "purple/plot/*" \
		--exclude "purple/plot/*somatic_data.tsv" \
		--include "*purple/purple.version" \
		--include "*sage*/*.sage.bqr.tsv" \
		--include "*sage*/*.sage.exon.medians.tsv" \
		--include "*sage*/*.sage.gene.coverage.tsv" \
		--include "*sigs/*.sig.allocation.tsv" \
		--include "*sigs/*.sig.snv_counts.csv" \
		--include "*teal/*.teal.breakend.tsv.gz" \
		--include "*teal/*.teal.tellength.tsv" \
		--include "*virusbreakend/*.virusbreakend.vcf.summary.tsv" \
		--include "*virusinterpreter/*.virus.annotated.tsv"

pull:
	@docker compose pull

pwd:
	@docker compose run -q --rm tidywigits pwd

ls:
	@docker compose run -q --rm tidywigits ls -l
	@echo "------ input ------"
	@docker compose run -q --rm tidywigits ls input/
	@echo "------ output ------"
	@docker compose run -q --rm tidywigits ls output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID)

help:
	@echo "------ version ------"
	@docker compose run -q --rm tidywigits tidywigits.R --version
	@echo "------ help ------"
	@docker compose run -q --rm tidywigits tidywigits.R --help
	@echo "------ tidy help ------"
	@docker compose run -q --rm tidywigits tidywigits.R tidy --help

version: help

list:
	@docker compose run -q --rm tidywigits tidywigits.R list -f tsv -d ./input/$(RUN_ID)

tidy: dir
	@time docker compose run -q --rm tidywigits tidywigits.R tidy \
		-f parquet \
		-d ./input/$(RUN_ID) \
		-o ./output/tidywigits/$(TIDYWIGITS_IMAGE_TAG)/$(RUN_ID) \
		--ulid --prefix_include --input_id $(RUN_ID)

run: tidy

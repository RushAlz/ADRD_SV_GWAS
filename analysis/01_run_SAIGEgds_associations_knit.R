git.dir = "~/Github_scripts/ADRD_SV_GWAS/analysis/"

root.dir = "~/projects/sv_and_resilience/"
runID = "run_20230209"
data.dir = paste0(root.dir,runID,"/")

pheno_df = "~/projects/sv_and_resilience/20230209/ROSMAP_SV_4_association.RData"

load("~/resources/data2share/SV_pheno_list_Jul2024.RData")
pheno_list[pheno_list=="binomial"] <- "binary"
pheno_list[pheno_list=="gaussian" | pheno_list=="ordinal"] <- "quantitative"
table(pheno_list)

PARAMS = list( 
  ROS_SVs = list(geno_gds = "~/projects/sv_and_resilience/qced_data/ROS_SVs.gds",
                    pruned_gds = "~/projects/sv_and_resilience/qced_data/ROS_SVs.pruned.gds",
                    outdir = paste0(data.dir,"/ROS_SVs/"),
                    covariates = c("age_death","msex","educ","AncPC1","AncPC2","AncPC3","AncPC4","AncPC5")),
  MAP_SVs = list(geno_gds = "~/projects/sv_and_resilience/qced_data/MAP_SVs.gds",
                    pruned_gds = "~/projects/sv_and_resilience/qced_data/MAP_SVs.pruned.gds",
                    outdir = paste0(data.dir,"/MAP_SVs/"),
                    covariates = c("age_death","msex","educ","AncPC1","AncPC2","AncPC3","AncPC4","AncPC5"))  
  )

render_report = function(geno_gds = "~/projects/sv_and_resilience/qced_data/ROS_SNPs.gds",
                         pruned_gds = "~/projects/sv_and_resilience/qced_data/ROS_SNPs.pruned.gds",
                         pheno_df = "~/projects/sv_and_resilience/20230209/ROSMAP_SV_4_association.RData",
                         outdir = "~/projects/sv_and_resilience/20230209/ROS_only/",
                         outcome = "amyloid_sqrt",
                         family = "quantitative",
                         covariates = '["age_death","msex","educ","AncPC1","AncPC2","AncPC3","AncPC4","AncPC5"]',
                         runID = "run_20230209",
                         data.dir = "~/projects/sv_and_resilience/",
                         html_out = paste0(git.dir,"/reports/Report_", outcome, ".html"),
                         force = F) {

  # Check if file already exist
  if((file.exists(html_out) & force) | (!file.exists(html_out))){
    print(html_out)
    rmarkdown::render(
      paste0(git.dir,"/01_run_SAIGEgds_associations_template.Rmd"), params = list(
        geno_gds = geno_gds,
        pruned_gds = pruned_gds,
        pheno_df = pheno_df,
        outdir = outdir,
        outcome = outcome,
        family = family,
        covariates = covariates,
        runID = runID,
        data.dir = data.dir
      ), output_file = html_out)
  }
}

## Parallel run
library(doParallel)
registerDoParallel(1)

for(j in 1:length(PARAMS)){
  geno_gds = PARAMS[[j]]$geno_gds
  pruned_gds = PARAMS[[j]]$pruned_gds
  outdir = PARAMS[[j]]$outdir
  covariates = PARAMS[[j]]$covariates
  report_folder = paste0(git.dir,"/reports/",names(PARAMS)[j])
  system(paste0("mkdir -p ", report_folder))
  
  res = foreach(i = 1:length(pheno_list), .combine=rbind) %dopar% {
    outcome = names(pheno_list)[i]
    family = pheno_list[i]
    html_out = paste0(report_folder,"/Report_", outcome, ".html")
    print(paste(geno_gds,outcome))
    render_report(geno_gds = geno_gds, pruned_gds = pruned_gds, outdir = outdir, covariates = covariates,
                  outcome = outcome, family = family, 
                  pheno_df = pheno_df, runID = runID, data.dir = data.dir,
                  html_out = html_out,
                  force = F)
  }
}

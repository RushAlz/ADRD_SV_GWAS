# SV GWAS with AD/ADRD traits

------------------------------------------------------------------------

### Analysis results

Here, you will find the summary statistics results for the single variant associations and meta-analysis.

| File                                                                                                                                 | Description                                                    |
|:-------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------|
| [MAP_association_results.tsv.gz](https://github.com/RushAlz/ADRD_SV_GWAS/tree/main/results/MAP_association_results.tsv.gz)           | Full summary statistics for SV-trait association in MAP cohort |
| [ROS_association_results.tsv.gz](https://github.com/RushAlz/ADRD_SV_GWAS/tree/main/results/ROS_association_results.tsv.gz)           | Full summary statistics for SV-trait association in ROS cohort |
| [ROSMAP_meta_analysis_results.tsv.gz](https://github.com/RushAlz/ADRD_SV_GWAS/tree/main/results/ROSMAP_meta_analysis_results.tsv.gz) | Full summary statistics for the meta-analysis                  |

------------------------------------------------------------------------

### Files Description

> #### Single cohort association results

| Column         | Description                                           |
|:---------------|:------------------------------------------------------|
| *ID*           | SV ID (ROSMAP)                                        |
| *sv_info*      | SV information (position, length, and MAF)            |
| *closest_gene* | Closest gene                                          |
| *Estimate*     | Slope of the association                              |
| *Std. Error*   | Standard error                                        |
| *pval*         | Nominal *P*-value                                     |
| *bonf*         | FDR adjusted *P*-value (within each phenotype)        |
| *fdr*          | Bonferroni adjusted *P*-value (within each phenotype) |
| *pheno*        | Variable name of the phenotype tested                 |
| *LD*           | rsID and R2                                           |
| *snv_chr*      | SNV chromosome                                        |
| *snv_pos*      | SNV position in the chromosome                        |
| *r2*           | LD R2                                                 |
| *snv_id*       | rsID                                                  |

------------------------------------------------------------------------

> #### Meta-analysis results

| Column         | Description                                                                       |
|:---------------|:----------------------------------------------------------------------------------|
| *ID*           | SV ID (ROSMAP)                                                                    |
| *sv_info*      | SV information (position, length, and MAF)                                        |
| *closest_gene* | Closest gene                                                                      |
| *#STUDY*       | number of studies included in the meta-analysis                                   |
| *PVALUE_FE*    | *P*-value of the fixed-effects model (FE) according to METASOFT                   |
| *BETA_FE*      | Estimated Beta under the fixed-effects model according to METASOFT                |
| *STD_FE*       | Standard error of BETA_FE                                                         |
| *PVALUE_RE*    | *P*-value of the random effects model (RE) according to METASOFT                  |
| *BETA_RE*      | Estimated Beta under the random-effects model (RE) according to METASOFT          |
| *STD_RE*       | Standard error of BETA_RE                                                         |
| *PVALUE_RE2*   | *P*-value of the Han and Eskin's Random Effects model (RE2) according to METASOFT |
| *STAT1_RE2*    | RE2 statistic mean effect part                                                    |
| *STAT2_RE2*    | RE2 statistic heterogeneity part                                                  |
| *PVALUE_BE*    | BE P-value ("NA" in all row, binary_effects option is not used)                   |
| *I_SQUARE*     | I-square heterogeneity statistic                                                  |
| *Q*            | Cochran's Q statistic                                                             |
| *PVALUE_Q*     | Cochran's Q statistic's *P*-value                                                 |
| *TAU_SQUARE*   | Tau-square heterogeneity estimator of DerSimonian-Laird                           |
| *pheno*        | Variable name of the phenotype tested                                             |
| *category*     | Phenotype category                                                                |
| *description*  | Phenotype name                                                                    |
| *LD*           | rsID and R2                                                                       |
| *snv_chr*      | SNV chromosome                                                                    |
| *snv_pos*      | SNV position in the chromosome                                                    |
| *r2*           | LD R2                                                                             |
| *snv_id*       | rsID                                                                              |

------------------------------------------------------------------------

### Reference

**"Structural variants linked to Alzheimer's Disease and other common age-related clinical and neuropathologic traits"** [(medRxiv, 2024)](https://doi.org/10.1101/2024.08.12.24311887)

| *Ricardo A Vialle, Katia de Paiva Lopes, Yan Li, Bernard Ng, Julie A Schneider, Aron S Buchman, Yanling Wang, Jose M Farfel, Lisa L Barnes, Aliza P Wingo, Thomas S Wingo, Nicholas Seyfried, Phillip L De Jager, Chris Gaiteri, Shinya Tasaki, David A Bennett*

------------------------------------------------------------------------

Distributed under terms of the [GNU GENERAL PUBLIC LICENSE](/LICENSE).

## Analysis for all districts

render_analysis_all_dist <- function(para1,para2){
  rmarkdown::render("ex_para.Rmd", params = list(
    dist = para1,
    sch_pri = para2
    ),
    output_file = paste("District-level-analysis",
                        para1,"-",para2,".html",
                        sep= "")
  )
}

readr::read_csv("clean_gujarat_vd.csv") -> data_vill_census

vec_dist = unique(data_vill_census$district_name)

vec_sch_pri_1 = rep(1,26)

vec_sch_pri_2 = rep(2,26)


purrr::map2(.x = vec_dist,.y = vec_sch_pri_1,.f = render_analysis_all_dist)


purrr::map2(.x = vec_dist,.y = vec_sch_pri_2,.f = render_analysis_all_dist)

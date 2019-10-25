library(tidyverse)
library(here)

despesa_anual_2018 <- read.csv("data/despesa_anual_2018_PB.csv", sep = ";")
  
despesa_anual_2017 <- read.csv("data/despesa_anual_2017_PB.csv", sep = ";")

normaliza_df <- function(despesas_df, ano_df) {
  despesas <- despesas_df %>% 
    select(data_geracao = DT_GERACAO,
           sigla_partido = SG_PARTIDO,
           nome_partido = NM_PARTIDO,
           sigla_uf = SG_UF,
           valor_gasto = VR_GASTO,
           valor_pagamento = VR_PAGAMENTO,
           valor_documento = VR_DOCUMENTO,
           descricao_fornecedor = DS_TP_FORNECEDOR,
           cod_documento = CD_TP_DOCUMENTO,
           ano = ano_df)
  
  return(despesas)
}

despesas_2018 <- normaliza_df(despesa_anual_2018, 2018)
despesa_2017 <- normaliza_df(despesa_anual_2017, 2017)

bind_rows(despesas_2018, despesa_2017)
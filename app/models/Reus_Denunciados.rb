class ReusDenunciados

  def self.lista_reus_denunciados
    conn = MaspDB.connection

    reus = conn.select_all "select cprm.cprm_dsc_grupo_vara, cprm.cprm_dsc_vara, cprm.cprm_dsc_tipo_processo, cprm.cprm_dsc_processo,
       cprm.cprm_dsc_situacao_processo, cprm.cprm_nom_pessoa_reu, cprm.cprm_dsc_assunto,
       case
         when cprm.cprm_dat_oferecimento_denuncia is not null and cprm.cprm_dat_recebimento_denuncia is null and
              cprm.cprm_dat_citacao is null and cprm.cprm_dat_defesa_preliminar is null and
              cprm.cprm_dat_inicio_instrucao is null and cprm.cprm_dat_fim_instrucao is null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_oferecimento_denuncia,
       case
         when cprm.cprm_dat_recebimento_denuncia is not null and
              cprm.cprm_dat_citacao is null and cprm.cprm_dat_defesa_preliminar is null and
              cprm.cprm_dat_inicio_instrucao is null and cprm.cprm_dat_fim_instrucao is null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_recebimento_denuncia,
       case
         when cprm.cprm_dat_citacao is not null and cprm.cprm_dat_defesa_preliminar is null and
              cprm.cprm_dat_inicio_instrucao is null and cprm.cprm_dat_fim_instrucao is null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_citacao,
       case
         when cprm.cprm_dat_defesa_preliminar is not null and
              cprm.cprm_dat_inicio_instrucao is null and cprm.cprm_dat_fim_instrucao is null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_defesa_preliminar,
       case
         when cprm.cprm_dat_inicio_instrucao is not null and cprm.cprm_dat_fim_instrucao is null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_inicio_instrucao,
       case
         when cprm.cprm_dat_fim_instrucao is not null and
              cprm.cprm_dat_memoriais_acusacao is null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_fim_instrucao,
       case
         when cprm.cprm_dat_memoriais_acusacao is not null and cprm.cprm_dat_memoriais_defesa is null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_memoriais_acusacao,
       case
         when cprm.cprm_dat_memoriais_defesa is not null and
              cprm.cprm_dat_sentenca is null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_memoriais_defesa,
       case
         when cprm.cprm_dat_sentenca is not null and cprm.cprm_dat_transito  is null then 1
         else 0
       end qtd_sentenca,
       case
         when cprm.cprm_dat_transito is not null then 1
         else 0
       end qtd_transito
from dwfcb.tcprm_ciclo_processo_reu_masp cprm
where cprm.cprm_num_ciclo = 1
  and cprm.cprm_cod_vara <> 36 --12ª Vara Criminal
  and cprm.cprm_dat_inicio_execucao is null
  and (cprm.cprm_dat_oferecimento_denuncia is not null
    or cprm.cprm_dat_recebimento_denuncia is not null)
order by cprm.cprm_dsc_grupo_vara, cprm.cprm_dsc_vara, cprm.cprm_nom_pessoa_reu"

  @lista_reus = reus

  return @lista_reus

  end

end

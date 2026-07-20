# Fontes, evidências e limites

Este documento evita que pesquisas externas sejam transformadas em promessas sem contexto.

| Tema | Fonte | Como usar |
|---|---|---|
| Jornada automotiva premium | Google/Nielsen: https://www.thinkwithgoogle.com/_qs/documents/3062/9e9da_Auto_Path_to_purchase_Nielsen_premium_segment.pdf | Sustenta prioridade digital; registrar país, período e amostra ao citar números. |
| Jornada automotiva | Google Dealer Guidebook: https://www.thinkwithgoogle.com/_qs/documents/10856/EXTERNAL_Dealer_Guidebook_2.5_TwG_Portrait_dxolPd1.pdf | Referência estratégica, não meta garantida para a Vértice. |
| Desempenho | https://web.dev/articles/vitals | Fonte normativa para LCP, INP e CLS. |
| Segurança de dados | https://supabase.com/docs/guides/database/postgres/row-level-security | Base técnica para RLS e autorização no banco. |
| SEO automotivo | https://schema.org/Car e https://schema.org/Offer | Vocabulário para dados estruturados. |
| Otimização de imagens | https://nextjs.org/docs/app/getting-started/images | Orientação técnica para dimensões, carregamento e otimização. |

## Afirmações do relatório original que exigem validação

- “80% do tempo total de decisão”: não usar como fato até localizar estudo, mercado, amostra e período.
- “12% mais rápido”: transformar em meta somente após linha de base e definição da métrica.
- “redução de 51% em problemas operacionais”: não publicar nem usar em decisão sem fonte verificável.
- “implantação imediata” de VIN, SDR, Data Lake e DRE: reclassificada no roadmap conforme dependências, risco e governança.
- Caroline Luxury Serif/Regasto: verificar licença comercial, performance e disponibilidade antes de adoção. Usar fallback editorial licenciado.

## Regra para novas fontes

Registrar URL, organização, data, amostra/mercado, afirmação apoiada, limitações e data de acesso. Preferir documentação oficial, pesquisa primária e dados próprios.


## Relatório Técnico – Arquitetura e Diretrizes de Desenvolvimento

Documento fornecido pelo responsável do produto em 20/07/2026 e incorporado como fonte interna de requisitos.

### Pontos aceitos

- Next.js/TypeScript, Vercel, Supabase, Auth, Storage e RLS;
- cadastro automotivo detalhado;
- gestão de catálogos, imagens, usuários, leads e auditoria;
- pipeline comercial, dashboards, SEO e práticas de desempenho;
- rate limit, backups, logs e controle de permissões.

### Ajustes de interpretação

- Tailwind CSS é uma opção, não obrigação arquitetural; adotar somente se trouxer consistência sem migração cosmética desnecessária.
- “Todo conteúdo no banco” não inclui código, componentes, contratos, traduções estáveis ou conteúdo versionado que faça mais sentido no repositório.
- Lighthouse acima de 90 é meta de laboratório e não substitui Core Web Vitals reais.
- “Sem necessidade de reescrever” foi convertido em baixo acoplamento, contratos claros e evolução por migrations; nenhuma arquitetura elimina reescritas futuras.
- Renavam, placa, VIN, documentos e dados financeiros foram classificados como restritos.
- “Excluir veículo” prioriza arquivamento/exclusão lógica para preservar auditoria e relações.

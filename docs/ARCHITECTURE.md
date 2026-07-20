# Arquitetura e Guardrails

## Visão geral

```text
Cliente -> apps/site -> Supabase
Equipe  -> apps/admin -> Supabase Auth + RLS
                     -> Postgres (estoque, leads, financiamento, auditoria)
                     -> Storage (imagens)
```

O Supabase é a fonte única de verdade. O site público lê somente estoque publicado. O Admin lê e altera dados conforme função e status.

## Domínios

- **Identidade:** `auth.users` + `profiles`; status pending/active/blocked; roles admin/manager/agent.
- **Estoque:** veículos, imagens, opcionais, especificações, publicação e histórico.
- **CRM:** lead, origem, consentimento, etapa, responsável, atividades e tarefas.
- **Financiamento:** solicitação e acompanhamento; nunca armazenar documento sensível sem revisão jurídica e técnica.
- **Conteúdo:** ofertas, localização, páginas institucionais e SEO.
- **Analytics:** eventos definidos e pseudonimizados; DRE/Data Lake somente após governança.

## Fronteiras de segurança

- A chave publishable pode ir ao cliente; `service_role` é apenas servidor seguro.
- RLS é obrigatória. Referência: https://supabase.com/docs/guides/database/postgres/row-level-security
- Uploads devem validar tipo, tamanho, proprietário e caminho.
- Operações privilegiadas devem usar funções/rotas de servidor e registrar auditoria.
- Não colocar CPF, renda, documentos ou conversas em analytics.
- Adequação à LGPD, retenção, consentimento e atendimento de direitos precisam de validação jurídica antes de produção.

## Imagens

Pipeline desejado:

1. upload original privado;
2. validação de formato e tamanho;
3. derivados otimizados;
4. possível remoção/padronização de fundo;
5. revisão humana obrigatória;
6. publicação com texto alternativo e ordem definida.

IA não pode “embelezar” o estado do veículo. Originais devem ser preservados para auditoria.

## VIN

A integração VIN não deve ser simulada. Antes de implementar:

- escolher provedor com cobertura brasileira e contrato de uso;
- definir campos confiáveis e fallback manual;
- registrar origem e data da consulta;
- exigir revisão humana antes da publicação;
- nunca expor o VIN completo publicamente sem necessidade aprovada.

## WhatsApp/SDR

Usar API oficial e templates aprovados. O bot deve se identificar, registrar consentimento, permitir atendimento humano e guardar resumo/resultado, não uma cópia irrestrita de dados pessoais.

## Desempenho

Core Web Vitals oficiais: https://web.dev/articles/vitals

Metas de campo no percentil 75:

- LCP <= 2,5 s;
- INP <= 200 ms;
- CLS <= 0,1.

Priorizar cache, streaming quando útil, fontes com estratégia de carregamento, imagens responsivas e JavaScript mínimo.

## SEO

Cada veículo publicado deve possuir:

- URL canônica estável;
- metadata única e compartilhamento social;
- sitemap e robots coerentes;
- JSON-LD com `Car`, `Offer` e vendedor;
- conteúdo factual renderizável;
- redirecionamento ou estado indisponível ao sair do estoque.

Referências: https://schema.org/Car e https://schema.org/Offer


## Catálogos e histórico

Marcas, modelos, categorias e opcionais devem ser entidades normalizadas quando precisarem de gestão própria, reutilização ou filtros. Evitar texto livre duplicado.

Mudanças relevantes em veículos, leads, usuários e financiamento devem gerar eventos ou registros históricos com ator, instante, estado anterior/novo e motivo. Exclusão lógica/arquivamento é preferível para entidades relacionadas a operação e auditoria.

## Analytics e métricas

Eventos mínimos: visualização de veículo, busca, filtro, compartilhamento, clique em WhatsApp/telefone, envio de formulário, agendamento, proposta e resultado comercial.

Eventos devem ter nomes e propriedades versionados. Definir consentimento, retenção, pseudonimização e deduplicação antes de coletar. Toda métrica de dashboard precisa de fórmula e fonte documentadas.

## Confiabilidade

- rate limit em login, formulários e endpoints públicos;
- idempotência para evitar leads/solicitações duplicadas;
- observabilidade de erros e ações sensíveis;
- estratégia de backup e teste de restauração;
- ambientes separados de desenvolvimento/preview/produção;
- migrations progressivas e compatíveis com rollback ou correção subsequente.

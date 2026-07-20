# Requisitos Funcionais e Não Funcionais

Este documento consolida requisitos aprovados a partir dos relatórios de produto. Ele detalha **o que** o sistema deve oferecer; `ARCHITECTURE.md` define os guardrails de implementação e `ROADMAP.md` define a ordem.

## Classificação

- **Obrigatório:** necessário para a operação inicial.
- **Planejado:** aprovado, mas depende de uma fase posterior.
- **Condicionado:** depende de fornecedor, governança, base legal ou validação.
- **Hipótese:** precisa de medição antes de virar compromisso.

## Showroom público

### Obrigatório

- página inicial, estoque e página individual por veículo;
- pesquisa por texto, filtros e ordenação;
- compartilhamento;
- solicitação de contato, avaliação do usado e financiamento;
- WhatsApp com origem e veículo preservados;
- agendamento de visita/test-drive;
- estados de indisponibilidade sem apagar histórico/URL;
- SEO individual, Open Graph, canonical, sitemap, robots, alt text e JSON-LD;
- interface responsiva, acessível e rápida.

### Planejado

- favoritos vinculados ao usuário ou dispositivo;
- envio de proposta;
- tour 360º, hotspots e recomendações.

## Estoque e cadastro automotivo

### Campos essenciais

- marca, modelo, versão;
- ano de fabricação e ano-modelo;
- preço e quilometragem;
- cor, combustível, câmbio;
- motor e potência quando confirmados;
- garantia e número de proprietários quando confirmados;
- descrição, itens de série e opcionais;
- status, destaque, data de publicação;
- capa, galeria e vídeo;
- origem e data dos dados técnicos.

### Dados restritos

Placa, Renavam, VIN/chassi e laudos não são campos públicos por padrão. Armazenamento, mascaramento, retenção e acesso exigem finalidade aprovada e política de segurança.

### Estados

O fluxo deve suportar:

`draft -> available -> negotiating -> reserved -> sold`

Também deve existir `hidden` para retirada temporária. Somente `available` aparece normalmente no showroom. Transições devem registrar usuário, data e motivo quando aplicável.

### Administração

- cadastrar, editar, duplicar e arquivar veículo;
- exclusão definitiva apenas com permissão e confirmação, preferindo arquivamento;
- ordenar fotos e definir capa;
- gerenciar marcas, modelos, categorias e opcionais sem duplicidade;
- pré-visualizar antes de publicar;
- manter histórico de alterações.

## CRM e leads

Cada lead deve registrar:

- nome, telefone, e-mail quando informado;
- veículo e mensagem;
- origem, campanha e parâmetros de atribuição quando disponíveis;
- consentimento e data;
- responsável;
- status, observações, atividades e próximo passo;
- datas de criação, primeiro contato e última movimentação.

Pipeline padrão:

`new -> contacted -> visit_scheduled -> negotiating -> proposal_sent -> won | lost`

Mudanças de etapa devem ser históricas, não apenas sobrescrever um campo. Motivo de perda deve ser estruturado.

## Financiamento

Registrar intenção e andamento com coleta mínima de dados. Não coletar CPF, documentos, renda detalhada ou dados bancários no front-end sem revisão jurídica, segurança apropriada e fornecedor definido. O sistema não toma decisão de crédito.

## Usuários e permissões

- Administrador: configurações, papéis, usuários e todas as operações.
- Gerente: operação, aprovação/bloqueio permitido e indicadores; não promove administrador sem regra explícita.
- Vendedor/Atendente: estoque permitido, leads atribuídos e atividades.
- Editor: conteúdo/estoque, sem dados comerciais sensíveis.
- Visitante: não é perfil do Admin; representa acesso público.

Todo usuário administrativo começa pendente, utiliza e-mail/senha pelo Supabase Auth e precisa ser ativado. RLS é obrigatória.

## Dashboard

Indicadores aprovados, desde que tenham definição e fonte:

- veículos totais, disponíveis, em negociação, reservados e vendidos;
- leads do dia/mês e por etapa;
- origem dos leads;
- veículos mais visualizados e com mais ações;
- cliques em WhatsApp e telefone;
- buscas, filtros e compartilhamentos;
- agendamentos, propostas e vendas;
- conversão por veículo/campanha;
- tempo até primeiro contato e tempo médio no estoque.

Cada indicador precisa documentar fórmula, janela, timezone, filtros e tratamento de duplicidade.

## Desempenho e qualidade

### Metas principais

Dados reais no percentil 75:

- LCP <= 2,5 s;
- INP <= 200 ms;
- CLS <= 0,1.

### Diagnóstico

Lighthouse >= 90 em Performance, Accessibility, Best Practices e SEO é uma meta de laboratório para rotas representativas, não substitui Core Web Vitals de campo.

### Práticas

- imagens responsivas e otimizadas;
- lazy loading fora da primeira dobra;
- dimensões reservadas;
- cache e consultas seletivas;
- Server Components quando reduzirem JavaScript e complexidade;
- evitar requisições e bibliotecas desnecessárias.

## Segurança e confiabilidade

- validação no servidor/banco;
- RLS e menor privilégio;
- queries parametrizadas;
- saída escapada e sanitização quando necessária;
- proteção CSRF quando o modelo de autenticação exigir;
- rate limit em autenticação, formulários e endpoints abusáveis;
- logs de auditoria sem segredos;
- backup e teste periódico de restauração;
- tratamento de erros e monitoramento;
- proteção contra duplicidade e idempotência em ações críticas.

## Escalabilidade

Aplicativo mobile, múltiplas lojas, marketplace, CRM/ERP, integrações financeiras, IA e APIs externas são direções possíveis. A arquitetura deve reduzir acoplamento e preservar contratos, mas nenhuma solução promete crescimento “sem reescrita”. Evolução controlada e migrations são esperadas.

# Roadmap orientado a valor

## Agora — fundação operacional

- [ ] concluir configuração de ambientes e deploy;
- [ ] cadastrar primeiro administrador e validar aprovação de usuários;
- [ ] CRUD completo de veículos com versão, ano-modelo, especificações confirmadas, duplicação, arquivamento e auditoria;
- [ ] Storage de imagens com ordenação, capa, originais preservados e otimização;\n- [ ] catálogos gerenciáveis de marcas, modelos, categorias e opcionais;\n- [ ] estados draft/available/negotiating/reserved/sold/hidden com histórico;
- [ ] página individual de veículo;
- [ ] formulários reais de interesse, avaliação e financiamento;
- [ ] central de leads com pipeline new/contacted/visit_scheduled/negotiating/proposal_sent/won/lost, responsável, notas, tarefas e histórico;
- [ ] estados de loading, vazio, erro e sucesso;
- [ ] revisão mobile, acessibilidade, SEO e Core Web Vitals;
- [ ] testes de RLS para público, atendente, editor, gerente e administrador;\n- [ ] rate limit, idempotência de formulários, auditoria e teste de restauração de backup;

## Próximo — conversão e conteúdo

- [ ] agendamento de visita/test-drive;
- [ ] páginas de ofertas e campanhas;
- [ ] segmentação PCD/CNPJ baseada em oferta confirmada;
- [ ] integração oficial com WhatsApp;
- [ ] funil e eventos versionados de analytics com origem/campanha e definições de métricas;\n- [ ] dashboard de estoque, leads, origem, conversão, tempo de resposta e tempo no estoque;
- [ ] importação VIN com provedor aprovado;
- [ ] pipeline revisável de estúdio virtual;
- [ ] exportação de relatórios.

## Depois — inteligência e escala

- [ ] SDR assistido por IA com transferência humana;
- [ ] recomendação de veículos com explicação;
- [ ] Data Lake após definição de governança;
- [ ] DRE após validação contábil e das fontes;
- [ ] tour 360º e hotspots;
- [ ] integrações com marketplaces e sistemas financeiros.

## Critérios de entrada

Um item só entra em desenvolvimento quando tiver responsável, objetivo, dados necessários, risco de privacidade, critério de aceite e métrica.

## Critérios de saída

- comportamento testado;
- permissão/RLS verificada;
- telemetria definida quando aplicável;
- responsividade e acessibilidade revisadas;
- documentação atualizada;
- nenhuma afirmação comercial sem evidência.

## Registro de decisões

Decisões irreversíveis ou de alto custo devem ser registradas em `docs/decisions/` no formato ADR: contexto, opções, decisão e consequências.

# Roadmap orientado a valor

## Agora — fundação operacional

- [ ] concluir configuração de ambientes e deploy;
- [ ] cadastrar primeiro administrador e validar aprovação de usuários;
- [ ] CRUD completo de veículos com edição, exclusão segura e auditoria;
- [ ] Storage de imagens com ordenação, capa e otimização;
- [ ] página individual de veículo;
- [ ] formulários reais de interesse, avaliação e financiamento;
- [ ] central de leads com responsável, notas, tarefas e histórico;
- [ ] estados de loading, vazio, erro e sucesso;
- [ ] revisão mobile, acessibilidade, SEO e Core Web Vitals;
- [ ] testes de RLS para público, atendente, gerente e administrador.

## Próximo — conversão e conteúdo

- [ ] agendamento de visita/test-drive;
- [ ] páginas de ofertas e campanhas;
- [ ] segmentação PCD/CNPJ baseada em oferta confirmada;
- [ ] integração oficial com WhatsApp;
- [ ] funil e eventos de analytics;
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

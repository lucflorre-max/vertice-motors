# Vértice Motors — instruções para IA

Siga `AGENTS.md` como regra principal e leia os documentos em `docs/`.

- Responda e escreva textos de interface em português do Brasil.
- Preserve o monorepositório: site público em `apps/site`, painel em `apps/admin`, contratos em `packages/core` e banco em `supabase/migrations`.
- Prefira TypeScript estrito, componentes pequenos e funções com nomes ligados ao domínio.
- Use Supabase como fonte única de verdade. Não simule persistência com `localStorage`.
- Nunca use a chave `service_role` no cliente.
- Toda nova tabela requer RLS, índices adequados e migration.
- Não confunda autenticação com autorização; sempre confira perfil, função e status.
- Trate estoque, leads, solicitações e usuários como dados reais: estados de loading, vazio, erro e sucesso são obrigatórios.
- Não invente métricas. Instrumente antes de afirmar ganho.
- Preserve responsividade, acessibilidade e desempenho.
- Antes de concluir, rode os comandos de validação disponíveis no repositório e descreva qualquer limitação.

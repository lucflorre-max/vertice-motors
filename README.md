# Vértice Motors

Plataforma completa para uma revenda de veículos, organizada em um monorepositório.

- `apps/site`: catálogo público, captura de leads, avaliação e financiamento.
- `apps/admin`: painel protegido para estoque, leads, financiamentos e usuários.
- `packages/core`: cliente Supabase e tipos compartilhados.
- `supabase/migrations`: banco, permissões e automações.

## Configuração

1. Crie um projeto no Supabase.
2. Execute `supabase/migrations/001_initial.sql` no SQL Editor.
3. Copie `.env.example` para `apps/site/.env.local` e `apps/admin/.env.local`.
4. Preencha a URL e a chave pública do Supabase.
5. Execute `npm install`.
6. Use `npm run dev:site` e `npm run dev:admin`.

O primeiro administrador deve ser promovido manualmente no Supabase após criar a conta:

```sql
update public.profiles
set role = 'admin', status = 'active'
where email = 'email-do-administrador';
```

Nunca coloque a chave `service_role` em aplicações web ou no GitHub.

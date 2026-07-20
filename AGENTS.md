# Instruções para agentes de programação

## Missão

Evoluir a Vértice Motors como um ecossistema de varejo automotivo digital premium, confiável, rápido e orientado à conversão. O produto tem dois aplicativos interligados:

- `apps/site`: showroom público, descoberta, confiança e geração de oportunidades.
- `apps/admin`: cockpit de gestão, estoque, leads, financiamento, usuários e indicadores.
- `packages/core`: contratos e integração compartilhada.
- `supabase`: autenticação, banco, RLS, storage e migrations.

Leia também `docs/PRODUCT_VISION.md`, `docs/REQUIREMENTS.md`, `docs/ARCHITECTURE.md` e `docs/ROADMAP.md` antes de propor mudanças relevantes.

## Regras inegociáveis

1. Não invente dados comerciais, jurídicos, financeiros, especificações de veículo, VIN, preços, métricas ou depoimentos.
2. Diferencie requisito confirmado, hipótese e ideia futura. Hipóteses precisam de instrumentação e validação.
3. Nunca exponha `service_role`, senhas ou segredos no navegador, log, commit ou documentação.
4. Toda tabela exposta pelo Supabase deve ter RLS. Autorização deve ser aplicada no banco, não apenas escondida na interface.
5. Usuários do Admin começam como `pending`. Somente administradores/gerentes autorizados ativam contas. Apenas administrador altera papéis críticos.
6. Toda alteração de schema deve ser uma migration versionada e revisável. Nunca editar produção manualmente sem registrar a migration equivalente.
7. O site público só mostra veículos `available`. Alterações no Admin devem refletir no showroom sem duplicar fontes de verdade.
8. Mobile-first: nenhuma entrega está pronta sem verificação em 360 px, 768 px e desktop.
9. Preserve acessibilidade: HTML semântico, teclado, foco visível, contraste, labels, mensagens de erro e redução de movimento.
10. Otimize imagens automotivas sem ocultar defeitos do veículo. IA pode padronizar fundo/luz, mas não pode alterar cor, rodas, avarias, acessórios ou condição real.
11. Recursos de IA conversacional, VIN, DRE e Data Lake exigem fornecedor, base legal, contrato de dados e critérios de aceite antes da implementação.
12. Não introduza dependências sem justificar necessidade, manutenção, segurança e impacto no bundle.\n13. Não tratar Lighthouse como única métrica: ele é diagnóstico de laboratório; Core Web Vitals de campo são a meta principal.\n14. Status de veículo e lead devem preservar histórico de transições; não apagar rastreabilidade com uma simples sobrescrita.\n15. Placa, Renavam, VIN/chassi, documentos e dados financeiros são restritos por padrão e não devem ser expostos publicamente.

## Fluxo obrigatório

1. Entender a solicitação e localizar o lado afetado: site, admin, core ou Supabase.
2. Consultar os documentos de produto e arquitetura.
3. Escrever um plano curto para mudanças que envolvam mais de um módulo ou migration.
4. Implementar o menor corte vertical útil.
5. Validar tipos, build, responsividade, estados vazio/carregando/erro/sucesso e políticas de acesso.
6. Atualizar documentação, migration e testes junto com o código.
7. Relatar o que mudou, decisões, riscos, validações e próximos passos.

## Critérios de qualidade

- Meta de experiência: LCP <= 2,5 s, INP <= 200 ms e CLS <= 0,1 no percentil 75, medidos em dados reais.
- Imagens com dimensões reservadas, formatos modernos, variantes responsivas e lazy loading fora da primeira dobra.
- SEO por veículo: URL estável, title/description únicos, canonical, Open Graph e dados estruturados `Car` + `Offer`.
- Formulários devem impedir duplicidade acidental, validar no servidor/banco e registrar origem/campanha quando disponível.
- Leads e financiamentos devem possuir histórico de status e responsável.
- Ações administrativas sensíveis devem gerar auditoria.\n- Lighthouse >= 90 nas quatro categorias é meta de laboratório para rotas representativas, sem substituir LCP/INP/CLS de campo.\n- Rate limit, idempotência, backup com restauração testada e atribuição de origem/campanha devem ser considerados nas funcionalidades correspondentes.

## Definição de pronto

Uma tarefa só está pronta quando o comportamento funciona, as permissões foram verificadas, estados de interface existem, o layout foi conferido no mobile, nenhuma informação sensível foi exposta e a documentação relevante foi atualizada.

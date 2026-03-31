# TASKS - [ID] [TÍTULO CURTO DA FEATURE/CORREÇÃO]

**Status:** Pendente | Em progresso | Concluído
**Autor:** [nome]
**Data:** [YYYY-MM-DD]
**SPEC:** [ID] [título] — `.specs/backlog/in-progress/[ID]/00-SPEC.md`
**PLAN:** `.specs/backlog/in-progress/[ID]/01-PLAN.md`

## Mapa de paralelização

> Use este mapa para decidir o que pode ser executado em paralelo e quando criar uma worktree git separada.

| Trilha | Seções | Pode paralelizar com | Worktree recomendada | Motivo |
|--------|--------|----------------------|----------------------|--------|
| Trilha A — Domínio | §2 | Trilha B | Sim \| Não \| Opcional | [arquivos distintos / interface compartilhada / escopo pequeno] |
| Trilha B — Infraestrutura | §3 | Trilha A | Sim \| Não \| Opcional | [arquivos distintos / interface compartilhada / escopo pequeno] |
| Trilha C — Testes | §4 | Nenhuma (depende de A e B) | Não | Depende da implementação concluída |

**Critérios de worktree:**
- **Sim** — trilhas tocam arquivos completamente distintos; divergência sem risco de conflito.
- **Opcional** — trilhas são independentes mas o escopo é pequeno (overhead pode não compensar).
- **Não** — trilhas compartilham interfaces, contratos ou uma depende da outra.

---

## 1. Preparação

- [ ] Ambiente de desenvolvimento configurado e funcionando.
- [ ] Dependências externas necessárias disponíveis (serviços, credenciais, etc.).
- [ ] Decisões abertas no PLAN resolvidas antes de iniciar.
- [ ] Arquivos e módulos que serão tocados identificados (conforme seção 2 do PLAN).

## 2. Implementação de domínio / aplicação

> Referenciar componentes e contratos definidos na seção 3.1 do PLAN.

- [ ] Criar/alterar [componente] para [responsabilidade] conforme interface definida no PLAN.
- [ ] Atualizar interfaces/contratos em [arquivo].

## 3. Implementação de infraestrutura

> Referenciar wiring e integrações definidos na seção 3.2 do PLAN.

- [ ] Ajustar [gateway/comunicador] em [arquivo] para suportar [comportamento].
- [ ] Configurar wiring no [arquivo de server/app].
- [ ] Aplicar migrações ou ajustes de infra mapeados na seção 2 do PLAN.

## 4. Testes

Cada CA da SPEC deve ter ao menos uma tarefa de teste correspondente.

- [ ] CA01 — [tipo de teste] em [caminho] validando [comportamento esperado].
- [ ] CA02 — [tipo de teste] em [caminho] cobrindo [cenário].
- [ ] Todos os testes passando localmente antes de abrir PR.

## 5. Decisões tomadas durante a implementação

Registrar em `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md` decisões não previstas no PLAN e débitos técnicos identificados à medida que surgirem.

- [ ] Decisões registradas e justificadas no documento de decisões.

## 6. Documentação e limpeza

- [ ] Atualizar documentação relevante (`.specs`, README, etc.).
- [ ] Remover código morto/obsoleto relacionado.
- [ ] Rodar linters/formatadores e corrigir problemas.

## 7. Validação final

Verificar cada CA individualmente antes de abrir o PR.

- [ ] CA01 — validado [manualmente / via teste automatizado].
- [ ] CA02 — validado [manualmente / via teste automatizado].
- [ ] Logs e observabilidade conferidos para novos comportamentos.
- [ ] PR aberto com links para a SPEC e o PLAN.

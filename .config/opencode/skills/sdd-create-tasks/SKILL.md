---
name: sdd-create-tasks
description: Cria um arquivo de TASKS com uma lista de tarefas para implementação de uma feature ou correção, seguindo um template pré-definido e baseado em uma SPEC e PLAN existentes. Terceira etapa do fluxo SDD.
compatibility: opencode
---

Antes de gerar, pergunte ao usuário o identificador da feature ou correção (o mesmo usado no diretório, ex: `add-cache-layer`).

Verifique se os seguintes arquivos existem:
- `.specs/backlog/in-progress/[ID]/00-SPEC.md` — se não existir, informe que a SPEC precisa ser criada primeiro (`/sdd-create-spec`). Não gere o TASKS.
- `.specs/backlog/in-progress/[ID]/01-PLAN.md` — se não existir, informe que o PLAN precisa ser criado primeiro (`/sdd-create-plan`). Não gere o TASKS.

Leia e analise os seguintes arquivos antes de gerar qualquer conteúdo:
- SPEC: `.specs/backlog/in-progress/[ID]/00-SPEC.md`
- PLAN: `.specs/backlog/in-progress/[ID]/01-PLAN.md`

Extraia os Critérios de Aceite (CAs) da SPEC e os componentes/contratos do PLAN para gerar tarefas concretas e rastreáveis.

## Análise de paralelização

Antes de gerar as tarefas, analise os componentes e arquivos afetados descritos no PLAN (seções 3.1 e 3.2) e preencha o Mapa de paralelização seguindo estas regras:

**Identificação de trilhas paralelas:**
- Agrupe as seções de implementação em trilhas com base nos módulos/arquivos que cada uma toca.
- Duas trilhas são paralelizáveis se tocam conjuntos de arquivos disjuntos e nenhuma depende do output da outra.
- Trilhas que compartilham interfaces ou contratos são paralelizáveis apenas após esses contratos estarem definidos.
- Testes são sempre sequenciais às trilhas de implementação que validam.

**Recomendação de worktree:**
- **Sim** — a trilha toca arquivos completamente distintos das demais e o escopo é suficientemente grande para justificar o isolamento (mais de 3 arquivos diferentes).
- **Opcional** — a trilha é independente mas o escopo é pequeno (3 arquivos ou menos); worktree possível mas overhead pode não compensar.
- **Não** — a trilha compartilha arquivos, interfaces ou contratos com outra; ou é sequencial (depende de outra trilha).

Use o template em `~/.config/opencode/skills/sdd/templates/02-TASKS.template.md` como referência de estrutura, formatação, sequência e estilo.
Gere uma lista de tarefas em formato de checklist para um desenvolvedor executar.
Não altere a ordem das seções.
Use linguagem objetiva e focada em desenvolvimento de software.
Todos os documentos devem ser escritos em PT-BR.

Salve o arquivo gerado em `.specs/backlog/in-progress/[ID]/02-TASKS.md`.

Após salvar, informe ao usuário:
"TASKS criado em `.specs/backlog/in-progress/[ID]/02-TASKS.md`.
Próximo passo: `/sdd-implement` para executar as tarefas e implementar a solução."

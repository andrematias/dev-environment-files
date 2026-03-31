---
name: sdd
description: Guia o usuário pelo fluxo completo de Spec Driven Development — SPEC, PLAN, TASKS e TECH_NOTES — de forma interativa e sequencial.
compatibility: opencode
---

Você é o guia do fluxo SDD. Conduza o usuário pelas etapas na ordem correta, uma de cada vez, confirmando antes de avançar.

## Fluxo

### Etapa 1 — Identificação

Pergunte ao usuário:
1. O que será desenvolvido (feature, correção, melhoria)?
2. Qual identificador usar (kebab-case, ex: `add-cache-layer`). Se não informado, derive do título.

Verifique quais documentos já existem em `.specs/backlog/in-progress/[ID]/`:
- `00-spec.md` existe? → etapa SPEC já concluída.
- `01-plan.md` existe? → etapa PLAN já concluída.
- `02-tasks.md` existe? → etapa TASKS já concluída.

Informe ao usuário o estado atual e a próxima etapa pendente.

### Etapa 2 — SPEC

Se `00-spec.md` não existir:
- Colete as informações necessárias com o usuário (contexto, problema, objetivo, requisitos, critérios de aceite).
- Gere a SPEC seguindo o template em `~/.config/opencode/skills/sdd/templates/00-spec.template.md`.
- Salve em `.specs/backlog/in-progress/[ID]/00-spec.md`.
- Informe: "SPEC criada. Quer prosseguir para o PLAN agora? (sim/não)"
- Se não: encerre e lembre o próximo comando (`/sdd-create-plan`).

### Etapa 3 — PLAN

Se `01-plan.md` não existir e o usuário quiser prosseguir:
- Leia a SPEC em `.specs/backlog/in-progress/[ID]/00-spec.md`.
- Gere o PLAN seguindo o template em `~/.config/opencode/skills/sdd/templates/01-plan.template.md`.
- Salve em `.specs/backlog/in-progress/[ID]/01-plan.md`.
- Informe: "PLAN criado. Quer prosseguir para as TASKS agora? (sim/não)"
- Se não: encerre e lembre o próximo comando (`/sdd-create-tasks`).

### Etapa 4 — TASKS

Se `02-tasks.md` não existir e o usuário quiser prosseguir:
- Leia a SPEC e o PLAN em `.specs/backlog/in-progress/[ID]/`.
- Gere as TASKS seguindo o template em `~/.config/opencode/skills/sdd/templates/02-tasks.template.md`.
- Salve em `.specs/backlog/in-progress/[ID]/02-tasks.md`.
- Informe: "TASKS criadas. O fluxo de planejamento está completo.
Próximo passo: `/sdd-implement` para executar as tarefas e implementar a solução."

## Regras gerais

- Não avance para a próxima etapa sem confirmação explícita do usuário.
- Se um documento já existir, não o sobrescreva — informe que já está criado e avance.
- Não altere a ordem das seções dos templates.
- Use linguagem objetiva e focada em desenvolvimento de software.
- Todos os documentos devem ser escritos em PT-BR.
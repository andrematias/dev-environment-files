---
name: sdd-create-plan
description: Cria um arquivo de PLAN para uma feature ou correção, seguindo um template pré-definido e baseado em uma SPEC existente. Segunda etapa do fluxo SDD.
compatibility: opencode
---

Antes de gerar, pergunte ao usuário o identificador da feature ou correção (o mesmo usado no diretório da SPEC, ex: `add-cache-layer`).

Verifique se o arquivo `.specs/backlog/in-progress/[ID]/00-SPEC.md` existe.
- Se não existir: informe ao usuário que a SPEC precisa ser criada primeiro e sugira executar `/sdd-create-spec`. Não gere o PLAN.

Leia e analise a SPEC em `.specs/backlog/in-progress/[ID]/00-SPEC.md` antes de gerar qualquer conteúdo.
Extraia os Critérios de Aceite (CAs) da SPEC e use-os para preencher as seções de testes e rastreabilidade do PLAN.

Use o template em `~/.config/opencode/skills/sdd/templates/01-PLAN.template.md` como referência de estrutura, formatação, sequência e estilo.
Gere um plano de implementação detalhado mantendo a mesma estrutura do template.
Não altere a ordem das seções.
Use linguagem objetiva e focada em desenvolvimento de software.
Todos os documentos devem ser escritos em PT-BR.

Salve o arquivo gerado em `.specs/backlog/in-progress/[ID]/01-PLAN.md`.

Após salvar, informe ao usuário:
"PLAN criado em `.specs/backlog/in-progress/[ID]/01-PLAN.md`.
Próximo passo: `/sdd-create-tasks` para gerar o checklist de execução."
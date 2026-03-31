---
name: sdd-create-spec
description: Cria um arquivo de SPEC para uma feature ou correção, seguindo um template pré-definido. Primeira etapa do fluxo SDD.
compatibility: opencode
---

Antes de gerar, pergunte ao usuário:
1. O nome/identificador da feature ou correção (será usado como nome do diretório e como ID do documento). Use o formato slug em kebab-case, ex: `add-cache-layer`, `fix-auth-timeout`.
2. Se não for informado, derive um slug curto e objetivo do título descrito.

Use o template em `~/.config/opencode/skills/sdd/templates/00-SPEC.template.md` como referência de estrutura, formatação, sequência e estilo.
Preencha todas as seções do template com base no que o usuário descreveu.
Não altere a ordem das seções.
Use linguagem objetiva e focada em desenvolvimento de software.
Todos os documentos devem ser escritos em PT-BR.

Salve o arquivo gerado em `.specs/backlog/in-progress/[ID]/00-SPEC.md`, onde `[ID]` é o identificador definido acima.

Após salvar, informe ao usuário:
"SPEC criada em `.specs/backlog/in-progress/[ID]/00-SPEC.md`.
Próximo passo: `/sdd-create-plan` para detalhar como a solução será implementada."
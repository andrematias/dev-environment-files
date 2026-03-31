---
name: sdd-tech-notes
description: Inicializa ou atualiza o arquivo de Tech Notes de uma feature ou correção, registrando decisões de implementação e débitos técnicos identificados ao longo do desenvolvimento.
compatibility: opencode
---

Antes de gerar, pergunte ao usuário o identificador da feature ou correção (o mesmo usado no diretório, ex: `add-cache-layer`).

Verifique se o arquivo `.specs/backlog/in-progress/[ID]/00-SPEC.md` existe.
- Se não existir: informe que a SPEC precisa ser criada primeiro (`/sdd-create-spec`). Não gere o documento.

Verifique se já existe um arquivo em `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md`:
- Se não existir: inicialize-o com base no template em `~/.config/opencode/skills/sdd/templates/03-TECH_NOTES.template.md`, preenchendo apenas o cabeçalho com a referência à SPEC. Deixe as seções prontas para preenchimento incremental.
- Se já existir: leia o conteúdo atual e pergunte ao usuário o que deseja registrar — uma nova decisão ou um novo débito técnico — e acrescente sem alterar o conteúdo anterior.

Leia a SPEC em `.specs/backlog/in-progress/[ID]/00-SPEC.md` para preencher a referência do cabeçalho corretamente.

Use o template em `~/.config/opencode/skills/sdd/templates/03-TECH_NOTES.template.md` como referência de estrutura, formatação e estilo.
Não altere a ordem das seções existentes.
Use linguagem objetiva e focada em desenvolvimento de software.
Todos os documentos devem ser escritos em PT-BR.

Salve o arquivo em `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md`.

Após salvar, informe ao usuário:
"Tech Notes atualizadas em `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md`.
Continue usando `/sdd-tech-notes` sempre que surgir uma nova decisão ou débito técnico durante a implementação."

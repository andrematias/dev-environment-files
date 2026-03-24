--- 
name: taskwarrior-create 
description: >
    Create Taskwarrior tasks from user input, inferring description from context or tags when needed. Now supports advanced attributes like projects, dependencies, recurrence, and annotations.
compatibility: opencode 
--- 

## What I do
- Add Taskwarrior tasks using `task add`
- Prompt for description (required), priority, tags, due date, project, dependencies, recurrence, annotation
- If description is not provided, generate it automatically from conversation context or tags, and suggest to the user

## When to use me
Use anytime you want to quickly create a Taskwarrior task,
especially if you want the AI to help with task naming and advanced organization.

## Context-aware task creation
If the user does not provide a description,
infer and generate one based on tags or conversation context. Suggest the
generated description for confirmation before task creation.

Example:
- User requests: “Crie uma tarefa semanal com tags trabalho, urgente, project XPTO, dependente da tarefa 12”
- Agent replies: “Descrição sugerida: ‘Trabalhar nas tarefas prioritárias do projeto XPTO’. Confirmar?”

Always prompt the user for confirmation before proceeding with the
auto-generated description. If the user accepts, finalize and create the task;
if not, allow manual editing or retry.

Prompts:
- "Qual a descrição da tarefa?" (se possível deduzir, sugira)
- "Qual a prioridade? (opcional, H/M/L)"
- "Quais tags? (opcional, separadas por vírgula)"
- "Data de vencimento? (opcional, YYYY-MM-DD)"
- "Em qual projeto essa tarefa se encaixa? (opcional)"
- "Esta tarefa depende de alguma outra? (opcional, cite ID ou descrição)"
- "Essa tarefa se repete? (daily, weekly, monthly, etc. - opcional)"
- "Deseja adicionar uma anotação extra? (opcional)"

If successful:
- "Tarefa criada com sucesso. ID: <id>"
- "Resumo: <descrição> (<prioridade>, <tags>, projeto: <projeto>, depende de: <dep>, recorrência: <recurrence>, anotação: <annotation>, vence em <data>)"
If error:
- Mostre apenas a mensagem de falha ao usuário.

## Documentation
- Supports all Taskwarrior task creation fields: description, priority, tags, due date, project, dependency, recurrence, annotation.
- Fields are inferred automatically from context. All auto-filled values are suggested for confirmation before task creation.
- Task creation flow is always transparent, with a complete summary shown after successful creation.
- Advanced example: "Adicionar tarefa semanal, projeto XPTO, tags dev, depende da tarefa 12, com anotação de reunião."
- Result: "Descrição sugerida: Revisar sprint do projeto XPTO. Confirmar?" e prompts para os outros campos.
- Feedback de sucesso: Tarefa criada com sucesso. ID: 14. Resumo: Revisar sprint (prioridade alta, projeto XPTO, tags dev, depende da tarefa 12, semanal, vence em 2026-03-20, anotação: 'Reunião de sprint').

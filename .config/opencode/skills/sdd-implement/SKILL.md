---
name: sdd-implement
description: Implementa a solução de uma feature ou correção seguindo a lista de tarefas do SDD, executando as tarefas em sequência, marcando o progresso e registrando decisões.
compatibility: opencode
---

Antes de iniciar, pergunte ao usuário o identificador da feature ou correção (ex: `add-cache-layer`).

## Verificação de pré-condições

Verifique se os seguintes arquivos existem:
- `.specs/backlog/in-progress/[ID]/00-SPEC.md` — se não existir, informe que a SPEC precisa ser criada primeiro (`/sdd-create-spec`). Não prossiga.
- `.specs/backlog/in-progress/[ID]/01-PLAN.md` — se não existir, informe que o PLAN precisa ser criado primeiro (`/sdd-create-plan`). Não prossiga.
- `.specs/backlog/in-progress/[ID]/02-TASKS.md` — se não existir, informe que as TASKS precisam ser criadas primeiro (`/sdd-create-tasks`). Não prossiga.

## Leitura dos documentos

Leia os três documentos na seguinte ordem antes de escrever qualquer código:
1. SPEC: `.specs/backlog/in-progress/[ID]/00-SPEC.md` — entenda o problema, os requisitos e os critérios de aceite.
2. PLAN: `.specs/backlog/in-progress/[ID]/01-PLAN.md` — entenda os componentes, contratos, fluxo e estratégia de testes.
3. TASKS: `.specs/backlog/in-progress/[ID]/02-TASKS.md` — esta é a lista de execução a seguir.

## Execução

Execute as tarefas do arquivo TASKS na ordem das seções (Preparação → Domínio → Infraestrutura → Testes → Documentação → Validação).

Para cada tarefa:
1. Informe ao usuário qual tarefa está sendo executada.
2. Execute a tarefa (crie ou edite os arquivos necessários).
3. Após concluir, marque a tarefa como feita no arquivo TASKS trocando `- [ ]` por `- [x]`.
4. Salve o arquivo `.specs/backlog/in-progress/[ID]/02-TASKS.md` com o progresso atualizado.
5. Pergunte ao usuário se quer prosseguir para a próxima tarefa ou pausar.

## Registro de decisões e débitos técnicos

Sempre que surgir uma decisão de implementação não prevista no PLAN (escolha de biblioteca, abordagem alternativa, ajuste de contrato, etc.):
- Informe ao usuário a decisão que precisa ser tomada.
- Aguarde orientação ou proponha opções com prós e contras.
- Após a decisão, registre-a imediatamente na seção "Decisões de implementação" do arquivo `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md` usando o formato do template em `~/.config/opencode/skills/sdd/templates/03-TECH_NOTES.template.md`.
- Continue a execução.

Sempre que identificar um débito técnico (algo feito de forma não ideal por restrição de tempo, complexidade ou dependência externa):
- Informe ao usuário o débito identificado.
- Registre-o imediatamente na seção "Débitos técnicos" do arquivo `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md`.
- Continue a execução.

## Atualização do status das TASKS

Ao final da sessão de implementação (ou quando o usuário pausar), atualize o campo **Status** no cabeçalho do arquivo TASKS:
- `Pendente` → se nenhuma tarefa foi iniciada.
- `Em progresso` → se há tarefas concluídas e pendentes.
- `Concluído` → se todas as tarefas estão marcadas com `[x]`.

## Validação final e encerramento

Quando todas as tarefas estiverem concluídas (`[x]`), pergunte ao usuário:
"Todas as tarefas foram concluídas. Quer rodar o checklist de encerramento e finalizar a tarefa? (sim/não)"

Se o usuário confirmar, execute o checklist abaixo na ordem. Para cada item, informe o resultado (✓ aprovado / ✗ pendente):

### Checklist de encerramento

**1. Tarefas**
- Verifique se todas as tarefas em `.specs/backlog/in-progress/[ID]/02-TASKS.md` estão marcadas com `[x]`.
- Se houver tarefas abertas (`[ ]`): liste-as e pergunte ao usuário se quer continuar a implementação ou ignorar intencionalmente cada uma.

**2. Critérios de aceite**
- Leia cada CA da SPEC em `.specs/backlog/in-progress/[ID]/00-SPEC.md`.
- Para cada CA, pergunte ao usuário se foi atendido ou requer verificação manual.
- Liste o resultado: CA01 ✓, CA02 ✓, CA03 ✗ (verificação manual necessária), etc.

**3. Débitos técnicos**
- Verifique se o arquivo `.specs/backlog/in-progress/[ID]/03-TECH_NOTES.md` existe.
- Se existir, liste os débitos registrados na seção "Débitos técnicos" para o usuário revisar e confirmar que estão documentados.

**4. Mover para done**
- Se todos os itens obrigatórios estiverem aprovados (todas as tarefas concluídas e todos os CAs atendidos ou explicitamente aceitos pelo usuário):
  - Crie o diretório `.specs/backlog/done/` se não existir.
  - Mova o diretório `.specs/backlog/in-progress/[ID]/` para `.specs/backlog/done/[ID]/`.
  - Informe: "Tarefa [ID] finalizada e movida para `.specs/backlog/done/[ID]/`. Abra o PR com links para os documentos em `.specs/backlog/done/[ID]/`."
- Se houver CAs não atendidos que o usuário não aceitou explicitamente: não mova o diretório e informe os itens pendentes.

## Regras gerais

- Não pule tarefas nem altere sua ordem sem informar o usuário.
- Não sobrescreva conteúdo já registrado no TECH_NOTES — apenas acrescente.
- Se uma tarefa revelar que o PLAN está incompleto ou incorreto, sinalize ao usuário antes de continuar.
- Use linguagem objetiva nos comentários e logs de progresso.
- Todo código e documentação gerados devem seguir as convenções do projeto consumidor.
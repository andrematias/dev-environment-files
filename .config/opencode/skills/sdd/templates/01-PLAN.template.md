# PLAN - [ID] [TÍTULO CURTO DA FEATURE/CORREÇÃO]

**Status:** Rascunho | Em revisão | Aprovado
**Autor:** [nome]
**Data:** [YYYY-MM-DD]
**SPEC de origem:** [ID] [título] — `.specs/backlog/in-progress/[ID]/00-SPEC.md`
**Critérios de aceite cobertos:** CA01, CA02, [...]

## 1. Visão geral

- Resumo de alto nível de como a solução será implementada.
- Principais decisões de arquitetura/integração.

## 2. Impactos mapeados

- Código: [módulos, camadas, serviços afetados]
- Infra: [se houver — migrações, variáveis de ambiente, dependências]
- Observabilidade: [logs, métricas, traces a adicionar ou ajustar]

## 3. Design de alto nível

### 3.1. Fluxo principal

1. [Entrada] → [Componente A] recebe [dado X]
2. [Componente A] → [Componente B] aplica [regra Y]
3. [Componente B] → [Saída / persistência]

### 3.2. Componentes / Módulos

- Componentes novos:
  - [NomeDoComponente]
    - Responsabilidade: [o que faz]
    - Interface/assinatura esperada: [método, contrato, tipo]
    - Depende de: [outro componente ou serviço]
- Componentes existentes afetados:
  - [arquivo/módulo] — tipo de mudança e motivo

## 4. Estratégia de mudanças em código

### 4.1. Domínio / Application

- O que será criado/alterado nesta camada.
- Interfaces, modelos, casos de uso.

### 4.2. Infraestrutura / Gateways

- HTTP, WebSocket, DB, filas, etc.
- Como será feito o wiring e integração.

### 4.3. Testes

Cada CA deve ter ao menos um teste correspondente planejado.

- CA01 → [tipo de teste] em [módulo/caminho] validando [comportamento]
- CA02 → [tipo de teste] em [módulo/caminho] cobrindo [cenário]

## 5. Estratégia de rollout

> Se não aplicável (mudança interna sem risco de ativação gradual), substituir por: "N/A — mudança interna sem necessidade de rollout gradual."

- Feature flags, config toggles, deploy gradual, etc.
- Plano de rollback (como desativar ou voltar atrás).

## 6. Riscos e mitigação

- Risco 1 — descrição, impacto, mitigação.
- Risco 2 — [...]
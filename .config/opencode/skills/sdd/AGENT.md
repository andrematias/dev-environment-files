# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A collection of OpenCode/Claude Code skills for structured Software Development Documentation (SDD). Skills are invoked as slash commands and guide the AI to produce standardized specification, planning, and task documents.

## Skills

| Skill | Command | Purpose |
|-------|---------|---------|
| `sdd` | `/sdd` | Interactive orchestrator — guides the full SPEC → PLAN → TASKS flow |
| `sdd-create-spec` | `/sdd-create-spec` | Generates a SPEC document for a feature or bug fix |
| `sdd-create-plan` | `/sdd-create-plan` | Generates an implementation PLAN based on an existing SPEC |
| `sdd-create-tasks` | `/sdd-create-tasks` | Generates a TASKS checklist based on SPEC + PLAN |
| `sdd-tech-notes` | `/sdd-tech-notes` | Initializes or updates the TECH_NOTES log (decisions + technical debts) |
| `sdd-implement` | `/sdd-implement` | Executes the TASKS list, marking progress and registering decisions and technical debts |

Each skill is defined by a `SKILL.md` file with YAML frontmatter (`name`, `description`, `compatibility`) followed by instructions for the AI.

## Document Workflow

Skills follow a strict sequential order. Each stage depends on the previous:

```
SPEC (what & why) → PLAN (how) → TASKS (execution checklist) → TECH_NOTES (decisions + technical debts)
```

Documents are placed under `.specs/backlog/in-progress/[ID]/` where `[ID]` is the feature/fix identifier in kebab-case (e.g. `add-cache-layer`).

## Directory Structure

```
skills/
├── sdd/                  ← orchestrator skill + shared templates
│   ├── SKILL.md
│   └── templates/
│       ├── 00-spec.template.md
│       ├── 01-plan.template.md
│       ├── 02-tasks.template.md
│       └── 03-tech-notes.template.md
├── sdd-create-spec/
│   └── SKILL.md
├── sdd-create-plan/
│   └── SKILL.md
├── sdd-create-tasks/
│   └── SKILL.md
└── sdd-create-decisions/
    └── SKILL.md
```

## Template Structure

- `00-spec.template.md` — Context, Problem, Objective, Scope, Functional/Non-Functional Requirements, Acceptance Criteria, Impact Mapping
- `01-plan.template.md` — Overview, High-Level Design (main flow + components), Code Change Strategy (Domain, Infrastructure, Tests), Rollout Strategy, Risks
- `02-tasks.template.md` — Checklist: Preparation, Domain impl, Infrastructure impl, Tests, Docs/cleanup, Final validation
- `03-tech-notes.template.md` — Decisions log (context, options, chosen approach) + technical debts table + file tracking

## Language Convention

All generated documents must be written in **Brazilian Portuguese (PT-BR)**.

## Skill Authoring Rules

When adding or modifying a skill:
- Skill directories live at `skills/<skill-name>/` (one level deep) so OpenCode discovers them.
- The `sdd/` directory holds the orchestrator `SKILL.md` and the shared `templates/` subdirectory.
- All skills reference templates using the absolute path `~/.config/opencode/skills/sdd/templates/NN-NAME.template.md`.
- The `SKILL.md` frontmatter `name` must match the directory name exactly.
- All skills must include `compatibility: opencode` in the frontmatter.
- Output files are saved to `.specs/backlog/in-progress/[ID]/NN-NAME.md` in the consuming project.
- Skills must instruct the AI to ask for the feature identifier (`[ID]`) before generating.
- Skills that depend on previous documents must explicitly instruct the AI to read them first.
- Do not alter section order in templates — skills explicitly instruct the AI to preserve sequence.
- Document `[ID]` format: kebab-case slug derived from the feature title, e.g. `add-cache-layer`.
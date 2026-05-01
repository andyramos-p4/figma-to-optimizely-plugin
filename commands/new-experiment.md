---
description: Scaffold a new experiment folder (input/, output/Optimizely/, qa/) ready for figma-to-widget conversion.
argument-hint: <experiment-name>
---

Scaffold a new experiment folder named `$1` (or ask the user for a name if `$1` is empty).

Create this structure under the current working directory:

```
experiments/$1/
├── input/
│   ├── brief.md
│   ├── copy-variants.md
│   ├── hypotheses.md
│   └── target-page-notes.md
├── output/
│   └── Optimizely/   (empty — will hold widget files)
└── qa/
    ├── implementation-notes.md
    ├── known-issues.md
    └── test-cases.md
```

Each markdown file should be created with a one-line title heading and a short prompt for what to fill in. Examples:

**input/brief.md**
```
# Brief

- Goal:
- Target page:
- Success metric:
- A/B-testable fields:
```

**input/copy-variants.md**
```
# Copy variants

Paste copy options for each variant here.
```

**input/hypotheses.md**
```
# Hypotheses

- Primary hypothesis:
- Secondary hypothesis:
```

**input/target-page-notes.md**
```
# Target page notes

- Host URL:
- Mount selector candidate:
- Notes on existing page elements:
```

**qa/implementation-notes.md**, **qa/known-issues.md**, **qa/test-cases.md** — create each with just a `# <Title>` header. They'll be filled in after `/figma-to-widget` runs.

After scaffolding, list the created paths and tell the user the next step is:

```
/figma-to-optimizely <figma-url>
```

inside this experiment folder.

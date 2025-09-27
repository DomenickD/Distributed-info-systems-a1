# Distributed Information Systems — Assignment 1

A small, self-contained static web demo for the Distributed Information Systems course (Assignment 1).
The project demonstrates a clean, responsive HTML/CSS layout with two interactive demos:

- A local CRUD (Create, Read, Update, Delete) demo that stores records in browser localStorage.
- An analytics comparison view that renders the same dataset using Chart.js and D3.js.

Author: Domenick Dobbs

## Quick demo

Open `index.html` in your browser. For a simple local server (recommended), run one of the commands below from the project root.

PowerShell / Windows:

```powershell
# using Python 3 (recommended)
python -m http.server 8000

# or using Node's http-server if you have it installed
npx http-server -p 8000
```

Then visit http://localhost:8000 in your browser.

## What you'll find

- Home (`index.html`): Landing page and navigation to the demos.
- CRUD (`crud.html`): A minimal CRUD interface for adding, editing, and deleting themed records. Data persists to `localStorage` under the key `demoItems`.
- Analytics (`analytics.html`): A visualization comparison page that shows the same sample dataset rendered with Chart.js (canvas) and D3.js (SVG). You can switch libraries and chart types (line / bar) and toggle fill on line charts.

## Features

- Responsive, semantic HTML and a compact CSS utility-based stylesheet (`css/styles.css`).
- Lightweight JavaScript for client-side UI behavior (`js/main.js`).
- CRUD operations stored locally (no server, no database) using `localStorage`.
- Analytics demo using:
	- Chart.js v4 (via CDN)
	- D3.js v7 (via CDN)

## Project structure

```
├── index.html          # Landing page
├── crud.html           # CRUD demo (localStorage-backed)
├── analytics.html      # Chart.js and D3.js comparison
├── aboutus.html        # Static about page
├── css/
│   └── styles.css      # Main site styles
├── js/
│   └── main.js         # Small site utility script
└── img/                # Images (logo, hero)
```

## How the demos work (short contract)

- CRUD demo
	- Inputs: Title and Value form fields
	- Output: Table of stored records
	- Persistence: `localStorage` key `demoItems` (JSON array)
	- Error modes: Empty titles/values prevented by `required` on inputs

- Analytics demo
	- Inputs: library selector (Chart.js vs D3), chart type selector (line/bar), toggle fill button
	- Output: Chart rendered to canvas (Chart.js) or SVG (D3)

## Common tasks

- Clear CRUD demo data: Clear `localStorage.demoItems` in the browser devtools console or use Application → Clear Storage in Chrome devtools.
- Change sample dataset: Edit the `labels` and `values` arrays inside `analytics.html` (near the top of the inline script).

## Development notes

- This is a fully static site — no build step required. You can edit the HTML/CSS/JS directly.
- Recommended development flow:
	1. Run a local static server (see Quick demo).
	2. Edit files in your editor/IDE.
	3. Refresh the browser to see changes.



---
name: parliament-search
description: Search Indian parliamentary committee reports using the local parliamentwatch project. Runs a keyword search across all 16 Departmentally Related Standing Committees (DRSCs), formats matching reports as a Markdown table, and offers to fetch AI summaries or import findings to Obsidian as evidence notes.
---

# /parliament-search

Search parliamentary committee reports for evidence relevant to a research topic.

## Prerequisites

Requires the `parliamentwatch` project to be installed locally at `~/Projects/parliamentwatch` with its virtual environment set up. If not found, direct the user to: `https://github.com/pranaykotas/parliamentwatch`

## What to Do

1. **Get the search query** from the user. If not provided in the command (e.g., `/parliament-search semiconductors`), ask: "What topic or keyword should I search for in parliamentary committee reports?"

2. **Run the search** using the parliamentwatch CLI:

   ```bash
   cd ~/Projects/parliamentwatch && source .venv/bin/activate && python cli.py --search "[query]"
   ```

   If the above path doesn't exist, try `~/Projects/parliamentwatch-design/` as fallback. If neither exists, inform the user and suggest running `/parliament-search` after setting up parliamentwatch.

3. **Format the results** as a Markdown table:

   ```
   ## Parliamentary Committee Reports: "[query]"

   | # | Report Title | Committee | Date | LS | Summary available? |
   |---|-------------|-----------|------|----|--------------------|
   | 1 | [title] | [committee] | [date] | [LS no.] | Yes / No |
   ```

   If no results: "No committee reports found for '[query]'. Try a broader term or check if parliamentwatch data has been fetched (`python cli.py --scrape`)."

4. **Offer follow-up actions:**

   > "Found [N] reports. What would you like to do next?
   > (A) Get the AI summary for a specific report — tell me the number
   > (B) Search within a specific committee — which one?
   > (C) Add key findings to an Obsidian evidence note
   > (D) Use these as sources in my current research — which claim do they support?"

5. **For option A (get summary):**

   ```bash
   cd ~/Projects/parliamentwatch && source .venv/bin/activate && python cli.py --committee [committee-key] --report [report-no]
   ```

   Format the summary and present it. Note the report title, committee, date, and LS number for citation.

6. **For option C (import to Obsidian):**

   Create a brief evidence note in the Obsidian vault (if bound) with:
   - Report title, committee, date, LS number
   - Key findings from the summary
   - Relevance to the current research topic
   - Citation format: `[Committee Name], [Report Title], [LS]th Lok Sabha, [Date]`

7. **For option D (use as sources):**

   Map each relevant report to the specific claim it supports or challenges in the Research Brief (if one exists). Format as:
   ```
   [Report title] → supports/challenges claim: [claim from Research Brief]
   Relevant finding: [key sentence from summary]
   ```

## Committee Keys (for CLI)

Use these with `--committee`:
`agriculture`, `chemicals`, `coal`, `communications`, `consumer_affairs`, `defence`, `energy`, `external_affairs`, `finance`, `housing`, `labour`, `petroleum`, `railways`, `rural_development`, `social_justice`, `water_resources`

## Citation Format

Parliamentary committee reports should be cited as:
> [Committee Name], *[Report Title]*, [N]th Lok Sabha, [Date presented to Parliament].

Example:
> Standing Committee on Communications and Information Technology, *The Electronics and Information Technology Goods (Requirements for Compulsory Registration) (Amendment) Order, 2023*, 18th Lok Sabha, March 2024.

## Notes

- parliamentwatch path is assumed to be `~/Projects/parliamentwatch`. If Pranay moves the project, update this command.
- Data must be fetched first with `python cli.py --scrape` before search works. If search returns nothing, the data directory may be empty.
- AI summaries require an API key configured in parliamentwatch's `.env` file (`ANTHROPIC_API_KEY` or equivalent).
- Search is title-based by default; full-text search requires extracted PDFs (run `--extract` for a committee first).

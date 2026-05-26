---
name: takshashila-citation-style
description: Format references according to Takshashila Institution publication standards. Use when the user asks to "format references", "fix citations", "convert to Takshashila style", or when finalising any Takshashila discussion document, issue brief, or policy brief for submission.
tags: [Takshashila, Citation, Reference, Policy, Publishing]
version: 1.0.0
---

# Takshashila Citation Style Guide

Format references for Takshashila Institution publications: discussion documents, issue briefs, policy briefs, and working papers.

## Core Format

```
Author First Last, "Article or Chapter Title," *Publication or Source Name*, Month Day, Year, [Link](URL)
```

**Four rules:**
1. Author name: **First Last** (never Last, First)
2. Article/chapter/report titles: **"double quotation marks"**
3. Publication, journal, or source name: ***italicised***
4. URLs: **[Link](URL)** — never bare URLs

---

## Format by Source Type

### News article
```
Journalist Name, "Headline," *Publication*, Month Day, Year, [Link](URL)
```
*Example:*
> David Shepardson, "US Requires Licences for Nvidia H20 Chip Exports to China," *Reuters*, April 9, 2025, [Link](https://reuters.com/...)

### Government report or regulatory document
```
Agency Name, "Document Title," Document Type, Month Day, Year
```
*Example:*
> Bureau of Industry and Security, "Export Controls on Advanced Computing Semiconductors," Interim Final Rule, October 17, 2023

For Federal Register entries, add the volume and number:
> Bureau of Industry and Security, "...", *Federal Register* 88, no. 200, October 17, 2023

### Think tank / policy report (with named author)
```
Author Name, "Report Title," *Institution Name*, Month Year, [Link](URL)
```
*Example:*
> Gregory C. Allen, "Choking Off China's Access to the Future of AI," *CSIS*, October 2022, [Link](https://...)

### Think tank / policy report (institutional author)
```
Institution Name, "Report Title," Month Year, [Link](URL)
```
*Example:*
> Semiconductor Industry Association, "Chipping Away: Assessing and Addressing China's Chip Ambitions," July 2024, [Link](https://...)

### Book
```
Author Name, *Book Title* (Publisher, Year), page or chapter reference.
```
*Example:*
> Pranay Kotasthane and Abhiram Manchi, *When the Chips Are Down: The Geopolitics of Semiconductors* (Bloomsbury, 2023), chapter 8.

### Book chapter
```
Author Name, "Chapter Title," in *Book Title*, ed. Editor Name (Publisher, Year), pp. X–Y.
```

### Academic journal article
```
Author Name, "Article Title," *Journal Name* Volume, no. Issue (Year): page range.
```
*Example:*
> Dan Fuller, "Chip Design in China and India," *Technological Forecasting and Social Change* 81 (2012): 1–10.

### Podcast / video interview
```
Host Name, "Episode Title," *Podcast Name*, Month Day, Year, [Link](URL)
```
*Example:*
> Dwarkesh Patel, "Jensen Huang — TPU Competition, Why We Should Sell Chips to China," *Dwarkesh Podcast*, April 15, 2026, [Link](https://...)

### Company annual report or filing
```
Company Name, *Annual Report YYYY*, Date of Publication, [Link](URL)
```
*Example:*
> Huawei, *2025 Annual Report*, March 31, 2026, [Link](https://...)

For SEC filings:
> Nvidia Corporation, Current Report on Form 8-K, April 9, 2025.

### Blog post / newsletter / Substack
```
Author Name, "Post Title," *Newsletter or Blog Name*, Month Day, Year, [Link](URL)
```
*Example:*
> Pranay Kotasthane, "#339 Divergence and Assimilation," *Anticipating the Unintended*, March 30, 2026, [Link](https://...)

### Preprint / technical report
```
Author Name et al., "Paper Title," *Institution or Repository*, Month Year, [Link](URL)
```
*Example:*
> Evan Hubinger et al., "Sleeper Agents: Training Deceptive LLMs that Persist Through Safety Training," *Anthropic*, January 2024, [Link](https://arxiv.org/abs/2401.05566)

### Institutional web page (no author, no date)
```
Institution Name, "Page Title," accessed Month Day, Year, [Link](URL)
```

---

## Repeated Citations

- Second and subsequent citations to the same source: use **op. cit.**
  > Allen, "Choking Off China's Access," op. cit.
- For the same author's different works, include a short title to disambiguate.

---

## Date Formats

| Situation | Format |
|---|---|
| Full date known | April 15, 2026 |
| Month and year only | April 2026 |
| Year only | 2026 |
| No date | omit; use "accessed [date]" if URL |

---

## Missing Sources

Mark unverified or missing sources explicitly so they are not accidentally left in a submitted document:

```
SOURCE NEEDED — [brief description of what is needed, plus suggested outlet/search term]
```

---

## Conversion Workflow

When converting an existing bibliography (APA, Chicago, MLA, bare URLs) to Takshashila style:

1. **Identify source type** — determines the template to apply
2. **Reorder author name** — Last, First → First Last
3. **Apply quotes/italics** — title in quotes, source in italics
4. **Reformat date** — to Month Day, Year
5. **Convert URL** — bare URL → [Link](URL)
6. **Add op. cit.** where a source repeats
7. **Flag SOURCE NEEDED** for any entry that is a placeholder

---

## Common Errors to Avoid

| Wrong | Correct |
|---|---|
| Shah, Ajay, "Title..." | Ajay Shah, "Title..." |
| "Title," *Source*, 2024. https://url | "Title," *Source*, 2024, [Link](https://url) |
| Title without quotes or italics | "Article title" or *Book title* |
| ibid. for same source | op. cit. with short title |
| Bare footnote number with no author | Always lead with author or institution |

---

## Integration with Takshashila Workflow

- Run this skill before `/draft-review` to catch citation format issues early
- Pairs with `citation-verification` skill: use this skill for *format*, use `citation-verification` for *accuracy*
- On final draft, do one pass: format first (this skill), then verify each source exists (citation-verification)

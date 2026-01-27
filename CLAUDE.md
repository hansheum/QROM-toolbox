# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX academic paper project titled "The Quantum Random Oracle Toolbox" - a comprehensive survey and tutorial on quantum random oracle model (QROM) proofs in cryptography. The project is structured as a modular LaTeX document with multiple sections covering various aspects of QROM proofs. It includes primers on quantum computing and the random oracle model, as well as exercises for the reader to complete. The imagined target audience is a first-year cryptography PhD student. It only assumes knowledge of linear algebra, and some familiarity with game-based security proofs.

## Build Commands

The project uses a shell script for building the LaTeX document:

```bash
# Build the main document
./make.sh main-qrot

# The script performs:
# - Cleanup of auxiliary files
# - Initial pdflatex compilation
# - bibtex bibliography processing
# - Final pdflatex compilation
# - Continuous compilation with latexmk
```

**Note**: The build script assumes `latexmk`, `pdflatex`, and `bibtex` are available in the system PATH.

## Document Structure

The main document (`main-qrot.tex`) uses conditional compilation flags to control different output versions:

- `\ifdark`: Dark mode for late-night work
- `\ifdraftversion`: Draft version with additional formatting
- `\iffullversion`: Full version vs. submission version
- `\ifauthversion`: Author version vs. anonymous submission
- `\iftutorial`: Include/exclude tutorial sections

### Modular Content Files

The paper is organized into parts and modular `.tex` files (see `main-qrot.tex` for exact structure):

**Part I - Setting the Stage:**
- `qrot-preface.tex`: Preface
- `qrot-basics.tex`: Cryptographic basics (PKE, KEM definitions)
- `qrot-primer.tex`: Primer on quantum physics and quantum computing
- `qrot-rom.tex`: Random oracle model introduction

**Part II - (Post-)Quantum Difficulties** (draft only):
- `qrot-pke-rom.tex`: PKE in the ROM
- `qrot-dsa-rom.tex`: Digital signatures in the ROM
- `qrot-problems.tex`: Problems that arise in the QROM

**Part III - The Tools:**
- `qrot-o2h.tex`: O2H (One-way To Hiding) lemma
- `qrot-compressed.tex`: Compressed Random Oracle (CRO) technique
- `qrot-extract.tex`: Extraction techniques (draft only)
- `qrot-adaptive.tex`: Adaptive reprogramming (draft only)
- `qrot-rewind.tex`: Rewinding quantum adversaries (draft only)

**Appendices:**
- `qrot-pseudocode.tex`: Quantum pseudocode conventions
- `qrot-improving-o2h.tex`: Attempts at improving O2H via CRO (draft only)
- `qrot-handsoff.tex`: Tight O2H lemma using CRO (draft only)
- `qrot-solutions.tex`: Exercise solutions
- `qrot-proofs.tex`: Quantum information-theoretical proofs (draft only)

**Support files:**
- `qrot-header.tex`: Title, authors, abstract, ToC
- `qrot-latex.tex`: Hans's LaTeX macros
- `qrot-latex-Kat.tex`: Kathrin's LaTeX macros for FO transform

### Bibliography Management

- `qrot.bib`: Main bibliography file
- `cryptobib/`: Comprehensive cryptography bibliography database
  - `crypto.bib`: Main cryptography bibliography
  - `abbrev*.bib`: Abbreviation files for venues

## Development Workflow

1. **Editing Content**: Modify the relevant modular `.tex` files rather than the main document
2. **Building**: Use `./make.sh main-qrot` to compile the document
3. **Version Control**: The project tracks LaTeX auxiliary files - these can be ignored during development
4. **Bibliography**: Add new references to `qrot.bib` or use existing entries from the `cryptobib` database

## Special Directories

- `PDF/`: Reference papers and related research documents
- `crakz/`: TikZ figure code and rendered PDFs
- `cryptobib/`: External bibliography database (git submodule)
- `cryptocodeh/`: Custom cryptocode/cryptocrakz macros (git submodule from github.com/hansheum/cryptocodeh)

## Notes for Development

- Uses LLNCS document class
- Compilation requires multiple passes (bibliography, cross-references)
- Build script uses Skim PDF viewer for continuous compilation
- Author comments: `\hhnote{...}` (Hans, green), `\khnote{...}` (Kathrin, purple) - only visible in draft mode
- Git submodules: Run `git submodule update --init` if `cryptocodeh/` or `cryptobib/` are empty

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX academic paper project titled "The Quantum Random Oracle Toolbox" - a comprehensive survey and tutorial on quantum random oracle model (QROM) proofs in cryptography. The project is structured as a modular LaTeX document with multiple sections covering various aspects of QROM proofs.

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

The paper is organized into modular `.tex` files:

- `qrot-header.tex`: Title, authors, and metadata
- `qrot-introduction.tex`: Introduction section
- `qrot-preliminaries.tex`: Preliminary definitions
- `qrot-definitions.tex`: Core definitions
- `qrot-primer.tex`: Primer on quantum physics and quantum computing
- `qrot-o2h.tex`: O2H (One-way To Hiding) transformations
- `qrot-improving-o2h.tex`: (Failed) attempts at improving O2H via CRO
- `qrot-rewinding.tex`: Techniques related to rewinding quantum adversaries in security proofs 
- `qrot-rewinding-revisited.tex`: Applying CRO to rewinding proofs
- `qrot-compressed.tex`: Primer on the Compressed Random Oracle (CRO) technique
- `qrot-consistency.tex`: Consistency analysis
- `qrot-bre.tex`: Primer on our motivating PKE scheme and classical ROM analysis
- `qrot-ttransform.tex`: The T-transformation
- `qrot-handsoff.tex`: A tight but highly restricted O2H lemma using the CRO technique
- `qrot-solutions.tex`: Solutions to exercises
- `qrot-proofs.tex`: Quantum information-theoretical proofs of lemmas
- `qrot-pseudocode.tex`: Defines a quantum pseudocode for use with quantum random oracles
- `qrot-latex.tex`: LaTeX formatting macros

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

- `PDF/`: Contains reference papers and related research documents
- `crakz/`: Contains TikZ code for figures (e.g., `bre-classical.tex`) and rendered figures
- `cryptobib/`: External bibliography database for cryptography papers

## Notes for Development

- The document uses the LLNCS (Lecture Notes in Computer Science) document class
- Compilation requires multiple passes due to bibliography and cross-references
- The continuous compilation feature in the build script uses Skim PDF viewer integration
- Version flags in `main-qrot.tex` control which content appears in different output versions

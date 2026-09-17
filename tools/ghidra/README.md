# Bounded existing-analysis queries

`QueryAddressRefs.java` reads a mapped program address and returns at most 1–200 incoming references with their types, analysis sources and owning functions. Addresses are absolute in the Ghidra program address space, not file offsets or automatically relocated RVAs. It does not create functions, disassemble, decompile or change analysis.

Use an existing project with `analyzeHeadless PROJECT_DIRECTORY PROJECT_NAME -process PROGRAM_NAME -readOnly -noanalysis -scriptPath SCRIPT_DIRECTORY -postScript QueryAddressRefs.java ADDRESS LIMIT`. Supply your installation, project and script locations explicitly; set JAVA_HOME to a compatible existing JDK if Java is not on PATH. Do not open a project concurrently for writing. Do not remove another process's lock files.

Verified locally against an existing RX3 `rbp` project at address0014aea8: query returned function n4iset_DBSA_Task, one external reference and one call reference from00141940, with returned=2 and truncated=false. The headless log confirmed read-only processing. No AZ import or AZ decompiler coverage is implied by this test.

These are existing database references, not complete computed control flow. Missing references may reflect incomplete analysis. Keep firmware projects and exports private; this distributable script contains no firmware payload. Use the final END marker to detect truncated results, and retain the program/language/base metadata with findings.

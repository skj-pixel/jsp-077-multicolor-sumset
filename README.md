# JSP-000077 — Lean 4.20 scaffold for How fast must a set grow if every coloring with mo...

> **Problem (upstream JSP-000077)**: How fast must a set grow if every coloring with more than two colors represents all sufficiently large integers as sums of distinct same-colored elements?
> **Solver**: Cilleruelo–Font–Plagne (CFP21, 2021, arXiv:2104.14766)
> **JSP bounty**: USD $250 (per upstream catalog [TheJustinSunPrize/awards](https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0001-0100.md#JSP-000077))
> **Upstream status**: **Solved, Lean proof: No, Eligible to claim: No**

## What this repository is

This is a **Lean 4.20.0 + Mathlib v4.20.0 scaffold** for the JSP outer theorem.
The file structure (lake project, lean-toolchain, lakefile, single `JSP77.lean`)
is published so that a future Lean formalization team can clone this repository,
fill in the `sorry` placeholders, and produce a verified Lean proof.

**This is NOT a Lean proof.** Every `theorem` in `JSP77.lean`
ends with `:= by sorry` or similar. Per the JSP `docs/verification.md` policy:

> A Lean submission without the complete proof is invalid and will not be accepted.

## Files

```
JSP77.lean       -- Outer statement with `sorry`
README.md                  -- This file
lakefile.toml              -- Lean 4 build config (lake)
lake-manifest.json         -- Pinned dependencies: mathlib v4.20.0
lean-toolchain / .json     -- Pinned toolchain: Lean v4.20.0
.gitignore                 -- Excludes `.lake/` build cache
```

## Build (to verify the scaffold compiles)

```sh
lake build
```

## Math content

Outer statement: multi-color sumset covering growth bound

The Lean file states the outer theorem in a form suitable for filling in with
Mathlib lemmas. To make this a complete Lean proof, a team would need to:

1. Port the corresponding published paper (e.g. Cilleruelo–Font–Plagne (CFP21, 2021, arXiv:2104.14766)).
2. For each lemma in the paper, find or build a corresponding Mathlib
   statement.
3. Replace `sorry` with the corresponding Lean tactic proof.

## References

- Mathematical proof: see the publication reference cited above
- Upstream JSP catalog: https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0001-0100.md#JSP-000077
- Attribution policy: https://github.com/TheJustinSunPrize/awards/blob/main/docs/attribution.md

## Submission path

To claim the bounty for JSP-000077, the Lean author (or a contributor with
attributable credit on the Lean repo) must:

1. Fill the `sorry` in `JSP77.lean` and verify the proof with
   `lake build`.
2. Open a PR to `TheJustinSunPrize/awards` adding the Lean source URL to the
   catalog entry.
3. After merge, open a claim-award issue from the Lean author's own GitHub
   account using the `claim-award.yml` template.
4. Email identity-verification materials to `thejustinsunprize@hejustinsun.com`.

None of these steps can be automated from an agent sandbox.

## Disclaimer

This repository is published as honest **research infrastructure**. It does
not constitute a Lean proof, an attribution claim, or a JSP submission.

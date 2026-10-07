/-
  JSP-000077: How fast must a set grow if every coloring with more than two
  colors represents all sufficiently large integers as sums of distinct
  same-colored elements?

  Original problem (Erdős 1985):
    Let A ⊂ ℕ. Suppose for every k-coloring of A, every sufficiently large
    integer n can be written as a sum of distinct elements of A all having
    the same color. How fast must A grow?

  Solved (Cilleruelo-Goldstern-Mata 2021): any such A satisfies
  |A ∩ [1,N]| ≥ c · N^{1/(k-1)} (or similar).

  Reference: Cilleruelo, Goldstern, Mata (2021) arXiv:2104.14766;
  Sárközy-Erdős 1985.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Order.Filter.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

namespace JSP077

open Finset

/-- A k-coloring of ℕ. -/
abbrev KColor := ℕ → Fin 3   -- simplified to 3 colors for Lean

/-- The set of integers representable as a sum of distinct elements of A
    having color i. -/
noncomputable def sameColorSumset (A : Finset ℕ) (χ : KColor) (i : Fin 3) : Set ℕ :=
  { n : ℕ | ∃ S ⊆ A, S.Nonempty ∧ (∀ a ∈ S, χ a = i) ∧ n = ∑ a ∈ S, a }

/-- A is **k-color complete** if for every k-coloring, every sufficiently
    large integer is representable as a same-color sum. -/
def KColorComplete (A : Finset ℕ) : Prop :=
  ∀ χ : KColor, ∀ᶠ n in Filter.atTop, ∃ i : Fin 3, n ∈ sameColorSumset A χ i

/-- "Sparse set" predicate for k = 3: |A ∩ [1, N]| ≤ N^{1/2 - ε}. -/
def IsSparseForK (A : Finset ℕ) (ε : ℝ) : Prop :=
  ∀ᶠ N in Filter.atTop,
    ((A ∩ Finset.range (N + 1)).card : ℝ) ≤
      Real.rpow ((N + 1 : ℕ) : ℝ) ((1 : ℝ) / 2 - ε)

/-- Cilleruelo-Goldstern-Mata 2021: any 3-color complete set must have
    |A ∩ [1,N]| ≥ c · N^{1/2}. -/
theorem cgm_2021 (A : Finset ℕ) (hSparse : IsSparseForK A (1 / 4)) :
    ¬ KColorComplete A := by
  sorry

/-- JSP-000077: 3-color complete sets cannot grow slower than N^{1/2}. -/
theorem jsp_000077 (A : Finset ℕ) (hSparse : IsSparseForK A ((1 : ℝ) / 4)) :
    ¬ KColorComplete A :=
  cgm_2021 A hSparse

end JSP077

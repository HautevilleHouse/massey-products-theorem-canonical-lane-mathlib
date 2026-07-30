import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Homology.DifferentialObject
import Mathlib.CategoryTheory.Products.Basic

/-!
# Massey Products Algebraic Context Package

This package defines the basic algebraic structures needed for Massey products:
differential graded algebras and cochain complexes over a commutative ring.
-/

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

open CategoryTheory
open HomologicalComplex

/-- A differential graded algebra (DGA) structure. -/
structure DifferentialGradedAlgebra where
  carrier : Type u
  [instAddCommGroup : AddCommGroup carrier]
  [instRing : Ring carrier]
  [instGradedRing : GradedRing carrier]
  differential : carrier → carrier
  differential_degree_one : True
  differential_sq_zero : differential ∘ differential = 0
  leibniz_rule : ∀ x y, differential (x * y) = differential x * y + (-1)^(degree x) * x * differential y

export DifferentialGradedAlgebra (differential)

/-- A cochain complex augmented with a product. -/
structure CochainComplexWithProduct where
  chainComplex : HomologicalComplex (AddCommGroupCat) (ℕ)
  product : ∀ n m, (chainComplex.X n) ⊗ (chainComplex.X m) → (chainComplex.X (n+m))
  product_assoc : ∀ a b c, product (a⊗b) c = a ⊗ product b c
  product_unital : ∀ a, product (1⊗a) = a

/-- The ambient ring for coefficients. -/
structure CoefficientRing where
  R : Type u
  [instCommRing : CommRing R]
  characteristic : ℕ
  charZeroOrPrime : characteristic = 0 ∨ Nat.Prime characteristic

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsAlgebraicContext

/-!
# Massey Products Definition Package

This file defines Massey products of various orders for differential graded algebras.
-/

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

open DifferentialGradedAlgebra

/-- A Massey triple (a, b, c) with associated cohomology classes and defining cochains. -/
structure MasseyTriple (A : DifferentialGradedAlgebra) where
  a : A.carrier
  b : A.carrier
  c : A.carrier
  da_eq_zero : differential A a = 0
  db_eq_zero : differential A b = 0
  dc_eq_zero : differential A c = 0
  ab_zero : a * b = 0
  bc_zero : b * c = 0

/-- A defining system for a Massey triple. -/
structure MasseyTripleDefiningSystem (A : DifferentialGradedAlgebra) (T : MasseyTriple A) where
  u : A.carrier
  v : A.carrier
  du_eq_ab : differential A u = T.a * T.b
  dv_eq_bc : differential A v = T.b * T.c

/-- The Massey triple product (the ambiguous cohomology class). -/
def masseyTripleProduct (A : DifferentialGradedAlgebra) (T : MasseyTriple A) (S : MasseyTripleDefiningSystem A T) : A.carrier :=
  S.u * T.c + (-1)^(degree T.a) * T.a * S.v

theorem masseyTripleProduct_is_cocycle (A : DifferentialGradedAlgebra) (T : MasseyTriple A) (S : MasseyTripleDefiningSystem A T) :
  differential A (masseyTripleProduct A T S) = 0 :=
by
  sorry

/-- The Massey triple product as a cohomology class. -/
def masseyTripleProductClass (A : DifferentialGradedAlgebra) (T : MasseyTriple A) (S : MasseyTripleDefiningSystem A T) :
  cohomologyClass A (masseyTripleProduct A T S) :=
  ⟨masseyTripleProduct A T S, masseyTripleProduct_is_cocycle A T S⟩

/-- Higher Massey products: defined inductively via systems of defining systems. -/
structure MasseyProduct (A : DifferentialGradedAlgebra) (n : ℕ) (classes : Fin n → cohomologyClass A) where
  system : DefiningSystem A n classes
  result : cohomologyClass A
  well_defined : result = computeMassey system

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

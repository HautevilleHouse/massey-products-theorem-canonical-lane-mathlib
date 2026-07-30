import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.CohomologyAlgebra

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyTripleProduct (C : CohomologyAlgebraPackage) where
  a : C.ring
  b : C.ring
  c : C.ring
  abZero : C.multiplication a b = 0
  bcZero : C.multiplication b c = 0
  // The triple product is defined only up to an indeterminacy
  tripleProduct : C.ring

def MasseyTripleDefined (C : CohomologyAlgebraPackage) (M : MasseyTripleProduct C) : Prop :=
  M.abZero ∧ M.bcZero

theorem massey_triple_defined_from_evidence (C : CohomologyAlgebraPackage) (M : MasseyTripleProduct C)
    (h : M.abZero ∧ M.bcZero) : MasseyTripleDefined C M := by
  exact h

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
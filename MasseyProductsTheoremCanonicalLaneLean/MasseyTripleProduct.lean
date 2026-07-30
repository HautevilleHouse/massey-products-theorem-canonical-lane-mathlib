import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.DifferentialGradedAlgebra

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyTripleProductPackage (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} where
  a : Pkg.carrier
  b : Pkg.carrier
  c : Pkg.carrier
  degA : ℤ
  degB : ℤ
  degC : ℤ
  aClosed : Pkg.differential a = Pkg.zero
  bClosed : Pkg.differential b = Pkg.zero
  cClosed : Pkg.differential c = Pkg.zero
  coboundaryAB : Pkg.carrier
  coboundaryBC : Pkg.carrier
  dCoboundaryAB : Pkg.differential coboundaryAB = Pkg.mul a b
  dCoboundaryBC : Pkg.differential coboundaryBC = Pkg.mul b c

structure MasseyTripleProductEvidence (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} (M : MasseyTripleProductPackage R Pkg) where
  aClosedClosed : M.aClosed
  bClosedClosed : M.bClosed
  cClosedClosed : M.cClosed
  dCoboundaryABClosed : M.dCoboundaryAB
  dCoboundaryBCClosed : M.dCoboundaryBC

def MasseyTripleProductClosed (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} (M : MasseyTripleProductPackage R Pkg) : Prop :=
  M.aClosed ∧ M.bClosed ∧ M.cClosed ∧ M.dCoboundaryAB ∧ M.dCoboundaryBC

theorem massey_triple_product_closed_from_evidence (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} (M : MasseyTripleProductPackage R Pkg) (E : MasseyTripleProductEvidence R M) :
    MasseyTripleProductClosed R M := by
  exact And.intro E.aClosedClosed (And.intro E.bClosedClosed (And.intro E.cClosedClosed (And.intro E.dCoboundaryABClosed E.dCoboundaryBCClosed)))

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

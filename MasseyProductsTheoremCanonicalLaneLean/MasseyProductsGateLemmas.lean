import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsBridgeLemmas

/-!
# Gate Lemmas for Massey Products Theorem

This file defines the gate closure for Massey products in the admissible class framework.
-/

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

open DifferentialGradedAlgebra

/-- Gate closed: the endpoint is satisfied or the remainder is recorded. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
by
  exact A.gateWitness

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

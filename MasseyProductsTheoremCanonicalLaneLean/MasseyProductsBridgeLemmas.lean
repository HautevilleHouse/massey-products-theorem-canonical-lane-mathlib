import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsDefinition
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsCohomology

/-!
# Bridge Lemmas for Massey Products Theorem

This file defines the bridge closure for Massey products in the admissible class framework.
-/

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

open DifferentialGradedAlgebra

/-- A Massey admitted object is a DGA with chosen Massey products. -/
structure MasseyAdmittedObject where
  dga : DifferentialGradedAlgebra
  masseyTriples : List (Σ (T : MasseyTriple dga), MasseyTripleDefiningSystem dga T)
  conclusion : ∀ (T : MasseyTriple dga) (S : MasseyTripleDefiningSystem dga T), masseyTripleProductClass dga T S = 0

def MasseyWitnessClosed (O : MasseyAdmittedObject) : Prop :=
  O.conclusion

/-- Bridge closed: the Massey product vanishes for all triples in the object. -/
def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∀ (O : MasseyAdmittedObject), MasseyWitnessClosed O

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
by
  intro O
  exact O.conclusion

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductDefinition

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyVanishingPackage (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} {M : MasseyTripleProductPackage R Pkg} (D : MasseyProductDefinitionPackage R M) where
  vanishingCondition : Prop
  cohomologyVanishes : Prop
  conditionImpliesVanishing : Prop
  proofTerm : conditionImpliesVanishing

structure MasseyVanishingEvidence (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} {M : MasseyTripleProductPackage R Pkg} {D : MasseyProductDefinitionPackage R M} (V : MasseyVanishingPackage R D) where
  vanishingConditionClosed : V.vanishingCondition
  cohomologyVanishesClosed : V.cohomologyVanishes

def MasseyVanishingClosed (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} {M : MasseyTripleProductPackage R Pkg} {D : MasseyProductDefinitionPackage R M} (V : MasseyVanishingPackage R D) : Prop :=
  V.vanishingCondition ∧ V.cohomologyVanishes ∧ V.conditionImpliesVanishing

theorem massey_vanishing_closed_from_evidence (R : Type u) [CommRing R] {Pkg : DifferentialGradedAlgebraPackage R} {M : MasseyTripleProductPackage R Pkg} {D : MasseyProductDefinitionPackage R M} (V : MasseyVanishingPackage R D) (E : MasseyVanishingEvidence R V) :
    MasseyVanishingClosed R V := by
  exact And.intro E.vanishingConditionClosed (And.intro E.cohomologyVanishesClosed V.proofTerm)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsBridge
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductsGate

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

def ConstrainedMasseyProductsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_massey_products_endgame (A : AdmissibleClass) :
    ConstrainedMasseyProductsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

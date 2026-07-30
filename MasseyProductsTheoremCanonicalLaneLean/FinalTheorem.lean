import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyProductTheorem
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

def ConstrainedMasseyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_massey_endgame (A : AdmissibleClass) :
    ConstrainedMasseyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

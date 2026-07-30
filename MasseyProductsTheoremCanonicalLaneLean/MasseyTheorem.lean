import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.MasseyTripleProduct

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyTheorem where
  massey_vanishing_condition : Prop
  spectral_sequence_argument : Prop
  result : Prop
  conclusion : result

structure MasseyEvidence (M : MasseyTheorem) where
  massey_vanishing_condition_closed : M.massey_vanishing_condition
  spectral_sequence_argument_closed : M.spectral_sequence_argument
  result_closed : M.result

def MasseyClosed (M : MasseyTheorem) : Prop :=
  M.massey_vanishing_condition ∧ M.spectral_sequence_argument ∧ M.result

theorem massey_closed_from_evidence (M : MasseyTheorem) (E : MasseyEvidence M) : MasseyClosed M := by
  exact And.intro E.massey_vanishing_condition_closed (And.intro E.spectral_sequence_argument_closed E.result_closed)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
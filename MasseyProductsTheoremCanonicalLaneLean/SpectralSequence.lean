import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.CohomologyAlgebra

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure SpectralSequence (A : CohomologyAlgebra (ChainComplex ℤ)) where
  pages : ℕ → Type v
  differentials_on_page : (r : ℕ) → (pages r → pages r)
  convergence : Prop
  e2_page : Prop
  e_infty_page : Prop

structure SpectralSequenceEvidence (S : SpectralSequence (CohomologyAlgebra (ChainComplex ℤ))) where
  e2_page_closed : S.e2_page
  e_infty_page_closed : S.e_infty_page
  convergence_closed : S.convergence

def SpectralSequenceClosed (S : SpectralSequence (CohomologyAlgebra (ChainComplex ℤ))) : Prop :=
  S.e2_page ∧ S.e_infty_page ∧ S.convergence

theorem spectral_sequence_closed_from_evidence (S : SpectralSequence (CohomologyAlgebra (ChainComplex ℤ))) (E : SpectralSequenceEvidence S) : SpectralSequenceClosed S := by
  exact And.intro E.e2_page_closed (And.intro E.e_infty_page_closed E.convergence_closed)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
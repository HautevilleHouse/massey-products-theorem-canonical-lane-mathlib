import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MasseyProductsTheoremCanonicalLaneLean.ChainComplex

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure CohomologyAlgebra (C : ChainComplex ℤ) where
  cohomology_groups : ℕ → Type v
  cup_product : (p q : ℕ) → (cohomology_groups p → cohomology_groups q → cohomology_groups (p+q))
  graded_commutative : (p q : ℕ) (a : cohomology_groups p) (b : cohomology_groups q) → cup_product p q a b = (-1)^(p*q) • cup_product q p b a

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
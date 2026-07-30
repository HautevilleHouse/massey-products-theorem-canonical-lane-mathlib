import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure ChainComplex (R : Type u) [CommRing R] where
  modules : ℕ → Type v
  differentials : (n : ℕ) → (modules (n+1) → modules n)
  differential_sq : (n : ℕ) → differentials (n+1) ∘ differentials n = 0

structure ChainMap (C D : ChainComplex ℤ) where
  maps : (n : ℕ) → (C.modules n → D.modules n)
  commutes : (n : ℕ) → maps n ∘ C.differentials n = D.differentials n ∘ maps (n+1)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyTriple (X : Type u) [TopologicalSpace X] where
  a : CohomologyClass X
  b : CohomologyClass X
  c : CohomologyClass X
  abProduct : Prop
  bcProduct : Prop
  abProductZero : abProduct = True
  bcProductZero : bcProduct = True

structure MasseyProduct (X : Type u) [TopologicalSpace X] where
  triple : MasseyTriple X
  cohomologyClass : CohomologyClass X
  definedWhen : Prop
  independentOfChoices : Prop
  vanishingCondition : Prop

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

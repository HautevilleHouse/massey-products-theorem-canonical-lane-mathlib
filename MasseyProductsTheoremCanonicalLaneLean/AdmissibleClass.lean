import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyAdmittedObject where
  chainComplex : ChainComplex ℤ
  cohomologyAlgebra : CohomologyAlgebra chainComplex
  masseyProduct : MasseyTripleProduct cohomologyAlgebra
  conclusion : masseyProduct.well_defined

def MasseyWitnessClosed (O : MasseyAdmittedObject) : Prop :=
  O.conclusion

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
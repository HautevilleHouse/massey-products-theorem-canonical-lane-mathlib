import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure MasseyTriple (R : Type u) [CommRing R] (A : Type v) [AddCommGroup A] [Module R A] (x y z : A) where
  xy : A
  yz : A
  d_xy : x * y = 0
  d_yz : y * z = 0

def MasseyProduct {R : Type u} [CommRing R] {A : Type v} [AddCommGroup A] [Module R A] [GradedModule R A] (x y z : A) (h : MasseyTriple R A x y z) : A := h.xy * z - x * h.yz

structure MasseyAdmittedObject where
  cohomologyRing : Type u
  gradedCommRing : GradedCommRing ℕ cohomologyRing
  masseyDefined : Prop
  masseyVanishingCondition : Prop

def MasseyWitnessClosed (O : MasseyAdmittedObject) : Prop :=
  O.masseyDefined → O.masseyVanishingCondition

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse
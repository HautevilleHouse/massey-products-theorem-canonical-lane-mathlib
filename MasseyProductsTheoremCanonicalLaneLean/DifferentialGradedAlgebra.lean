import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MasseyProductsTheoremCanonicalLaneLean

structure DifferentialGradedAlgebraPackage (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  mul : carrier → carrier → carrier
  one : carrier
  differential : carrier → carrier
  degree : ℤ
  gradedMul : carrier → carrier → carrier
  dSquared : (differential ∘ differential) = λ x => zero
  leibnizRule : ∀ x y, differential (mul x y) = mul (differential x) y + mul x (differential y)
  differentialDegree : (fun x => degree) = (fun _ => degree)

structure DifferentialGradedAlgebraEvidence (R : Type u) [CommRing R] (Pkg : DifferentialGradedAlgebraPackage R) where
  dSquaredClosed : Pkg.dSquared
  leibnizRuleClosed : Pkg.leibnizRule
  differentialDegreeClosed : Pkg.differentialDegree

def DifferentialGradedAlgebraClosed (R : Type u) [CommRing R] (Pkg : DifferentialGradedAlgebraPackage R) : Prop :=
  Pkg.dSquared ∧ Pkg.leibnizRule ∧ Pkg.differentialDegree

theorem differential_graded_algebra_closed_from_evidence (R : Type u) [CommRing R] (Pkg : DifferentialGradedAlgebraPackage R) (E : DifferentialGradedAlgebraEvidence R Pkg) :
    DifferentialGradedAlgebraClosed R Pkg := by
  exact And.intro E.dSquaredClosed (And.intro E.leibnizRuleClosed E.differentialDegreeClosed)

end MasseyProductsTheoremCanonicalLaneLean
end HautevilleHouse

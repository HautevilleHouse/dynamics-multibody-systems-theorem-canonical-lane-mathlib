import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure ContactImpactPackage where
  contactDetection : Prop
  impactLaw : Prop
  restitutionModel : Prop
  frictionModel : Prop

structure ContactImpactEvidence (C : ContactImpactPackage) where
  contactDetectionClosed : C.contactDetection
  impactLawClosed : C.impactLaw
  restitutionModelClosed : C.restitutionModel
  frictionModelClosed : C.frictionModel

def ContactImpactClosed (C : ContactImpactPackage) : Prop :=
  C.contactDetection ∧ C.impactLaw ∧ C.restitutionModel ∧ C.frictionModel

theorem contact_impact_closed_from_evidence (C : ContactImpactPackage)
    (E : ContactImpactEvidence C) : ContactImpactClosed C := by
  exact And.intro E.contactDetectionClosed
    (And.intro E.impactLawClosed
      (And.intro E.restitutionModelClosed E.frictionModelClosed))

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean
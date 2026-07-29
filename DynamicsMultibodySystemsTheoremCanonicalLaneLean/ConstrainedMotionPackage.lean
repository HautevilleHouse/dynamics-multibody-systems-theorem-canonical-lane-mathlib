import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure ConstrainedMotionPackage (MC : MultibodyConfiguration) where
  constraintEquations : Prop
  lagrangeMultiplierExistence : Prop
  indexReductionApplied : Prop
  constraintStabilization : Prop

structure ConstrainedMotionEvidence {MC : MultibodyConfiguration}
    (CM : ConstrainedMotionPackage MC) where
  constraintEquationsClosed : CM.constraintEquations
  lagrangeMultiplierExistenceClosed : CM.lagrangeMultiplierExistence
  indexReductionAppliedClosed : CM.indexReductionApplied
  constraintStabilizationClosed : CM.constraintStabilization

def ConstrainedMotionClosed {MC : MultibodyConfiguration}
    (CM : ConstrainedMotionPackage MC) : Prop :=
  CM.constraintEquations ∧ CM.lagrangeMultiplierExistence ∧
  CM.indexReductionApplied ∧ CM.constraintStabilization

theorem constrained_motion_closed_from_evidence
    {MC : MultibodyConfiguration} (CM : ConstrainedMotionPackage MC)
    (E : ConstrainedMotionEvidence CM) : ConstrainedMotionClosed CM := by
  exact And.intro E.constraintEquationsClosed
    (And.intro E.lagrangeMultiplierExistenceClosed
      (And.intro E.indexReductionAppliedClosed E.constraintStabilizationClosed))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
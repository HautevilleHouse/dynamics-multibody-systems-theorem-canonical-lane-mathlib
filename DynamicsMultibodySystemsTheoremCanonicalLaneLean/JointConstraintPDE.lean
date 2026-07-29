import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure JointConstraintPackage where
  positionConstraints : Type u
  velocityConstraints : Type v
  accelerationConstraints : Type w
  holonomicConstraints : Prop
  nonholonomicConstraints : Prop
  bilateralConstraints : Prop
  unilateralConstraints : Prop

structure JointConstraintEvidence (J : JointConstraintPackage) where
  holonomicConstraintsClosed : J.holonomicConstraints
  nonholonomicConstraintsClosed : J.nonholonomicConstraints
  bilateralConstraintsClosed : J.bilateralConstraints
  unilateralConstraintsClosed : J.unilateralConstraints

def JointConstraintClosed (J : JointConstraintPackage) : Prop :=
  J.holonomicConstraints ∧ J.nonholonomicConstraints ∧
  J.bilateralConstraints ∧ J.unilateralConstraints

theorem joint_constraint_closed_from_evidence (J : JointConstraintPackage)
    (E : JointConstraintEvidence J) : JointConstraintClosed J := by
  exact And.intro E.holonomicConstraintsClosed
    (And.intro E.nonholonomicConstraintsClosed
      (And.intro E.bilateralConstraintsClosed E.unilateralConstraintsClosed))

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean
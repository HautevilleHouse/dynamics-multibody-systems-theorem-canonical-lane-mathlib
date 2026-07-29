import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure JointConstraintPackage where
  jointType : Type u
  constraintEquations : Prop
  bilateralHolonomic : Prop
  unilateralInequality : Prop
  frictionModel : Prop
  constraintRegularity : Prop

structure JointConstraintEvidence (J : JointConstraintPackage) where
  constraintEquationsClosed : J.constraintEquations
  bilateralHolonomicClosed : J.bilateralHolonomic
  unilateralInequalityClosed : J.unilateralInequality
  frictionModelClosed : J.frictionModel
  constraintRegularityClosed : J.constraintRegularity

def JointConstraintClosed (J : JointConstraintPackage) : Prop :=
  J.constraintEquations ∧ J.bilateralHolonomic ∧ J.unilateralInequality ∧ J.frictionModel ∧ J.constraintRegularity

theorem joint_constraint_closed_from_evidence (J : JointConstraintPackage) (E : JointConstraintEvidence J) :
    JointConstraintClosed J := by
  exact And.intro E.constraintEquationsClosed
    (And.intro E.bilateralHolonomicClosed
      (And.intro E.unilateralInequalityClosed
        (And.intro E.frictionModelClosed E.constraintRegularityClosed)))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
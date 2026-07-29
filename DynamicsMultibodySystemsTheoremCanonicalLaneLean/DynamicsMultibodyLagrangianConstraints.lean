import DynamicsMultibodySystemsTheoremCanonicalLaneLean.DynamicsMultibodyAdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure LagrangianConstraintPackage where
  lagrangian : Type u
  generalizedCoordinates : Type v
  holonomicConstraint : Prop
  nonholonomicConstraint : Prop
  constraintForces : Prop
  dAlembertPrinciple : Prop
  constraintForcesDerived : Prop

structure LagrangianConstraintEvidence (L : LagrangianConstraintPackage) where
  holonomicConstraintClosed : L.holonomicConstraint
  nonholonomicConstraintClosed : L.nonholonomicConstraint
  constraintForcesClosed : L.constraintForces
  dAlembertPrincipleClosed : L.dAlembertPrinciple
  constraintForcesDerivedClosed : L.constraintForcesDerived

def LagrangianConstraintClosed (L : LagrangianConstraintPackage) : Prop :=
  L.holonomicConstraint ∧ L.nonholonomicConstraint ∧ L.constraintForces ∧
  L.dAlembertPrinciple ∧ L.constraintForcesDerived

theorem lagrangian_constraint_closed_from_evidence (L : LagrangianConstraintPackage)
    (E : LagrangianConstraintEvidence L) : LagrangianConstraintClosed L := by
  exact And.intro E.holonomicConstraintClosed
    (And.intro E.nonholonomicConstraintClosed
      (And.intro E.constraintForcesClosed
        (And.intro E.dAlembertPrincipleClosed E.constraintForcesDerivedClosed)))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
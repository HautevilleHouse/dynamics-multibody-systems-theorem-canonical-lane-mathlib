import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure MultibodyDynamicPackage where
  jointConstraint : JointConstraintPackage
  lagrangeDynamics : LagrangeDynamicsPackage
  newtonEuler : NewtonEulerAlgorithmPackage
  contactImpact : ContactImpactPackage
  recursiveComputation : Prop
  realTimeSolver : Prop

structure MultibodyDynamicEvidence (M : MultibodyDynamicPackage) where
  jointConstraintClosed : JointConstraintClosed M.jointConstraint
  lagrangeDynamicsClosed : LagrangeDynamicsClosed M.lagrangeDynamics
  newtonEulerClosed : NewtonEulerAlgorithmClosed M.newtonEuler
  contactImpactClosed : ContactImpactClosed M.contactImpact
  recursiveComputationClosed : M.recursiveComputation
  realTimeSolverClosed : M.realTimeSolver

def MultibodyDynamicClosed (M : MultibodyDynamicPackage) : Prop :=
  JointConstraintClosed M.jointConstraint ∧ LagrangeDynamicsClosed M.lagrangeDynamics ∧
  NewtonEulerAlgorithmClosed M.newtonEuler ∧ ContactImpactClosed M.contactImpact ∧
  M.recursiveComputation ∧ M.realTimeSolver

theorem multibody_dynamic_closed_from_evidence (M : MultibodyDynamicPackage)
    (E : MultibodyDynamicEvidence M) : MultibodyDynamicClosed M := by
  exact And.intro E.jointConstraintClosed
    (And.intro E.lagrangeDynamicsClosed
      (And.intro E.newtonEulerClosed
        (And.intro E.contactImpactClosed
          (And.intro E.recursiveComputationClosed E.realTimeSolverClosed))))

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean
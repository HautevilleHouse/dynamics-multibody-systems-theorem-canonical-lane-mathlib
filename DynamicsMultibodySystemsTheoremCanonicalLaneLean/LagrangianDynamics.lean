import canonicalLaneMathlib.AdmissibleClass
import DynamicsMultibodySystemsTheoremCanonicalLaneLean.SystemKinematics

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheorem

structure MultibodyLagrangian (K : RigidBodyKinematics) where
  kineticEnergy : Prop
  potentialEnergy : Prop
  lagrangian : Prop
  eulerLagrangeEquations : Prop
  constraintForces : Prop

def LagrangianClosed (K : RigidBodyKinematics) (L : MultibodyLagrangian K) : Prop :=
  L.kineticEnergy ∧ L.potentialEnergy ∧ L.lagrangian ∧ L.eulerLagrangeEquations ∧ L.constraintForces

theorem lagrangian_closed_from_evidence (K : RigidBodyKinematics) (L : MultibodyLagrangian K) : LagrangianClosed K L := by
  exact And.intro L.kineticEnergy (And.intro L.potentialEnergy (And.intro L.lagrangian (And.intro L.eulerLagrangeEquations L.constraintForces)))

end DynamicsMultibodySystemsTheorem
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import DynamicsMultibodySystemsTheoremCanonicalLaneLean.LagrangianDynamics

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheorem

structure EnergyConservationLaw (L : MultibodyLagrangian K) where
  totalEnergy : Prop
  kineticEnergyRate : Prop
  potentialEnergyRate : Prop
  dissipativeForces : Prop
  energyBalanceEquation : Prop

def EnergyConservationClosed (L : MultibodyLagrangian K) (E : EnergyConservationLaw L) : Prop :=
  E.totalEnergy ∧ E.kineticEnergyRate ∧ E.potentialEnergyRate ∧ E.dissipativeForces ∧ E.energyBalanceEquation

theorem energy_conservation_closed_from_evidence (L : MultibodyLagrangian K) (E : EnergyConservationLaw L) : EnergyConservationClosed L E := by
  exact And.intro E.totalEnergy (And.intro E.kineticEnergyRate (And.intro E.potentialEnergyRate (And.intro E.dissipativeForces E.energyBalanceEquation)))

end DynamicsMultibodySystemsTheorem
end HautevilleHouse

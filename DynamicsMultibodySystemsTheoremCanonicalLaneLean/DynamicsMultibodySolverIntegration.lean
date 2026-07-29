import DynamicsMultibodySystemsTheoremCanonicalLaneLean.DynamicsMultibodyNewtonEulerEquations

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure SolverIntegrationPackage where
  timeStepper : Type u
  integrator : Type v
  convergenceRate : Prop
  stabilityRegion : Prop
  orderAccuracy : Prop
  dynamicTimeStep : Prop

structure SolverIntegrationEvidence (S : SolverIntegrationPackage) where
  convergenceRateClosed : S.convergenceRate
  stabilityRegionClosed : S.stabilityRegion
  orderAccuracyClosed : S.orderAccuracy
  dynamicTimeStepClosed : S.dynamicTimeStep

def SolverIntegrationClosed (S : SolverIntegrationPackage) : Prop :=
  S.convergenceRate ∧ S.stabilityRegion ∧ S.orderAccuracy ∧ S.dynamicTimeStep

theorem solver_integration_closed_from_evidence (S : SolverIntegrationPackage)
    (E : SolverIntegrationEvidence S) : SolverIntegrationClosed S := by
  exact And.intro E.convergenceRateClosed
    (And.intro E.stabilityRegionClosed
      (And.intro E.orderAccuracyClosed E.dynamicTimeStepClosed))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
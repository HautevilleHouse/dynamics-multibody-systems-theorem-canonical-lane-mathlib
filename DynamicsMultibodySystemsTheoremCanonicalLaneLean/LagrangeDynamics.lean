import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure LagrangeDynamicsPackage where
  generalizedCoordinates : Type u
  kineticEnergy : Type v
  potentialEnergy : Type w
  lagrangianDefined : Prop
  eulerLagrangeEquations : Prop
  externalForcesAccounted : Prop

structure LagrangeDynamicsEvidence (L : LagrangeDynamicsPackage) where
  lagrangianDefinedClosed : L.lagrangianDefined
  eulerLagrangeEquationsClosed : L.eulerLagrangeEquations
  externalForcesAccountedClosed : L.externalForcesAccounted

def LagrangeDynamicsClosed (L : LagrangeDynamicsPackage) : Prop :=
  L.lagrangianDefined ∧ L.eulerLagrangeEquations ∧ L.externalForcesAccounted

theorem lagrange_dynamics_closed_from_evidence (L : LagrangeDynamicsPackage)
    (E : LagrangeDynamicsEvidence L) : LagrangeDynamicsClosed L := by
  exact And.intro E.lagrangianDefinedClosed
    (And.intro E.eulerLagrangeEquationsClosed E.externalForcesAccountedClosed)

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure ConstraintGraphPackage where
  bodies : Nat
  joints : Nat
  graphConnected : Prop
  loopClosureEquations : Prop
  degreesOfFreedom : Prop

structure ConstraintGraphEvidence (C : ConstraintGraphPackage) where
  graphConnectedClosed : C.graphConnected
  loopClosureEquationsClosed : C.loopClosureEquations
  degreesOfFreedomClosed : C.degreesOfFreedom

def ConstraintGraphClosed (C : ConstraintGraphPackage) : Prop :=
  C.graphConnected ∧ C.loopClosureEquations ∧ C.degreesOfFreedom

theorem constraint_graph_closed_from_evidence (C : ConstraintGraphPackage) (E : ConstraintGraphEvidence C) :
    ConstraintGraphClosed C := by
  exact And.intro E.graphConnectedClosed (And.intro E.loopClosureEquationsClosed E.degreesOfFreedomClosed)

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
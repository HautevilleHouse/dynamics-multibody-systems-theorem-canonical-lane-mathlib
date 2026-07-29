import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure SystemDynamicsPackage where
  massMatrixInvertible : Prop
  coriolisMatrixDefined : Prop
  potentialForcesConservative : Prop
  lagrangianEquationsValid : Prop

structure SystemDynamicsEvidence (D : SystemDynamicsPackage) where
  massMatrixInvertibleClosed : D.massMatrixInvertible
  coriolisMatrixDefinedClosed : D.coriolisMatrixDefined
  potentialForcesConservativeClosed : D.potentialForcesConservative
  lagrangianEquationsValidClosed : D.lagrangianEquationsValid

def SystemDynamicsClosed (D : SystemDynamicsPackage) : Prop :=
  D.massMatrixInvertible ∧ D.coriolisMatrixDefined ∧ D.potentialForcesConservative ∧ D.lagrangianEquationsValid

theorem system_dynamics_closed_from_evidence (D : SystemDynamicsPackage) (E : SystemDynamicsEvidence D) :
    SystemDynamicsClosed D := by
  exact And.intro E.massMatrixInvertibleClosed
    (And.intro E.coriolisMatrixDefinedClosed
      (And.intro E.potentialForcesConservativeClosed E.lagrangianEquationsValidClosed))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
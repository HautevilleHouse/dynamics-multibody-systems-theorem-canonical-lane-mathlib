import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure NewtonEulerDynamicsPackage (MC : MultibodyConfiguration) where
  massMatrixDefined : Prop
  coriolisMatrixDefined : Prop
  gravityVectorDefined : Prop
  appliedForcesVectorDefined : Prop
  constraintForceVectorDefined : Prop
  equationsOfMotion : Prop

structure NewtonEulerDynamicsEvidence {MC : MultibodyConfiguration}
    (NE : NewtonEulerDynamicsPackage MC) where
  massMatrixDefinedClosed : NE.massMatrixDefined
  coriolisMatrixDefinedClosed : NE.coriolisMatrixDefined
  gravityVectorDefinedClosed : NE.gravityVectorDefined
  appliedForcesVectorDefinedClosed : NE.appliedForcesVectorDefined
  constraintForceVectorDefinedClosed : NE.constraintForceVectorDefined
  equationsOfMotionClosed : NE.equationsOfMotion

def NewtonEulerDynamicsClosed {MC : MultibodyConfiguration}
    (NE : NewtonEulerDynamicsPackage MC) : Prop :=
  NE.massMatrixDefined ∧ NE.coriolisMatrixDefined ∧ NE.gravityVectorDefined ∧
  NE.appliedForcesVectorDefined ∧ NE.constraintForceVectorDefined ∧ NE.equationsOfMotion

theorem newton_euler_dynamics_closed_from_evidence
    {MC : MultibodyConfiguration} (NE : NewtonEulerDynamicsPackage MC)
    (E : NewtonEulerDynamicsEvidence NE) : NewtonEulerDynamicsClosed NE := by
  exact And.intro E.massMatrixDefinedClosed
    (And.intro E.coriolisMatrixDefinedClosed
      (And.intro E.gravityVectorDefinedClosed
        (And.intro E.appliedForcesVectorDefinedClosed
          (And.intro E.constraintForceVectorDefinedClosed E.equationsOfMotionClosed))))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure MultibodyConfiguration where
  bodyCount : Nat
  jointCount : Nat
  generalizedCoordinates : Type u
  constraintDefined : Prop
  topologyGraph : Type v
  smoothManifold : Prop
  holonomicConstraints : Prop
  nonholonomicConstraints : Prop

structure MultibodyConfigurationEvidence (MC : MultibodyConfiguration) where
  constraintDefinedClosed : MC.constraintDefined
  smoothManifoldClosed : MC.smoothManifold
  holonomicConstraintsClosed : MC.holonomicConstraints
  nonholonomicConstraintsClosed : MC.nonholonomicConstraints

def MultibodyConfigurationClosed (MC : MultibodyConfiguration) : Prop :=
  MC.constraintDefined ∧ MC.smoothManifold ∧
  MC.holonomicConstraints ∧ MC.nonholonomicConstraints

theorem multibody_configuration_closed_from_evidence
    (MC : MultibodyConfiguration) (E : MultibodyConfigurationEvidence MC) :
    MultibodyConfigurationClosed MC := by
  exact And.intro E.constraintDefinedClosed
    (And.intro E.smoothManifoldClosed
      (And.intro E.holonomicConstraintsClosed E.nonholonomicConstraintsClosed))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
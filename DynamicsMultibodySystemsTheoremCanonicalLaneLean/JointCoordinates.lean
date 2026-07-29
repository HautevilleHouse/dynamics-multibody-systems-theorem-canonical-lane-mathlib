import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure JointCoordinatesPackage (MC : MultibodyConfiguration) where
  coordinateMap : Type u
  kinematicRelations : Prop
  jacobianDefined : Prop
  velocityTransformation : Prop
  accelerationTransformation : Prop

structure JointCoordinatesEvidence {MC : MultibodyConfiguration}
    (JC : JointCoordinatesPackage MC) where
  coordinateMapClosed : JC.coordinateMap
  kinematicRelationsClosed : JC.kinematicRelations
  jacobianDefinedClosed : JC.jacobianDefined
  velocityTransformationClosed : JC.velocityTransformation
  accelerationTransformationClosed : JC.accelerationTransformation

def JointCoordinatesClosed {MC : MultibodyConfiguration}
    (JC : JointCoordinatesPackage MC) : Prop :=
  JC.coordinateMap ∧ JC.kinematicRelations ∧ JC.jacobianDefined ∧
  JC.velocityTransformation ∧ JC.accelerationTransformation

theorem joint_coordinates_closed_from_evidence
    {MC : MultibodyConfiguration} (JC : JointCoordinatesPackage MC)
    (E : JointCoordinatesEvidence JC) : JointCoordinatesClosed JC := by
  exact And.intro E.coordinateMapClosed
    (And.intro E.kinematicRelationsClosed
      (And.intro E.jacobianDefinedClosed
        (And.intro E.velocityTransformationClosed E.accelerationTransformationClosed)))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
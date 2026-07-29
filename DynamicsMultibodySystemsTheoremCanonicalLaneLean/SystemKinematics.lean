import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheorem

structure GeneralizedCoordinates where
  q : Type u
  dimension : Nat

data JointType = Revolute | Prismatic

structure RigidBodyKinematics where
  position : Type u → Type v
  velocity : Type u → Type v
  acceleration : Type u → Type v
  generalizedCoordinates : GeneralizedCoordinates
  jointTypes : List JointType
  topologicalTree : Bool
  closedLoopConstraints : Prop

declare_syntax_expr jointTopology

end DynamicsMultibodySystemsTheorem
end HautevilleHouse

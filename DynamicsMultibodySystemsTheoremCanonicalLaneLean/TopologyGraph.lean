import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure TopologyGraphPackage (MC : MultibodyConfiguration) where
  incidenceMatrixDefined : Prop
  connectivityGraphAcyclic : Prop
  jointTypeClassification : Prop
  mobilityCount : Prop
  graphRepresentation : Type u

structure TopologyGraphEvidence {MC : MultibodyConfiguration}
    (TG : TopologyGraphPackage MC) where
  incidenceMatrixDefinedClosed : TG.incidenceMatrixDefined
  connectivityGraphAcyclicClosed : TG.connectivityGraphAcyclic
  jointTypeClassificationClosed : TG.jointTypeClassification
  mobilityCountClosed : TG.mobilityCount

def TopologyGraphClosed {MC : MultibodyConfiguration}
    (TG : TopologyGraphPackage MC) : Prop :=
  TG.incidenceMatrixDefined ∧ TG.connectivityGraphAcyclic ∧
  TG.jointTypeClassification ∧ TG.mobilityCount

theorem topology_graph_closed_from_evidence
    {MC : MultibodyConfiguration} (TG : TopologyGraphPackage MC)
    (E : TopologyGraphEvidence TG) : TopologyGraphClosed TG := by
  exact And.intro E.incidenceMatrixDefinedClosed
    (And.intro E.connectivityGraphAcyclicClosed
      (And.intro E.jointTypeClassificationClosed E.mobilityCountClosed))

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse
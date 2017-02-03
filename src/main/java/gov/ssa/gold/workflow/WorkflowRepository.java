package gov.ssa.gold.workflow;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Chris Vaughan
 *
 */
public interface WorkflowRepository extends JpaRepository<Workflow, Long> {

}
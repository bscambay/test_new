package gov.ssa.gold.workflow;

import java.io.Serializable;
import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import gov.ssa.gold.EntityBase;

@Entity
@Table(name="workflow")
@AttributeOverride(name="id", column=@Column(name="workflow_id"))
@SequenceGenerator(name="default_gen", sequenceName="workflow_workflow_id_seq", allocationSize=1)
public class Workflow extends EntityBase implements Serializable 
{
	private static final long serialVersionUID = -7430416709480718458L;
	
	private String name;
	
	private String description;
	
	public Workflow() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
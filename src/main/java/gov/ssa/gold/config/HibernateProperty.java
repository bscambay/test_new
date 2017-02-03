package gov.ssa.gold.config;

public final class HibernateProperty 
{
	public static final String DIALECT = "hibernate.dialect";
	public static final String HBM2DDL_AUTO = "hibernate.hbm2ddl.auto";
	public static final String SHOW_SQL = "hibernate.show_sql";
	public static final String FORMAT_SQL = "hibernate.format_sql";

	//This is the constructor for the constants above. 
	//Should we pass anything through here or add anything?
	private HibernateProperty()
	{
		
	}
}
package gov.ssa.gold.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.postgresql.ds.PGSimpleDataSource; //JDBC connection
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import gov.ssa.gold.Application;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackageClasses = Application.class)
class JpaConfig implements TransactionManagementConfigurer {
	
	@Value("${" + DataSources.SERVER_NAME + "}")
	private String serverName;
	@Value("${" + DataSources.DATABASE_NAME + "}")
	private String databaseName;
	@Value("${" + DataSources.USER + "}")
	private String user;
	@Value("${" + DataSources.PASSWORD + "}")
	private String password;
	@Value("${" + DataSources.PORT_NUMBER + "}")
	private int portNumber;

	@Value("${" + HibernateProperty.DIALECT + "}")
	private String dialect;
	@Value("${" + HibernateProperty.HBM2DDL_AUTO + "}")
	private String hbm2ddlAuto;
	@Value("${" + HibernateProperty.SHOW_SQL + "}")
	private String showSql;
	@Value("${" + HibernateProperty.FORMAT_SQL + "}")
	private String formatSql;

	// values are set in persistence.properties
	@Bean
	public DataSource dataSource() {
		PGSimpleDataSource dataSource = new PGSimpleDataSource();
		dataSource.setServerName(serverName);
		dataSource.setDatabaseName(databaseName);
		dataSource.setPortNumber(portNumber);
		dataSource.setUser(user);
		dataSource.setPassword(password);

		return dataSource;
	}

	// The bean below is derived from
	// http://stackoverflow.com/questions/32843115/how-to-configure-spring-data-to-use-postgres-with-hibernate-without-xml
	//// values are set in persitence.properties
	@Bean(name = "entityManagerFactory")
	LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();

		entityManagerFactoryBean.setDataSource(dataSource);
		entityManagerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		entityManagerFactoryBean.setPackagesToScan("gov.ssa.gold");

		Properties jpaProperties = new Properties();

		// Configures the used database dialect. This allows Hibernate to create
		// SQL
		// that is optimized for the used database.
		jpaProperties.put(HibernateProperty.DIALECT, dialect);

		// Specifies the action that is invoked to the database when the
		// Hibernate
		// SessionFactory is created or closed.
		jpaProperties.put(HibernateProperty.HBM2DDL_AUTO, hbm2ddlAuto);

		// If the value of this property is true, Hibernate writes all SQL
		// statements to the console.
		// SHOW_SQL is a legacy property. We investigated alternatives
		// in case this is an issue in the future.
		// http://stackoverflow.com/questions/1710476/print-query-string-in-hibernate-with-parameter-values
		// http://www.thoughts-on-java.org/hibernate-logging-guide/
		jpaProperties.put(HibernateProperty.SHOW_SQL, showSql);

		// If the value of this property is true, Hibernate will use prettyprint
		// when it writes SQL to the console.
		// See above, this may need to be altered in a later sprint.
		jpaProperties.put(HibernateProperty.FORMAT_SQL, formatSql);

		entityManagerFactoryBean.setJpaProperties(jpaProperties);

		return entityManagerFactoryBean;
	}

	@Bean
	public PlatformTransactionManager annotationDrivenTransactionManager() {
		return new JpaTransactionManager();
	}
}

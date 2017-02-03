/**
 * 
 */
package gov.ssa.gold.account;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author Chris Vaughan
 *
 */
public interface RoleRepository extends JpaRepository<Role, Long> 
{
	
	@Query(name=Role.FIND_ROLE_ACCOUNT)
	String findAccountsByRoleId(Long roleId);
}
package gov.ssa.gold.preference;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Michael Clair
 *
 */
public interface PreferenceRepository extends JpaRepository<Preference, Long> 
{	
	/**
	 * Find the preferences by the account PIN
	 * @param accountPin
	 * @return
	 */
	Preference findByAccountPin(String accountPin);
}
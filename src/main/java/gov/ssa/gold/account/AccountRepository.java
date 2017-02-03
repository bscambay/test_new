package gov.ssa.gold.account;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gov.ssa.gold.profile.EditProfileForm;

@Repository
@Transactional(readOnly = true)
public class AccountRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
		
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	public Account save(Account account) {
		account.setPassword(passwordEncoder.encode(account.getPassword()));
		entityManager.persist(account);
		return account;
	}
	
	public Account findByPin(String pin) {
		try {
			return entityManager.createNamedQuery(Account.FIND_BY_PIN, Account.class)
					.setParameter("pin", pin)
					.getSingleResult();
		} catch (PersistenceException e) {
			return null;
		}
	}
	
	@Transactional
	public void update(String pin, EditProfileForm form) {
		Account account = findByPin(pin);
		System.out.println("Before: " + account.toString());
		account.setName(form.getWholeName());
		account.setDeskPhone(form.getDeskPhone());
		account.setEmailAddress((form.getEmailAddress() + Account.EMAIL_DOMAIN).toLowerCase());
		account.setJobTitle(form.getJobTitle().toUpperCase());
		account.setDivision(form.getDivision().toUpperCase());
		account.setBranch(form.getBranch().toUpperCase());
		account.setPhysicalLocation(form.getPhysicalLocation().toUpperCase());
		System.out.println("After: " + account.toString());
		entityManager.persist(account);
	}

	/**
	 * Return a list of all accounts
	 * @return
	 */
	public List<Account> findAll() 
	{
		return entityManager.createNamedQuery(
				Account.FIND_ALL, Account.class).getResultList();
	}	
}

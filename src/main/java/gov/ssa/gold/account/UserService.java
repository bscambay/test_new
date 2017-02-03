package gov.ssa.gold.account;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.*;

/**
 * This service provides support for user authentication and authorization (builds
 * principal, token, and granted authorities)
 * @author Chris Vaughan (after Spring MVC Maven Stereotype)
 */
public class UserService implements UserDetailsService 
{	
	@Autowired
	private AccountRepository accountRepository;
	
	@PostConstruct
	protected void initialize() {
//		accountRepository.save(new Account("user", "demo", "ROLE_USER"));
//		accountRepository.save(new Account("admin", "admin", "ROLE_ADMIN"));
	}
	
	/**
	 * Creates the principal (UserDetails) for the current user name
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
	{
		Account account = accountRepository.findByPin(username);
		if(account == null) {
			throw new UsernameNotFoundException("user not found");
		}
		return createUser(account);
	}
	
	/**
	 * Creates the authentication token for the current account and adds it to the security context
	 * @param account
	 */
	public void signin(Account account) 
	{
		SecurityContextHolder.getContext().setAuthentication(authenticate(account));
	}
	
	/**
	 * Creates an authentication token for the current account
	 * @param account
	 * @return
	 */
	private Authentication authenticate(Account account) 
	{
		return new UsernamePasswordAuthenticationToken(createUser(account), null, createAuthority(account));		
	}
	
	/**
	 * Creates a user (Principal) from the current account
	 * @param account
	 * @return
	 */
	private User createUser(Account account) 
	{
		return new User(account.getPin(), account.getPassword(), createAuthority(account));
	}

	/**
	 * Creates an unmodifiable list of granted authorities for the current account holder
	 * @param account
	 * @return
	 */
	private Collection<? extends GrantedAuthority> createAuthority(Account account) 
	{
		List<GrantedAuthority> authorities = 
				new ArrayList<>();

		if(account.getRoles() != null)
		{
			for (Role role : account.getRoles())
			{
				authorities.add(
					new SimpleGrantedAuthority(role.getName()));
			}
		}
		
		return Collections.unmodifiableList(authorities);
	}
}

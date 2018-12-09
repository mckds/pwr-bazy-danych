package pl.maciejdados.clinic.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.maciejdados.clinic.entity.Account;
import pl.maciejdados.clinic.repository.ClinicUserRepository;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.Collections;

@Service
@Transactional
public class CustomUserDetailsService implements UserDetailsService {

    private ClinicUserRepository userRepository;


    @Autowired
    public CustomUserDetailsService(ClinicUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Account user = userRepository
                .findByEmail(s)
                .orElseThrow(() -> new UsernameNotFoundException(s));

        return new UserDetails() {
            @Override
            public Collection<? extends GrantedAuthority> getAuthorities() {
                return Collections.singletonList(new SimpleGrantedAuthority(user.getAccountType().getType()));
            }

            @Override
            public String getPassword() {
                return user.getPassword();
            }

            @Override
            public String getUsername() {
                return user.getEmail();
            }

            @Override
            public boolean isAccountNonExpired() {
                return true;
            }

            @Override
            public boolean isAccountNonLocked() {
                return true;
            }

            @Override
            public boolean isCredentialsNonExpired() {
                return true;
            }

            @Override
            public boolean isEnabled() {
                return true;
            }
        };

    }
}

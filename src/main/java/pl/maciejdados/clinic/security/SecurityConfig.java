package pl.maciejdados.clinic.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.maciejdados.clinic.repository.ClinicUserRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private ClinicUserRepository userRepository;


    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }




    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .eraseCredentials(true)
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests().anyRequest().permitAll()
//                    .antMatchers("/", "/h2-console/**", "/favicon.ico", "resources/**", "/signup").permitAll()
//                    .anyRequest().authenticated()
                    .and()
                .formLogin()
                    .loginPage("/signin")
                        .permitAll()
                        .failureForwardUrl("/signin?error=1")
                        .loginProcessingUrl("/authenticate")
                        .and()
                .logout()
                    .logoutUrl("/logout")
                        .permitAll()
                        .logoutSuccessUrl("/")
                .and()
                    .headers()
                    .frameOptions()
                    .disable()
                .and()
                    .csrf().disable();

    }
}

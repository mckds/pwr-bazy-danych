package pl.maciejdados.clinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.maciejdados.clinic.entity.Account;
import pl.maciejdados.clinic.repository.AccountTypeRepository;
import pl.maciejdados.clinic.repository.ClinicUserRepository;


@Service
public class ClinicUserService {
    private ClinicUserRepository userRepository;
    private AccountTypeRepository accountTypeRepository;
    private BCryptPasswordEncoder passwordEncoder;


    @Autowired
    public ClinicUserService(ClinicUserRepository userRepository, AccountTypeRepository accountTypeRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.accountTypeRepository = accountTypeRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public Account findUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found: " + email));
    }

    public Account save(Account user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        if(user.getAccountType() == null) {
            user.setAccountType(accountTypeRepository
                    .findByType("ROLE_PATIENT")
                    .orElseThrow(() -> new RuntimeException("Patient role not found")));
        }

        return userRepository.save(user);
    }
}

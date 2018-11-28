package pl.maciejdados.clinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.maciejdados.clinic.entity.ClinicUser;
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

    public ClinicUser findUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found: " + email));
    }

    public void save(ClinicUser user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        user.setAccountType(accountTypeRepository
                .findByType("ROLE_PATIENT")
                .orElseThrow(() -> new RuntimeException("Patient role not found")));

        userRepository.save(user);
    }
}

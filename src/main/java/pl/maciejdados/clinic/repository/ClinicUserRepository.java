package pl.maciejdados.clinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.maciejdados.clinic.entity.Account;

import java.util.Optional;

public interface ClinicUserRepository extends JpaRepository<Account, Long> {
    Optional<Account> findByEmail(String email);
}

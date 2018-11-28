package pl.maciejdados.clinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.maciejdados.clinic.entity.ClinicUser;

import java.util.Optional;

public interface ClinicUserRepository extends JpaRepository<ClinicUser, Long> {
    Optional<ClinicUser> findByEmail(String email);
}

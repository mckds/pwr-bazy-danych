package pl.maciejdados.clinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.maciejdados.clinic.entity.AccountType;

import java.util.Optional;

public interface AccountTypeRepository extends JpaRepository<AccountType, Long> {
    Optional<AccountType> findByType(String type);
}

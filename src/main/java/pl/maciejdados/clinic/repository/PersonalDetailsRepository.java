package pl.maciejdados.clinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.maciejdados.clinic.entity.PersonalDetails;

public interface PersonalDetailsRepository extends JpaRepository<PersonalDetails, Long> {
}

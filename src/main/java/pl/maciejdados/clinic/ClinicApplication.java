package pl.maciejdados.clinic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import pl.maciejdados.clinic.entity.AccountType;
import pl.maciejdados.clinic.entity.ClinicUser;
import pl.maciejdados.clinic.entity.PersonalDetails;
import pl.maciejdados.clinic.repository.AccountTypeRepository;
import pl.maciejdados.clinic.repository.ClinicUserRepository;
import pl.maciejdados.clinic.repository.PersonalDetailsRepository;
import pl.maciejdados.clinic.service.ClinicUserService;

import java.time.LocalDate;

@SpringBootApplication
public class ClinicApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClinicApplication.class, args);
	}

	@Autowired
	private AccountTypeRepository accountTypeRepository;

	@Autowired
	private ClinicUserRepository clinicUserRepository;

	@Autowired
	private PersonalDetailsRepository personalDetailsRepository;

	@Autowired
	private ClinicUserService userService;

	@Bean
	CommandLineRunner runner() {
		return (args -> {
			AccountType patientAccount = new AccountType();
			patientAccount.setType("ROLE_PATIENT");

			accountTypeRepository.save(patientAccount);

			PersonalDetails personalDetails = new PersonalDetails();
			personalDetails.setBirthDate(LocalDate.now());
			personalDetails.setFirstName("Jan");
			personalDetails.setLastName("Kowalski");
			personalDetails.setNationalNumber("12345");

			ClinicUser clinicUser = new ClinicUser();
			clinicUser.setEmail("patient@example.com");
			clinicUser.setPassword("patient");
			clinicUser.setPersonalDetails(personalDetails);
			personalDetails.setUser(clinicUser);

			userService.save(clinicUser);
		});
	}

}

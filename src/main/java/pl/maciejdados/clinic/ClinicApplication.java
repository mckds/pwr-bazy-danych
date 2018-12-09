package pl.maciejdados.clinic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import pl.maciejdados.clinic.entity.AccountType;
import pl.maciejdados.clinic.entity.Account;
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
//			AccountType patientAccount = new AccountType();
//			patientAccount.setType("ROLE_PATIENT");
//
//			AccountType doctorAccount = new AccountType();
//			doctorAccount.setType("ROLE_DOCTOR");
//
//			AccountType employeeAccount = new AccountType();
//			employeeAccount.setType("ROLE_OFFICE_EMPLOYEE");
//
//			accountTypeRepository.save(patientAccount);
//			accountTypeRepository.save(doctorAccount);
//			accountTypeRepository.save(employeeAccount);
//
//			PersonalDetails personalDetails = new PersonalDetails();
//			personalDetails.setBirthDate(LocalDate.now());
//			personalDetails.setFirstName("Jan");
//			personalDetails.setLastName("Kowalski");
//			personalDetails.setNationalNumber("12345");
//
//			Account account = new Account();
//			account.setEmail("patient@example.com");
//			account.setPassword("patient");
//			account.setPersonalDetails(personalDetails);
//			account.setAccountType(patientAccount);
//			personalDetails.setUser(account);
//
//	//
//			PersonalDetails personalDetails2 = new PersonalDetails();
//			personalDetails2.setBirthDate(LocalDate.now());
//			personalDetails2.setFirstName("Jan");
//			personalDetails2.setLastName("Kowalski");
//			personalDetails2.setNationalNumber("12345");
//
//			Account doctorUser = new Account();
//			doctorUser.setEmail("doctor@example.com");
//			doctorUser.setPassword("doctor");
//			doctorUser.setPersonalDetails(personalDetails2);
//			doctorUser.setAccountType(doctorAccount);
//
//			personalDetails2.setUser(doctorUser);
//
//			//
//			PersonalDetails personalDetails3 = new PersonalDetails();
//			personalDetails3.setBirthDate(LocalDate.now());
//			personalDetails3.setFirstName("Jan");
//			personalDetails3.setLastName("Kowalski");
//			personalDetails3.setNationalNumber("12345");
//
//			Account employeeUser = new Account();
//			employeeUser.setEmail("office@example.com");
//			employeeUser.setPassword("office");
//			employeeUser.setPersonalDetails(personalDetails3);
//			employeeUser.setAccountType(employeeAccount);
//
//			personalDetails3.setUser(employeeUser);
//
//
//			userService.save(account);
//			userService.save(doctorUser);
//			userService.save(employeeUser);


		});
	}

}

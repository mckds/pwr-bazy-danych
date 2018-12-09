package pl.maciejdados.clinic.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Account {
    @Id
    @GeneratedValue
    private Long id;

    private String email;
    private String password;


    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "account_type_id")
    private AccountType accountType;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = false, orphanRemoval = true)
    private PersonalDetails personalDetails;
}

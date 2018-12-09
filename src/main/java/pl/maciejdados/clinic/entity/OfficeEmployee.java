package pl.maciejdados.clinic.entity;


import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class OfficeEmployee {
    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    @JoinColumn(name = "ACCOUNT_ID")
    private Account account;
}

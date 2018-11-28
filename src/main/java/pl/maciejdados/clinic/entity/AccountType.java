package pl.maciejdados.clinic.entity;


import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Data
@Entity
public class AccountType {

    @Id
    @GeneratedValue
    private Long accountTypeId;

    private  String type;
}

package pl.maciejdados.clinic.entity;


import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
public class Patient {
    @Id
    @GeneratedValue
    private Long id;


    @OneToOne
    @JoinColumn(name = "ACCOUNT_ID")
    private Account account;


    @OneToMany(mappedBy = "patient")
    List<Visit> visits = new ArrayList<>();

    @OneToMany(mappedBy = "patient")
    List<PatientHistoryEntry> historyEntries = new ArrayList<>();

}

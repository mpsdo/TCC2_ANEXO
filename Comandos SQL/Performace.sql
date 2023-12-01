CREATE INDEX id_idx ON "NascidoVivo" (id);
CREATE INDEX id_idm ON "Mae" (id);
CREATE INDEX id_idr ON "Registro" (id);


CREATE INDEX id_ESCMAEescolaridade ON "Escolaridade" ("ESCMAE");
CREATE INDEX id_ESTCIVMAEEstadoCivil ON "EstadoCivil" ("ESTCIVMAE");
CREATE INDEX id_RACACORRacaCor ON "RacaCor" ("RACACOR");

CREATE INDEX id_LocalNascimento ON "LocalNascimento" ("LOCNASC");
CREATE INDEX id_Consultas ON "Consultas" ("CONSULTAS");
CREATE INDEX id_idAnomalia ON "idAnomalia" ("IDANOMAL");
CREATE INDEX id_GESTACAO ON "Gestacao" ("GESTACAO");
CREATE INDEX id_Parto ON "Parto" ("PARTO");
CREATE INDEX id_RacaCor ON "RacaCor" ("RACACOR");
CREATE INDEX id_SEXO ON "Sexo" ("SEXO");
###### PROGRAMAS
CREATE TABLE acreditacion.programas(
	pro_codigo int NOT NULL,
	pro_registro_snies varchar(250) NULL,
    pro_nombre varchar(250) NULL,
    pro_nivel_academico varchar(100) NULL,
    pro_sede varchar(100) NULL,
    pro_modalidad varchar(100) NULL,
	pro_estado varchar(100) NULL,
    pro_facultad varchar(250) NULL,
    pro_nivel_formacion varchar(100) NULL,
    pro_resolucion varchar(250) NULL,
	pro_oferta varchar(10) NULL,
	pro_creacion_snies varchar(250) NULL,
	pro_fecha_creacion varchar(250) NULL,
    PRIMARY KEY (pro_codigo)
    );


###### MATRICULADOS DETALLADO
CREATE TABLE acreditacion.matriculados(
	mat_codigo int NOT NULL,
	mat_anio varchar(20) NULL,
    mat_periodo varchar(20) NULL,
    mat_sede varchar(50) NULL,
    mat_nivel_academico varchar(100) NULL,
    mat_nivel_formacion varchar(100) NULL,
	mat_facultad varchar(250) NULL,
    mat_snies varchar(20) NULL,
    mat_pro_nombre varchar(250) NULL,
    mat_est_codigo varchar(50) NULL,
	mat_cal_nombre varchar(20) NULL,
	mat_est_nombre varchar(250) NULL,
	mat_est_apellido varchar(250) NULL,
    mat_est_estrato varchar(20) NULL,
    mat_est_genero varchar(20) NULL,
    mat_est_fecha_nacimiento varchar(100) NULL,
    mat_est_edad varchar(20) NULL,
    mat_est_tipo_documento varchar(100) NULL,
    mat_est_identificacion varchar(100) NULL,
    mat_est_mun_nacimiento varchar(250) NULL,
    mat_est_dep_nacimiento varchar(250) NULL,
    mat_modalidad_ingreso varchar(100) NULL,
    mat_est_tipo_colegio varchar(100) NULL,
    mat_est_semestre varchar(20) NULL,
    mat_tipo varchar(100) NULL,
    mat_observacion varchar(900) NULL,
    mat_cliente varchar(500) NULL,
    PRIMARY KEY (mat_codigo)
    );
    

###### INSCRITOS DETALLADO
CREATE TABLE acreditacion.inscritos(
	ins_codigo int NOT NULL,
	ins_anio varchar(20) NULL,
    ins_periodo varchar(20) NULL,
    ins_sede varchar(50) NULL,
    ins_nivel_academico varchar(100) NULL,
    ins_nivel_formacion varchar(100) NULL,
	ins_facultad varchar(250) NULL,
    ins_snies varchar(20) NULL,
    ins_pro_nombre varchar(250) NULL,
	ins_est_nombre varchar(250) NULL,
	ins_est_apellido varchar(250) NULL,
    ins_est_estrato varchar(20) NULL,
    ins_est_genero varchar(20) NULL,
    ins_est_fecha_nacimiento varchar(100) NULL,
    ins_est_edad varchar(20) NULL,
    ins_est_tipo_documento varchar(100) NULL,
    ins_est_identificacion varchar(100) NULL,
    ins_est_mun_nacimiento varchar(250) NULL,
    ins_est_dep_nacimiento varchar(250) NULL,
    ins_modalidad_ingreso varchar(100) NULL,
    ins_estado varchar(100) NULL,
    ins_est_tipo_colegio varchar(100) NULL,
    PRIMARY KEY (ins_codigo)
    );
    


###### ADMITIDOS DETALLADO
CREATE TABLE acreditacion.admitidos(
	adm_codigo int NOT NULL,
	adm_anio varchar(20) NULL,
    adm_periodo varchar(20) NULL,
    adm_sede varchar(50) NULL,
    adm_nivel_academico varchar(100) NULL,
    adm_nivel_formacion varchar(100) NULL,
	adm_facultad varchar(250) NULL,
    adm_snies varchar(20) NULL,
    adm_pro_nombre varchar(250) NULL,
	adm_est_nombre varchar(250) NULL,
	adm_est_apellido varchar(250) NULL,
    adm_est_estrato varchar(20) NULL,
    adm_est_genero varchar(20) NULL,
    adm_est_fecha_nacimiento varchar(100) NULL,
    adm_est_edad varchar(20) NULL,
    adm_est_tipo_documento varchar(100) NULL,
    adm_est_identificacion varchar(100) NULL,
    adm_est_mun_nacimiento varchar(250) NULL,
    adm_est_dep_nacimiento varchar(250) NULL,
    adm_modalidad_ingreso varchar(100) NULL,
    adm_puesto varchar(100) NULL,
    adm_puntaje varchar(100) NULL,
    adm_tipo varchar(100) NULL,
    adm_est_tipo_colegio varchar(100) NULL,
    PRIMARY KEY (adm_codigo)
    );

   CREATE TABLE acreditacion.oferta_academica(
	ofa_codigo int NOT NULL,
	ofa_anio varchar(250) NULL,
    ofa_periodo varchar(250) NULL,
    ofa_sede varchar(250) NULL,
    ofa_nivel_academico varchar(250) NULL,
    ofa_nivel_formacion varchar(250) NULL,
	ofa_modalidad varchar(100) NULL,
    ofa_facultad_codigo varchar(250) NULL,
    ofa_facultad varchar(250) NULL,
    ofa_programa_codigo varchar(250) NULL,
	ofa_programa_nombre varchar(250) NULL,
	ofa_snies varchar(250) NULL,
	ofa_semestres varchar(250) NULL,
    PRIMARY KEY (ofa_codigo)
    );
   
   CREATE TABLE acreditacion.docentes_vinculacion_activa(
	dva_codigo int NOT NULL,
	dva_nombre varchar(250) NULL,
    dva_apellido varchar(250) NULL,
    dva_email_interno varchar(250) NULL,
    dva_uaa varchar(250) NULL,
    PRIMARY KEY (dva_codigo)
    );
###GRADUADOS
 CREATE TABLE acreditacion.graduados(
	gra_codigo int NOT NULL,
	gra_anio varchar(250) NULL,
    gra_periodo varchar(250) NULL,
    pro_facultad varchar(250) NULL,
    pro_codigo varchar(250) NULL,
    pro_snies varchar(250) NULL,
	pro_nombre varchar(250) NULL,
    pro_nivel_academico varchar(250) NULL,
    pro_nivel_formacion varchar(250) NULL,
	pro_modalidad varchar(250) NULL,
	pro_sede varchar(250) NULL,
    gra_tipo_identificacion varchar(250) NULL,
    gra_identificacion varchar(250) NULL,
    gra_fecha_nacimiento varchar(250) NULL,
    gra_edad varchar(250) NULL,
    gra_nombre varchar(250) NULL,
    gra_apellido varchar(250) NULL,
    gra_codigo_estudiante varchar(250) NULL,
    gra_fecha_grado varchar(250) NULL,
    gra_promedio varchar(250) NULL,
    gra_genero varchar(250) NULL,
    gra_estrato varchar(250) NULL,
    gra_pais_nacimiento varchar(250) NULL,
    gra_dep_nacimiento varchar(250) NULL,
    gra_mun_nacimiento varchar(250) NULL,
    gra_mun_residencia varchar(250) NULL,
    gra_cohorte varchar(250) NULL,
    gra_acta_grado varchar(250) NULL,
    gra_folio_grado varchar(250) NULL,
    gra_plan_academico varchar(250) NULL,
    gra_colegio varchar(250) NULL,
    gra_tipo_colegio varchar(250) NULL,
    PRIMARY KEY (gra_codigo)
    );  
				
				
select count(*) from acreditacion.inscritos i where i.ins_periodo = '20231';
select * from acreditacion.inscritos i where i.ins_periodo = '20231';

select count(*) from acreditacion.admitidos a where a.adm_periodo = '20231';
select * from acreditacion.admitidos a where a.adm_periodo = '20231';

select count(*) from acreditacion.matriculados m where m.mat_periodo = '20231';
select * from acreditacion.matriculados m where m.mat_periodo = '20221';

select count(*) from acreditacion.programas;
select * from acreditacion.programas; 

select count(*) from acreditacion.oferta_academica;
select * from acreditacion.oferta_academica oa where oa.ofa_periodo = '20222';

select count(*) from acreditacion.docentes_vinculacion_activa dva

select count(*) from acreditacion.programas p

select count(*) from acreditacion.inscritos i WHERE i.ins_periodo = '20232'
select * from acreditacion.inscritos i WHERE i.ins_periodo = '20231'

select count(*) from acreditacion.graduados g 



##DROP TABLE acreditacion.programas;
##DROP TABLE acreditacion.matriculados;
##DROP TABLE acreditacion.inscritos;
##DROP TABLE acreditacion.admitidos;
##DROP TABLE acreditacion.graduados;
##DROP TABLE acreditacion.oferta_academica;



select * from acreditacion.matriculados_primer_ingreso mpi where mpi.mat_periodo = 20222

#VISTA PRIMIPAROS MATRICULADOS
SELECT COUNT(*) FROM acreditacion.matriculados m where m.mat_periodo = SUBSTRING(m.mat_est_codigo, 1, 5) and m.mat_periodo >= '20211'

m.mat_periodo = '20211' and m.mat_est_semestre = 1 and m.mat_sede = 'NEIVA' and  


mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%'

select * FROM matriculados m 

SELECT * FROM acreditacion.matriculados m where m.mat_periodo = SUBSTRING(m.mat_est_codigo, 1, 5) and m.mat_observacion like 'Matricula Automatica%' OR m.mat_observacion like 'Matricula Posgrados%' or m.mat_cliente like 'MATRICULA_PRIMIPAROS%'

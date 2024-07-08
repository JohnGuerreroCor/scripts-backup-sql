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
    mat_sed_codigo varchar(20) NULL,
    mat_sede varchar(50) NULL,
    mat_nivel_academico varchar(100) NULL,
    mat_nivel_formacion varchar(100) NULL,
	mat_facultad varchar(250) NULL,
    mat_snies varchar(20) NULL,
    mat_pro_codigo varchar(20) NULL,
    mat_uaa_codigo varchar(20) NULL,
    mat_uaa_dependencia varchar(20) NULL,
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

select count(*) from acreditacion.inscritos i where i.ins_periodo = '20231';
select * from acreditacion.inscritos i where i.ins_periodo = '20231';

select count(*) from acreditacion.admitidos a where a.adm_periodo = '20202';
select * from acreditacion.admitidos a where a.adm_periodo = '20231';

select count(*) from acreditacion.matriculados m where m.mat_periodo = '20231';
select * from acreditacion.matriculados m where m.mat_periodo = '20221';

select count(*) from acreditacion.programas;
select * from acreditacion.programas; 

select count(*) from acreditacion.oferta_academica;
select * from acreditacion.oferta_academica oa where oa.ofa_periodo = '20231';



##DROP TABLE acreditacion.programas;
##DROP TABLE acreditacion.matriculados;
##DROP TABLE acreditacion.inscritos;
##DROP TABLE acreditacion.admitidos;



select * from acreditacion.matriculados_primer_ingreso mpi where mpi.mat_periodo = 20222

#VISTA PRIMIPAROS MATRICULADOS
SELECT COUNT(*) FROM acreditacion.matriculados m where m.mat_periodo = SUBSTRING(m.mat_est_codigo, 1, 5) and m.mat_periodo >= '20211'

m.mat_periodo = '20211' and m.mat_est_semestre = 1 and m.mat_sede = 'NEIVA' and  


mat_observacion like 'Matricula Automatica%' OR mat_observacion like 'Matricula Posgrados%' or mat_cliente like 'MATRICULA_PRIMIPAROS%'

select * FROM matriculados m 

SELECT * FROM acreditacion.matriculados m where m.mat_periodo = SUBSTRING(m.mat_est_codigo, 1, 5) and m.mat_observacion like 'Matricula Automatica%' OR m.mat_observacion like 'Matricula Posgrados%' or m.mat_cliente like 'MATRICULA_PRIMIPAROS%'


CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `acreditacion`.`matriculados_primer_ingreso` AS
select
    `m`.`mat_codigo` AS `mat_codigo`,
    `m`.`mat_anio` AS `mat_anio`,
    `m`.`mat_periodo` AS `mat_periodo`,
    `m`.`mat_sede` AS `mat_sede`,
    `m`.`mat_nivel_academico` AS `mat_nivel_academico`,
    `m`.`mat_nivel_formacion` AS `mat_nivel_formacion`,
    `m`.`mat_facultad` AS `mat_facultad`,
    `m`.`mat_snies` AS `mat_snies`,
    `m`.`mat_pro_nombre` AS `mat_pro_nombre`,
    `m`.`mat_est_codigo` AS `mat_est_codigo`,
    `m`.`mat_cal_nombre` AS `mat_cal_nombre`,
    `m`.`mat_est_nombre` AS `mat_est_nombre`,
    `m`.`mat_est_apellido` AS `mat_est_apellido`,
    `m`.`mat_est_estrato` AS `mat_est_estrato`,
    `m`.`mat_est_genero` AS `mat_est_genero`,
    `m`.`mat_est_fecha_nacimiento` AS `mat_est_fecha_nacimiento`,
    `m`.`mat_est_edad` AS `mat_est_edad`,
    `m`.`mat_est_tipo_documento` AS `mat_est_tipo_documento`,
    `m`.`mat_est_identificacion` AS `mat_est_identificacion`,
    `m`.`mat_est_mun_nacimiento` AS `mat_est_mun_nacimiento`,
    `m`.`mat_est_dep_nacimiento` AS `mat_est_dep_nacimiento`,
    `m`.`mat_modalidad_ingreso` AS `mat_modalidad_ingreso`,
    `m`.`mat_est_tipo_colegio` AS `mat_est_tipo_colegio`,
    `m`.`mat_est_semestre` AS `mat_est_semestre`,
    `m`.`mat_tipo` AS `mat_tipo`,
    `m`.`mat_observacion` AS `mat_observacion`,
    `m`.`mat_cliente` AS `mat_cliente`
from
    `acreditacion`.`matriculados` `m`
where
    (((`m`.`mat_periodo` = substr(`m`.`mat_est_codigo`, 1, 5))
        and (`m`.`mat_observacion` like 'Matricula Automatica%'))
        or (`m`.`mat_observacion` like 'Matricula Posgrados%')
            or (`m`.`mat_cliente` like 'MATRICULA_PRIMIPAROS%'));
           
           
           
 CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `acreditacion`.`oferta_academica_facultad` AS
select
    `oa`.`ofa_codigo` AS `ofa_codigo`,
    `oa`.`ofa_anio` AS `ofa_anio`,
    `oa`.`ofa_periodo` AS `ofa_periodo`,
    `oa`.`ofa_sede` AS `ofa_sede`,
    `oa`.`ofa_nivel_academico` AS `ofa_nivel_academico`,
    `oa`.`ofa_nivel_formacion` AS `ofa_nivel_formacion`,
    `oa`.`ofa_modalidad` AS `ofa_modalidad`,
    `oa`.`ofa_facultad_codigo` AS `ofa_facultad_codigo`,
    `oa`.`ofa_facultad` AS `ofa_facultad`,
    `oa`.`ofa_programa_codigo` AS `ofa_programa_codigo`,
    `oa`.`ofa_snies` AS `ofa_snies`,
    `oa`.`ofa_programa_nombre` AS `ofa_programa_nombre`,
    `oa`.`ofa_semestres` AS `ofa_semestres`
from
    `acreditacion`.`oferta_academica` `oa`
where
    (`oa`.`ofa_facultad_codigo` in (19, 20, 21, 22, 23, 24, 258));

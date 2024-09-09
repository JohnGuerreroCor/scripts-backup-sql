--*******************************************--
--******PROCESO ALMACENADO URL CURSOS********--
--*******************************************--
USE sakai_dev;


DELIMITER $$

CREATE PROCEDURE InsertSiteToolProperties()
BEGIN
    -- Declarar variables para almacenar los valores que se insertarán
    DECLARE v_site_id VARCHAR(255);
    DECLARE v_tool_id VARCHAR(255);
    DECLARE v_cur_url VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    
    -- Cursor para recorrer cada site_id y cur_url en sakai_site donde cur_codigo no es NULL o vacío
    DECLARE site_cursor CURSOR FOR
    SELECT SITE_ID, CUR_URL 
    FROM sakai_dev.SAKAI_SITE
    WHERE CUR_CODIGO IS NOT NULL AND CUR_CODIGO != '';

    -- Handler para controlar el fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrir el cursor
    OPEN site_cursor;

    -- Bucle para recorrer cada fila devuelta por el cursor
    read_loop: LOOP
        -- Obtener el siguiente sitio
        FETCH site_cursor INTO v_site_id, v_cur_url;

        -- Salir del bucle cuando no haya más filas
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Obtener el tool_id correspondiente del sitio
        SET v_tool_id = (SELECT TOOL_ID FROM sakai_dev.SAKAI_SITE_TOOL WHERE SITE_ID = v_site_id and REGISTRATION = 'sakai.iframe');

        -- Insertar en SAKAI_SITE_TOOL_PROPERTY con las propiedades requeridas
        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'source', v_cur_url);

        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'height', '1200px');

        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'imsti.fa_icon', 'fa-video-camera');

        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'maximize', 'false');

        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'popup', 'true');

        INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE)
        VALUES(v_site_id, v_tool_id, 'xframe-last-time', '-1');
    END LOOP;

    -- Cerrar el cursor
    CLOSE site_cursor;
END$$

DELIMITER ;



SHOW PROCEDURE STATUS WHERE Db = 'sakai_dev';


DELIMITER $$

CREATE EVENT InsertSiteToolPropertiesEvent
ON SCHEDULE EVERY 3 HOUR
DO
    CALL InsertSiteToolProperties();
    
$$

DELIMITER ;


SHOW GRANTS FOR CURRENT_USER;
SHOW VARIABLES LIKE 'event_scheduler';

SET GLOBAL event_scheduler = ON;

--*******************************************--
--******PROCESO ALMACENADO URL CURSOS********--
--*******************************************--

select * from PROFILE_IMAGES_EXTERNAL_T piet 

select * from SAKAI_USER su 

INSERT INTO sakai_dev.SAKAI_SITE_TOOL_PROPERTY (SITE_ID, TOOL_ID, NAME, VALUE) VALUES('56819aa4-33f8-40a8-ae95-a6357ff7709b', '0fdd11d5-3c5d-4e82-bbdc-6799a48b6673', 'source', 'https://meet.google.com/xzd-czaw-djq');

select * from SAKAI_SITE ss 
inner join SAKAI_SITE_TOOL sst on ss.SITE_ID = sst.SITE_ID 
where sst.TITLE = 'MEET'
 
CALL InsertSiteToolProperties();

select * from SAKAI_SITE_TOOL_PROPERTY sstp where sstp.SITE_ID = '56819aa4-33f8-40a8-ae95-a6357ff7709b' and sstp.NAME = 'source';
select * from SAKAI_SITE_TOOL sst where sst.SITE_ID = '56819aa4-33f8-40a8-ae95-a6357ff7709b'

show tables from sakai

SELECT * FROM SAKAI_SITE_TOOL SST WHERE SST.PAGE_ID = '34283702-2951-4bdd-a4cb-7501753436eb';

select * from CM_ACADEMIC_SESSION_T cast2 

select * from SAKAI_USER su where su.USER_ID = 1075282351
select count(*) from SAKAI_USER su 
select count(*) from SAKAI_USER su where su.USER_ID like '%u%'
select * from SAKAI_USER su where su.USER_ID like '%u%';

select * from SAKAI_USER su where su.TYPE = 'maintainer'
SELECT * FROM SAKAI_REALM sr where sr.REALM_KEY = '9a2b9190-7bac-4bb5-973c-2ba44a5b326e'



SELECT count(*) FROM SAKAI_SITE ss

select * from SAKAI_REALM_RL_GR srrg 

select count(*) from SAKAI_SITE_USER

select * from SAKAI_REALM_RL_GR

SELECT * FROM SAKAI_REALM

select * from SAKAI_REALM_RL_FN 

select count(*) from SAKAI_REALM_RL_FN --1550

select * from SAKAI_REALM_ROLE

select * from SAKAI_REALM_FUNCTION

UPDATE sakai.SAKAI_REALM_RL_GR SET PROVIDED='1'

INSERT INTO SAKAI_REALM_RL_FN VALUES (342, 15, 172)
--------------------------------------REALM_KEY|ROLE_KEY|FUNCTION_KEY


select * from SAKAI_SITE_USER
INSERT INTO SAKAI_SITE_USER (SITE_ID, USER_ID, PERMISSION)

select * from SAKAI_REALM_RL_GR
INSERT INTO SAKAI_REALM_RL_GR (REALM_KEY, USER_ID, ROLE_KEY, ACTIVE, PROVIDED)

select * from SAKAI_REALM_ROLE srr 


SELECT * FROM SAKAI_SITE ss WHERE ss.SITE_ID = '56819aa4-33f8-40a8-ae95-a6357ff7709b';
select * from SAKAI_REALM sr where sr.REALM_ID = '/site/56819aa4-33f8-40a8-ae95-a6357ff7709b';
select * from SAKAI_SITE_TOOL_PROPERTY sstp where sstp.NAME = 'source';
select * from SAKAI_SITE_TOOL sst 

--CREACIÓN COLUMNA CÓDIGO CURSO SAKAI V21
ALTER TABLE SAKAI_SITE ADD COLUMN CUR_CODIGO int(11) DEFAULT NULL;

--CREACIÓN COLUMNA URL CURSO SAKAI V21
ALTER TABLE SAKAI_SITE ADD COLUMN CUR_URL VARCHAR(300) DEFAULT NULL;

--EXTENDER LA LONGITUD DEL TÍTULO DE LOS SITIO SAKAI V21
ALTER TABLE SAKAI_SITE MODIFY TITLE VARCHAR(500);

--CURSO MODELO SAKAI V21
INSERT INTO sakai.SAKAI_REALM (REALM_ID, PROVIDER_ID, MAINTAIN_ROLE, CREATEDBY, MODIFIEDBY, CREATEDON, MODIFIEDON) VALUES('/site/9a2b9190-7bac-4bb5-973c-2ba44a5b326e', NULL, 9, 'admin', 'admin', '2016-09-21 11:07:12', '2020-11-19 13:54:06');

--PERMISOS PARA LOS CURSOS EN SAKAI V21
select * from SAKAI_REALM_FUNCTION srf where srf.FUNCTION_KEY in (58,54,55)

UPDATE sakai_dev.SAKAI_SITE SET CUR_URL='https://meet.google.com/aec-bija-qxp' 

select * from SAKAI_SITE_PROPERTY

INSERT INTO sakai.SAKAI_SITE_PROPERTY (SITE_ID, NAME, VALUE) VALUES('!error', 'display-users-present', 'false');

INSERT INTO SAKAI_SITE_PROPERTY ('ab8575c3-4ec9-336e-81c7-d216692c13dd', 'can_manage_resources', 'false')

select * from SAKAI_REALM sr where sr.REALM_ID = '/site/34283702-2951-4bdd-a4cb-7501753436eb';
select * from SAKAI_SITE ss where ss.SITE_ID = '34283702-2951-4bdd-a4cb-7501753436eb';

SELECT * FROM SAKAI_REALM_RL_GR WHERE REALM_KEY = '524' AND USER_ID = 'u20241223984' AND ROLE_KEY = 15








SELECT * from SAKAI



















UPDATE sakai.SAKAI_USER SET PW='PBKDF2:dvd0fU59EWkLeJ1ArvZXkw==:c78CIgWwQkMccA70nqrPwA==';
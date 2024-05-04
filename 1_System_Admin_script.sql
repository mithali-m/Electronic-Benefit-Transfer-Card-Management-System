SET SERVEROUTPUT ON
BEGIN
	FOR I IN(
		WITH MY_USERS AS(
			SELECT 'EBTAPP' UNAME FROM DUAL
		)
		SELECT MU.UNAME
		FROM MY_USERS MU
		INNER JOIN ALL_USERS AU
		ON AU.USERNAME = MU.UNAME
	)
	LOOP
		DBMS_OUTPUT.PUT_LINE('User to be dropped: '|| I.UNAME);
		EXECUTE IMMEDIATE 'DROP USER '|| I.UNAME ||' CASCADE';
	END LOOP;
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

create user EBTAPP identified by DataKnicks2023;

grant connect,resource to EBTAPP;
GRANT CREATE SESSION TO EBTAPP WITH ADMIN OPTION;
GRANT UNLIMITED TABLESPACE TO EBTAPP;

GRANT CREATE VIEW,create procedure, create sequence,create trigger TO EBTAPP;
GRANT CREATE USER TO EBTAPP;
GRANT DROP USER TO EBTAPP;

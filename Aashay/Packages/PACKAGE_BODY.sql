create or replace PACKAGE BODY MANAGE_USERS_AND_ACCESS AS

-------------------------------------------------------------------------------
--CREATE USER
-------------------------------------------------------------------------------
    PROCEDURE CREATE_USER (USERNAME VARCHAR,PASSWORD VARCHAR) IS
    
    SQLS VARCHAR2(255);
    USER_EXISTS EXCEPTION;
    PRAGMA EXCEPTION_INIT ( USER_EXISTS, -2002 );
    IS_USER_AVAILABLE NUMBER;

    BEGIN
        SQLS := 'CREATE USER '|| USERNAME|| ' IDENTIFIED BY "'|| PASSWORD|| '" ';
        EXECUTE IMMEDIATE SQLS;
        DBMS_OUTPUT.PUT_LINE('  OK: ' || SQLS);
    EXCEPTION
        WHEN USER_EXISTS THEN
            DBMS_OUTPUT.PUT_LINE('WARN: ' || SQLS);
            DBMS_OUTPUT.PUT_LINE('ALREADY EXISTS');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL: ' || SQLS);
    END;


-------------------------------------------------------------------------------
--CREATE ROLE
-------------------------------------------------------------------------------
    PROCEDURE CREATE_ROLE (ROLENAME VARCHAR) IS

    SQLS VARCHAR2(255);
    ROLE_EXISTS EXCEPTION;
    PRAGMA EXCEPTION_INIT ( ROLE_EXISTS, -2002 );

    BEGIN
        SQLS := 'CREATE ROLE ' || ROLENAME;
        EXECUTE IMMEDIATE SQLS;
        DBMS_OUTPUT.PUT_LINE('  OK: ' || SQLS);
    EXCEPTION
        WHEN ROLE_EXISTS THEN
            DBMS_OUTPUT.PUT_LINE('WARN: ' || SQLS);
            DBMS_OUTPUT.PUT_LINE('ALREADY EXISTS');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL: ' || SQLS);
    END;


-------------------------------------------------------------------------------
--MANAGE ROLE
-------------------------------------------------------------------------------
    PROCEDURE MANAGE_ROLE_ACCESS (TABLENAME   VARCHAR,ROLENAME    VARCHAR,ACCESSTYPES VARCHAR ) IS

    IS_ROLE_AVAILABLE NUMBER;
    E_ROLE_ALREADY_CREATED EXCEPTION;

    BEGIN
        SELECT
            COUNT(*)
        INTO IS_ROLE_AVAILABLE
        FROM
            DBA_ROLES
        WHERE
            LOWER(ROLE) = LOWER(ROLENAME);
        IF ( IS_ROLE_AVAILABLE = 1 ) THEN
            EXECUTE IMMEDIATE 'GRANT '|| ACCESSTYPES|| ' ON '|| TABLENAME|| ' TO '|| ROLENAME;
        ELSE
            RAISE E_ROLE_ALREADY_CREATED;
        END IF;
    EXCEPTION
        WHEN E_ROLE_ALREADY_CREATED THEN
            DBMS_OUTPUT.PUT_LINE('ROLE NOT CREATED!!');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;


-------------------------------------------------------------------------------
--GRANT ROLE TO USER
-------------------------------------------------------------------------------
    PROCEDURE GRANT_ROLE_TO_USER (ROLENAME VARCHAR,USERNAME VARCHAR) IS

    IS_ROLE_AVAILABLE NUMBER;
    SQLS              VARCHAR2(255);
    ROLE_EXISTS EXCEPTION;
    PRAGMA EXCEPTION_INIT ( ROLE_EXISTS, -2002 );

    BEGIN
        SQLS := 'GRANT '|| ROLENAME|| ' TO '|| USERNAME;
        EXECUTE IMMEDIATE SQLS;
        DBMS_OUTPUT.PUT_LINE('  OK: ' || SQLS);
    EXCEPTION
        WHEN ROLE_EXISTS THEN
            DBMS_OUTPUT.PUT_LINE('WARN: ' || SQLS);
            DBMS_OUTPUT.PUT_LINE('ALREADY EXISTS');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL: ' || SQLS);
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;


-------------------------------------------------------------------------------
--FUNCTION TO CHECK IF USER
-------------------------------------------------------------------------------
    FUNCTION F_IS_USER_ALREADY_CREATED (USERNAME VARCHAR) RETURN NUMBER IS 

    IS_AVAILABLE NUMBER;

    BEGIN
        SELECT
            COUNT(*)
        INTO IS_AVAILABLE
        FROM
            DBA_USERS
        WHERE
            USERNAME = UPPER(USERNAME);
        DBMS_OUTPUT.PUT_LINE('USERNAME!!' || USERNAME);
        DBMS_OUTPUT.PUT_LINE('IS_AVAILABLE!!' || IS_AVAILABLE);
        IF IS_AVAILABLE > 0 THEN
            IS_AVAILABLE := 1; --ALREADY CREATED
        END IF;
        RETURN IS_AVAILABLE;
    END F_IS_USER_ALREADY_CREATED;

END;
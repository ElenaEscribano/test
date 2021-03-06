CREATE PROCEDURE "CONTA"."prueba_proc"
(
pIdUserFWT IN INTEGER,
pValores IN VARCHAR,
pRetorno OUT NUMBER
)
IS
vResultado NUMBER(3) := 0;
BEGIN
pRetorno := 0;
SELECT COUNT(*) INTO vResultado FROM CONTA.FOREX_CONFVAL_USER FX WHERE FX.FX_USER = pIdUserFWT;
IF (vResultado > 0 ) THEN
DELETE FROM CONTA.FOREX_CONFVAL_USER FX WHERE FX.FX_USER = pIdUserFWT;
END IF;
INSERT INTO CONTA.FOREX_CONFVAL_USER(FX_USER, FX_VALORES) VALUES(pIdUSerFWT, pValores);
COMMIT;
EXCEPTION
WHEN OTHERS THEN
pRetorno := -1;
END CREATE PROCEDURE "CONTA"."ACTUALIZAR_CARTERAS_CNT_FOREX"
(
pIdUserFWT IN INTEGER,
pValores IN VARCHAR,
pRetorno OUT NUMBER
)
IS
vResultado NUMBER(3) := 0;
BEGIN
pRetorno := 0;
SELECT COUNT(*) INTO vResultado FROM CONTA.FOREX_CONFVAL_USER FX WHERE FX.FX_USER = pIdUserFWT;
IF (vResultado > 0 ) THEN
DELETE FROM CONTA.FOREX_CONFVAL_USER FX WHERE FX.FX_USER = pIdUserFWT;
END IF;
INSERT INTO CONTA.FOREX_CONFVAL_USER(FX_USER, FX_VALORES) VALUES(pIdUSerFWT, pValores);
COMMIT;
-- esto es una prueba para ver que se replica en el repositorio remoto
EXCEPTION
WHEN OTHERS THEN
pRetorno := -1;
END prueba_proc;;

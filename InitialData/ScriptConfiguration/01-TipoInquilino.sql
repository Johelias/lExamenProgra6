DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT
Id_TipoInquilino, Descripcion, Estado INTO #TipoInquilinoTemp
FROM (
VALUES 
(1,'','FISICO'),
(2,'','JURIDICO'),
(3,'','JURIDICO'),
(4,'','FISICO')
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)

---------Actualizar Datos-------------
	UPDATE T SET 
	P.Estado=TM.Estado
	FROM dbo.TipoInquilino P
	INNER JOIN #TipoInquilinoTemp TM
	ON P.Id_TipoInquilino= TM.Id_TipoInquilino

	---------Insertar Datos-------

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino(
Id_TipoInquilino, Descripcion, Estado)
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM #TipoInquilinoTemp


EXCEPT
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM dbo.TipoInquilino


SET IDENTITY_INSERT dbo.TipoInquilino OFF


GO
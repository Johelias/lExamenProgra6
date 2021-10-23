DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT
Id_TipoInquilino, Descripcion, Estado INTO #TipoInquilinoTemp
FROM (
VALUES 
(1,'JURIDICO',1),
(2,'FISICO',1)

)AS TEMP (Id_TipoInquilino, Descripcion, Estado)

---------Actualizar Datos-------------

	UPDATE T SET 
		T.Descripcion=TM.Descripcion
	FROM [dbo].[TipoInquilino] T
	INNER JOIN #TipoInquilinoTemp TM
	ON T.Id_TipoInquilino= TM.Id_TipoInquilino


	---------Insertar Datos-------

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO  [dbo].[TipoInquilino](
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


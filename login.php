
<?php 
session_start();
require('funciones.php');
require('clases/clases.php');


	if(isset($_POST['acceder']))
	{
		$pass = hash('sha512', $_POST['pass']);
		$datos = array(limpiar($_POST['usuario']), $pass);
		if(datos_vacios($datos) == false)
		{
			if(strpos($datos[0], " ") == false)
			{
				$resultados = usuarios::verificar($datos[0]);
				if(empty($resultados) == false)
				{
					if($datos[1] == $resultados[0]["pass"])
					{
						$_SESSION['CodUsua'] = $resultados[0]["CodUsua"];
						$_SESSION['nombre'] = $resultados[0]["nombre"];
						$_SESSION['foto_perfil'] = $resultados[0]['foto_perfil'];
						header('location: index.php');
					}
				}
			}
		}
	}

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="contenedor-form">
	<h1>Login</h1>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
			<input type="text" name="usuario" class="input-control" placeholder="usuario">
			<input type="password" name="pass" class="input-control" placeholder="Password">
			<input type="submit" value="Acceder" name="acceder" class="log-btn">
		</form>
		<div class="registrar">
			<a href="registro.php">Eres nuevo?</a>
		</div>
	</div>
</body>
</html>
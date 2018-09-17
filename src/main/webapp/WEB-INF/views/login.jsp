<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<base href="./">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
<title>Hungry</title>
<link href="/css/style.css" rel="stylesheet">
</head>
<body class="app flex-row align-items-center">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card-group">
					<div class="card p-4">
						<form class="card-body" action="/login" method="post">
							<h1>배고파 Login</h1>
							<p class="text-muted">배가 고파요</p>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="icon-user">Email</i></span>
								</div>
								<input name="email" class="form-control" type="text">
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="icon-lock">Password</i></span>
								</div>
								<input name="password" class="form-control" type="password">
							</div>
							<div class="row">
								<div class="col-6">
									<button class="btn btn-primary px-4" type="submit">Login</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
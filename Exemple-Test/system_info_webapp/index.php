<?php
// Récupérer des informations système
$os = php_uname('s');
$version = php_uname('v');
$architecture = php_uname('m');
$hostname = php_uname('n');
$cpu = shell_exec("lscpu | grep 'Model name' | awk -F: '{print $2}'");
$ram_total = shell_exec("free -h | grep 'Mem' | awk '{print $2}'");
$ram_used = shell_exec("free -h | grep 'Mem' | awk '{print $3}'");
$ram_free = shell_exec("free -h | grep 'Mem' | awk '{print $4}'");
$cpu_cores = shell_exec("nproc");
$disk_usage = shell_exec("df -h / | grep '/' | awk '{print $5}'");
$uptime = shell_exec("uptime -p");
$ip_address = shell_exec("hostname -I | awk '{print $1}'");
$load_average = sys_getloadavg();
$swap_total = shell_exec("free -h | grep 'Swap' | awk '{print $2}'");
$swap_used = shell_exec("free -h | grep 'Swap' | awk '{print $3}'");
$swap_free = shell_exec("free -h | grep 'Swap' | awk '{print $4}'");
$process_count = shell_exec("ps aux | wc -l");
$logged_users = shell_exec("who | wc -l");
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informations Système</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        tr:hover {
            background-color: #e2e6ea;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Informations sur le Système</h1>
        <table>
            <tr>
                <th>Propriété</th>
                <th>Valeur</th>
            </tr>
            <tr>
                <td>Système d'exploitation</td>
                <td><?php echo $os; ?></td>
            </tr>
            <tr>
                <td>Version</td>
                <td><?php echo $version; ?></td>
            </tr>
            <tr>
                <td>Architecture</td>
                <td><?php echo $architecture; ?></td>
            </tr>
            <tr>
                <td>Nom d'hôte</td>
                <td><?php echo $hostname; ?></td>
            </tr>
	    <tr>
		<td>Temps d'execution</td>
		<td><?php echo $uptime; ?></td>
	    </tr>
            <tr>
                <td>Processeur</td>
                <td><?php echo trim($cpu); ?></td>
            </tr>
	    <tr>
		<td>Disque usage</td>
		<td><?php echo trim($disk_usage); ?></td>
            <tr>
                <td>RAM Totale</td>
                <td><?php echo trim($ram_total); ?></td>
            </tr>
            <tr>
                <td>RAM Utilisée</td>
                <td><?php echo trim($ram_used); ?></td>
            </tr>
            <tr>
                <td>RAM Libre</td>
                <td><?php echo trim($ram_free); ?></td>
            </tr>
            <tr>
                <td>Nombre de cœurs CPU</td>
                <td><?php echo trim($cpu_cores); ?></td>
            </tr>
	    <tr>
                 <td>Adresse IP</td>
                 <td><?php echo trim($ip_address); ?></td>
             </tr>
	     <tr>
                 <td>Utilisateurs</td>
                 <td><?php echo trim($logged_users); ?></td>
             </tr>

![Descripción](https://img.shields.io/badge/Descripción-blue?style=for-the-badge)

- Proyecto **Inception** de 42: despliegue de un stack completo de servicios en contenedores Docker.  
- Incluye: **nginx**, **MySQL**, **WordPress**, **phpMyAdmin**, **Grafana**, **InfluxDB**, **Telegraf** y **FTPS**.  
- Orquestado con **Docker Compose** y configurado para producción mínima (volúmenes, redes, certificados SSL).

---

![Estructura del proyecto](https://img.shields.io/badge/Estructura-orange?style=for-the-badge)

```text
16.Inception-main/
├── srcs/
│   ├── nginx/
│   │   ├── default.conf      # Configuración de servidor
│   │   └── Dockerfile
│   ├── mysql/
│   │   ├── my.cnf            # Configuración de base de datos
│   │   └── Dockerfile
│   ├── wordpress/
│   │   ├── wp-config.php     # Configuración WordPress
│   │   └── Dockerfile
│   ├── phpmyadmin/
│   │   └── Dockerfile
│   ├── grafana/
│   │   └── Dockerfile
│   ├── influxdb/
│   │   └── influxdb.conf
│   ├── telegraf/
│   │   └── telegraf.conf
│   ├── ftps/
│   │   └── Dockerfile
│   └── tools/                # Scripts y utilidades (certificados, setup)
│       ├── mkcert.sh
│       └── cleanup.sh
├── docker-compose.yml
└── README.md                 # Este documento
```




1. Clona el repositorio y entra en la carpeta:
```bash
git clone https://github.com/tu_usuario/16.Inception.git
cd 16.Inception-main
```
2. Genera certificados SSL (útil para HTTPS):
```bash
bash srcs/tools/mkcert.sh
```
3. Levanta todos los servicios:
```bash
docker-compose up -d --build
```


  -  nginx (HTTPS) → https://localhost

  -  WordPress → https://localhost:5050

  -  phpMyAdmin → https://localhost:5000

  -  Grafana → https://localhost:3000

  -  InfluxDB → https://localhost:8086

  -  FTPS → ftp://localhost:21 (user: user, pass: passwd)

Para parar y destruir contenedores, redes y volúmenes:
```bash
docker-compose down -v
```






![Autor](https://img.shields.io/badge/Autor-red?style=for-the-badge)

- Roberto del Olmo Lima
- [![GitHub](https://img.shields.io/badge/GitHub-Profile-informational?style=for-the-badge&logo=github&logoColor=white&color=181717)](https://github.com/legrol)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/roberto-del-olmo-731746245)


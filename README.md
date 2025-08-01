![Descripción](https://img.shields.io/badge/Descripción-blue?style=for-the-badge)

- Proyecto **Inception** de 42: despliegue de un stack completo de servicios en contenedores Docker.  
- Incluye: **nginx**, **Mariadb**, **WordPress**.  
- Orquestado con **Docker Compose** y configurado para producción mínima (volúmenes, redes, certificados SSL).

---

![Estructura del proyecto](https://img.shields.io/badge/Estructura-orange?style=for-the-badge)

```text
16.Inception-main/
├── srcs/
│   ├── nginx/
│   │   ├── default.conf      # Configuración de servidor
│   │   └── Dockerfile
│   ├── wordpress/
│   │   ├── wp-config.php     # Configuración WordPress
│   │   └── Dockerfile
│   └── tools/                # Scripts y utilidades (certificados, setup)
│       ├── mkcert.sh
│       └── cleanup.sh
├── docker-compose.yml
└── README.md                 # Este documento
```

## ![Uso](https://img.shields.io/badge/Uso-blue?style=for-the-badge)
# Remove all Docker containers, images, volumes, and networks. 

  -  `docker stop $(docker ps -qa);`
  -  `docker rm $(docker ps -qa);`
  -  `docker rmi -f $(docker images -qa);`
  -  `docker volume rm $(docker volume ls -q);`
  -  `docker network rm $(docker network ls -q) 2>/dev/null`

# NGINX service must be the sole entry point into your infrastructure

  -  `docker ps --format 'table {{.Names}}\t{{.Ports}}'`

# Ensure that WordPress website is properly installed

  -  `docker exec -it wordpress wp core is-installed --allow-root && echo "WP is installed" || echo "WP is NOT installed"`
  -  `docker-compose down --volumes`
  -  `docker exec -it wordpress wp core is-installed --allow-root && echo "WP is installed" || echo "WP is NOT installed"`
  -  `docker-compose up -d --build`
  -  `docker exec -it wordpress wp core is-installed --allow-root && echo "WP is installed" || echo "WP is NOT installed"`
  -  `docker exec -it wordpress wp user list --allow-root`

# PERSISTENCE

  -  `docker exec -it wordpress wp user list --allow-root`
  -  `docker exec -it wordpress wp comment list --allow-root`
  -  `docker exec -it mariadb mysql -u root -p`

![Vista del proyecto](https://img.shields.io/badge/Vista_del_proyecto-magenta?style=for-the-badge)

<p align="center">        
  <img src="imgReadme/Img1.png" alt="Vista del proyecto" width="650"/>
</p>
<p align="center">        
  <img src="imgReadme/Img5.png" alt="Vista del proyecto" width="650"/>
</p>
<p align="center">
  <img src="imgReadme/Img4.png" alt="Vista del proyecto" width="400"/>
  <img src="imgReadme/Img3.png" alt="Vista del proyecto" width="400"/>
</p>

![Autor](https://img.shields.io/badge/Autor-red?style=for-the-badge)

- Roberto del Olmo Lima
- [![GitHub](https://img.shields.io/badge/GitHub-Profile-informational?style=for-the-badge&logo=github&logoColor=white&color=181717)](https://github.com/legrol)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/roberto-del-olmo-731746245)


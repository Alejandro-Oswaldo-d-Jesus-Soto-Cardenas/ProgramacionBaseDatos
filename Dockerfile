# Usar la imagen oficial de SQL Server 2022
FROM mcr.microsoft.com/mssql/server:2022-latest

# Establecer la contraseña para el usuario SA
ENV MSSQL_SA_PASSWORD=73144231soto
ENV ACCEPT_EULA=Y

# Exponer el puerto 1433 para las conexiones
EXPOSE 1433

# Comando para ejecutar SQL Server
CMD /opt/mssql/bin/sqlservr

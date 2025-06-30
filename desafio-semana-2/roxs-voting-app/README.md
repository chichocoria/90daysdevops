# Desafío Final Semana 2
🧪 **Día 14: Desafío Final - Semana Docker y Compose**

🎯 **Objetivo**
Dockerizar por completo la aplicación roxs-voting-app usando Docker Compose.

Crear un entorno multi-servicio que incluya:

🐍 vote: una app Flask que permite votar (gato o perro)
🧠 worker: un servicio Node.js que procesa los votos
📊 result: una app Node.js que muestra los resultados en tiempo real
🗃️ redis: almacén temporal de votos
🐘 postgres: base de datos persistente

---

🌐 **Puertos de los Servicios
A continuación, te detallamos los puertos utilizados por cada componente de la aplicación:**

* **vote:** expone el puerto **80** (HTTP) para la interfaz de votación.
* **worker:** utiliza el puerto **3000** internamente (no suele exponerse fuera del contenedor).
* **result:** expone el puerto **3000** para mostrar los resultados en tiempo real.
* **redis:** utiliza el puerto **6379** para la comunicación entre servicios.
* **postgres:** utiliza el puerto estándar **5432** para la base de datos.

Asegurate de que estos puertos no estén en uso por otros servicios en tu máquina antes de levantar los contenedores.

---

🛠️ **Tareas del desafío**
1. **Crear los Dockerfile personalizados** para cada componente si aún no lo hiciste.
2. **Escribir el archivo docker-compose.yml** que levante todos los servicios conectados.
3. Asegurate de que:
    * Todos los servicios se comuniquen entre sí correctamente.
    * Los contenedores levanten sin errores.
    * Los puertos estén bien expuestos (5000, 5001, etc.).
4. **(Opcional)** Agregá un volumen para persistir los datos de PostgreSQL.

---

🚀 **Resolucion:**

* Se crearon los files .dockerignore y Dockerfile en cada aplicacion.
* Se agregaron variables de entorno con `.env`
* Se configuraron `depends_on`
* Se agregaron `healtcheck` a los servicios principales.


🧩 **Pasos para correr la aplicacion**



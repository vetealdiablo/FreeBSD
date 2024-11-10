---

# 🚀 FreeBSD: Documentos y Scripts para Facilitar la Vida en el Infierno 🔥

Bienvenidos a una recopilación de documentos y scripts para hacer que tu experiencia con **FreeBSD** sea más ágil y menos dolorosa. Si eres un guerrero del sistema operativo BSD, este repositorio está pensado para simplificar tareas repetitivas, configurar tu entorno y llevar tu FreeBSD al siguiente nivel.

---

## 📦 ¿Cómo Empezar?

Una vez hayas completado una instalación limpia de FreeBSD, sigue estos pasos para tener un sistema funcional en poco tiempo. 

1. **Actualiza los repositorios de paquetes**:
    ```bash
    sudo pkg update
    ```

2. **Instala los paquetes esenciales** para comenzar con tu aventura:
    ```bash
    sudo pkg install git nano sudo
    ```

3. **Clona este repositorio** para tener todos los scripts y configuraciones listas:
    ```bash
    git clone https://github.com/vetealdiablo/freebsd
    ```

4. Cambia al directorio donde se clonó el repositorio:
    ```bash
    cd freebsd
    ```

---

## 🛠️ Orden a Seguir

Este conjunto de scripts ha sido diseñado para ser ejecutado en orden. Cada uno cumple una función específica que va mejorando y optimizando tu FreeBSD a medida que avanzas.

### 1️⃣ Configuración Base (Base Installation)
Primero, configura lo esencial para que tu FreeBSD esté en marcha con el mínimo necesario:
```bash
sh freebsd/scripts/base-ins.sh
```

### 2️⃣ Instalación Completa (Full Installation)
Para una instalación más completa, que incluya demonios, servicios y configuraciones extra, ejecuta:
```bash
sh freebsd/scripts/demonio.sh
sh freebsd/scripts/post-ins.sh
```

### 3️⃣ Instalación de Aplicaciones Extra (Extra Applications)
¡Ya casi estás listo! Para instalar aplicaciones adicionales y herramientas que mejorarán tu experiencia con FreeBSD:
```bash
sh freebsd/scripts/extra-aps.sh
```

---

## 🔥 ¿Qué Más Puedo Hacer?

Este repositorio está en constante evolución. Si tienes algún script o configuración adicional que crees que podría ser útil para la comunidad FreeBSD, ¡no dudes en contribuir! Puedes abrir un *pull request* o simplemente enviar tus sugerencias.

---

## 💬 Contribuye

Este repositorio está abierto a mejoras, sugerencias y cualquier tipo de contribución que puedas ofrecer. Si tienes ideas o mejoras, **abre un issue** o **envía un pull request**.

¡Nos encanta la comunidad BSD! 🙌

---

**¡Listo para disfrutar de FreeBSD como un verdadero experto!** 💻🎉

---

-- Árbol de particiones manual:

+BSD
  ++ freebsd-ufs /
  ++ freebsd-swap none

---

### Pasos después de instalar FreeBSD junto a Windows (con particionado manual):

1. **Verificar el disco donde se instaló FreeBSD**:
   Ejecutar el siguiente comando para listar las particiones y ver el disco donde se instaló FreeBSD, por ejemplo:
   gpart show ada0

2. **Instalar el bootloader en el disco adecuado**:
   Luego, ejecutar el siguiente comando para instalar el bootloader en el disco 0:
   boot0cfg -B ada0

   Esto instalará el cargador de arranque (bootloader) en el disco ada0 y permitirá que se detecten los discos de Windows.


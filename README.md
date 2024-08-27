# MercadoMELI

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/Version-1.0.0-brightgreen.svg)](https://github.com/Jonavoe/Curso-dapp-react-solidity/releases)

**MercadoMELI** es una aplicación descentralizada (DApp) que permite a los usuarios comprar y vender productos en un marketplace inspirado en MercadoLibre. La plataforma integra un sistema de pagos utilizando la criptomoneda **MELI**, proporcionando una experiencia de compra moderna y segura en la blockchain.

## Características

- **Marketplace descentralizado:** Compra y vende productos utilizando MELI como medio de pago.
- **Autenticación segura:** Conéctate con billeteras digitales como MetaMask.
- **Integración con blockchain:** Todas las transacciones se registran en la blockchain, garantizando transparencia y seguridad.
- **Interfaz amigable:** Diseño UI/UX intuitivo, inspirado en la experiencia de MercadoLibre.
- **Historial de compras:** Consulta fácilmente tus transacciones y compras realizadas con MELI.

## Tecnologías utilizadas

- **Frontend:** React, Redux
- **Backend:** Node.js, Express
- **Smart Contracts:** Solidity
- **Blockchain:** Ethereum
- **Billetera:** MetaMask
- **Base de datos:** MongoDB

## Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/Jonavoe/Curso-dapp-react-solidity.git
   cd Curso-dapp-react-solidity
   ```

2. Instala las dependencias:
   ```bash
   npm install
   ```

3. Configura las variables de entorno:
   - Crea un archivo `.env` en la raíz del proyecto y agrega las siguientes variables:
     ```
     REACT_APP_API_URL=http://localhost:5000
     REACT_APP_MELI_CONTRACT_ADDRESS=0x...
     ```

4. Inicia la aplicación:
   ```bash
   npm start
   ```

## Uso

1. Conecta tu billetera MetaMask a la aplicación.
2. Navega por el marketplace, elige tus productos y paga utilizando MELI.
3. Revisa el historial de transacciones para mantener un registro de tus compras.

## Contribuir

¡Las contribuciones son bienvenidas! Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama nueva (`git checkout -b feature/nueva-caracteristica`).
3. Realiza tus cambios y haz commit (`git commit -m 'Agrega nueva característica'`).
4. Sube los cambios a tu repositorio (`git push origin feature/nueva-caracteristica`).
5. Abre un Pull Request en este repositorio.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Para más información o consultas, puedes contactar a los desarrolladores en [voeffray.jonathan@gmail.com](mailto:voeffray.jonathan@gmail.com).

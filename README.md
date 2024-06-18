
## Camera POC App

Este projeto é uma prova de conceito (POC) para um aplicativo de câmera desenvolvido em Flutter. O objetivo é demonstrar a implementação de uma câmera utilizando a biblioteca `camera`, enquanto se adota os princípios SOLID para garantir um código desacoplado e de fácil manutenção.

### Estrutura do Projeto

* **Interfaces e Implementações:**
  * `ICamera` e `CameraService`
  * `IRepositoryCamera` e `RepositoryCamera`
* **Adaptadores:**
  * `ZXFileAdapter`
  * `PriewCameraZaurisAdapter`
  * `CameraControllerZaurisAdapter`
* **Controlador:**
  * `CameraPageController`
* **UI:**
  * `CameraPage`

### Princípios SOLID

* **Single Responsibility Principle (SRP):** Cada classe tem uma única responsabilidade. Por exemplo, `CameraService` é responsável apenas pelas operações da câmera, enquanto `CameraPageController` gerencia a lógica de apresentação.
* **Open/Closed Principle (OCP):** O código está aberto para extensão, mas fechado para modificação. Podemos adicionar novos adaptadores ou serviços sem modificar os existentes.
* **Liskov Substitution Principle (LSP):** As classes derivadas ou adaptadas podem ser usadas como substitutas das suas classes base. Os adaptadores garantem que os tipos personalizados (`ZXFile`, `PriewCameraZauris`, `CameraControllerZauris`) possam ser usados no lugar dos tipos padrão.
* **Interface Segregation Principle (ISP):** Interfaces específicas foram criadas (`ICamera` e `IRepositoryCamera`), evitando a criação de interfaces grandes e não específicas.
* **Dependency Inversion Principle (DIP):** A dependência no `CameraService` é invertida usando a interface `ICamera`, permitindo a injeção de dependência e facilitando testes.

### Bibliotecas Utilizadas

* `camera`: Biblioteca oficial do Flutter para acessar e controlar a câmera do dispositivo. [Documentação da biblioteca]()

### Como Executar o Projeto

1. **Pré-requisitos:**
   * Flutter SDK instalado
   * Dispositivo físico ou emulador configurado
2. **Clonar o Repositório:**
   <pre><div class="dark bg-gray-950 rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copiar código</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-bash">git clone https://github.com/seu-usuario/camera-poc.git
   cd camera-poc
   </code></div></div></pre>
3. **Instalar Dependências:**
   <pre><div class="dark bg-gray-950 rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copiar código</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-bash">flutter pub get
   </code></div></div></pre>
4. **Executar o Aplicativo:**
   <pre><div class="dark bg-gray-950 rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copiar código</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-bash">flutter run
   </code></div></div></pre>

### Estrutura de Arquivos

<pre><div class="dark bg-gray-950 rounded-md border-[0.5px] border-token-border-medium"><div class="flex items-center relative text-token-text-secondary bg-token-main-surface-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>vbnet</span><div class="flex items-center"><span class="" data-state="closed"><button class="flex gap-1 items-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" class="icon-sm"><path fill="currentColor" fill-rule="evenodd" d="M7 5a3 3 0 0 1 3-3h9a3 3 0 0 1 3 3v9a3 3 0 0 1-3 3h-2v2a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3v-9a3 3 0 0 1 3-3h2zm2 2h5a3 3 0 0 1 3 3v5h2a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1h-9a1 1 0 0 0-1 1zM5 9a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-9a1 1 0 0 0-1-1z" clip-rule="evenodd"></path></svg>Copiar código</button></span></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="!whitespace-pre hljs language-vbnet">lib/
├── camera_local/
│   ├── controller/
│   │   └── camera_page_controller.dart
│   ├── models/
│   │   ├── zxfile.dart
│   │   ├── priew_camera_zauris.dart
│   │   ├── camera_controller_zauris.dart
│   ├── services/
│   │   ├── i_camera.dart
│   │   ├── camera_service.dart
│   │   ├── i_repository_camera.dart
│   │   ├── repository_camera.dart
│   ├── adapters/
│   │   ├── zxfile_adapter.dart
│   │   ├── priew_camera_zauris_adapter.dart
│   │   ├── camera_controller_zauris_adapter.dart
├── camera_page.dart
</code></div></div></pre>

### Explicação da Implementação

* **Interfaces e Implementações:**
  * `ICamera` define as operações da câmera, e `CameraService` implementa essas operações.
  * `IRepositoryCamera` define as operações do repositório de câmera, e `RepositoryCamera` implementa essas operações utilizando `ICamera`.
* **Adaptadores:**
  * `ZXFileAdapter`: Converte `XFile` para `ZXFile`.
  * `PriewCameraZaurisAdapter`: Converte `CameraPreview` para `PriewCameraZauris`.
  * `CameraControllerZaurisAdapter`: Converte `CameraController` para `CameraControllerZauris`.
* **Controlador:**
  * `CameraPageController` gerencia o estado da câmera e utiliza os adaptadores para trabalhar com os tipos personalizados.
* **UI:**
  * `CameraPage` utiliza `ChangeNotifierProvider` para fornecer o controlador à árvore de widgets e renderiza a visualização da câmera utilizando `PriewCameraZauris`.

### Conclusão

Esta implementação demonstra como utilizar a biblioteca `camera` do Flutter de maneira desacoplada, utilizando os princípios SOLID para criar um código modular e de fácil manutenção. Esta abordagem facilita a expansão do aplicativo com novos recursos e a realização de testes unitários e de integração.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

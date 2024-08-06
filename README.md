# FPSARMini06

Este é um projeto de um aplicativo iOS desenvolvido em Swift para o Developer Academy da Universidade Católica de Brasília. Esse é o Mini #06 de 2024 do grupo 08 com os desenvolvedores:
- Maria Clara Guimarães,
- Gabriel Eirado,
- Giovanni Favorin,
- Letícia Malagutti
- Luis Felipe Zica
  
O objetivo do projeto é desenvolver um jogo FPS utilizando AR.

## Estrutura do Projeto

A estrutura de pastas e arquivos do projeto é organizada da seguinte forma:

```
FPSARMini06/
├── Localizable.xcstrings
│
├── FPSARMini06/
│   ├── Model/
│   │   └── Model.swift
│   ├── NavigationController/
│   │   ├── Navigator.swift
│   │   ├── PageManager.swift
│   │   └── GameScene.swift
│   ├── Views/
│   │   ├── Inventory/
│   │   │   ├── InventoryView.swift
│   │   │   └── InventoryViewModel.swift
│   │   ├── Menu/
│   │   │   ├── MenuView.swift
│   │   │   ├── PauseMenuView.swift
│   │   │   ├── GamePlayFeedbackView.swift
│   │   │   └── SettingsView.swift
│   │   ├── HowToPlay/
│   │   │   └── HowToPlayView.swift
│   ├── GameSystem/
│   │   ├── Components/
│   │   │   ├── MotionComponent.swift
│   │   │   ├── DamageComponent.swift
│   │   │   ├── AttackComponent.swift
│   │   │   ├── VisualComponent.swift
│   │   │   └── gameCollisionComponent.swift
│   │   ├── Entities/
│   │   │   ├── BulletEntity.swift
│   │   │   ├── EnemyEntity.swift
│   │   │   ├── PlayerEntity.swift
│   │   │   └── FrogEntity.swift
│   │   ├── System/
│   │   │   ├── MotionSystem.swift
│   │   │   └── CollisionSystem.swift
│   │   └── MainScene.swift
│   └── Utils/
│   │   ├── frogDrone.usdz
│   │   └── ComponentePauseMenu.swift
│   │
│   ├── AppDelegate.swift
│   ├── ContentView.swift
│   ├── GameController.swift
│   │
│   ├── Assets.xcassets/
│   │   └── AppIcon.appiconset/
│   │
│   └── Info.plist
│   
├── NomeDoProjetoTests/
│   └── [NomeDoProjetoTests].swift
│
├── NomeDoProjetoUITests/
│   └── [NomeDoProjetoUITests].swift
│
├── Podfile
├── README.md
└── .gitignore
```

## Estrutura de Commits

Para manter o histórico de commits organizado e fácil de entender, siga esta estrutura para suas mensagens de commit:

1. **Tipo de Commit:** O tipo de mudança que você está fazendo. Use um dos seguintes prefixos:
    - `feat`: Uma nova funcionalidade
    - `fix`: Correção de bug
    - `refactor`: Mudança de código que não corrige um bug nem adiciona uma funcionalidade, somente reescreve/reestrutura um código
    - `perf`: Mudanças de código referentes à performance do código
    - `style`: Mudanças que não afetam o significado do código (espaços em branco, formatação, ponto e vírgula, etc)
    - `test`: Adicionando testes ausentes ou corrigindo testes existentes
    - `docs`: Mudanças na documentação
    - `build`: Mudanças de código que afetam os componentes de build, ci pipeline, dependências, versão de projeto
    - `ops`: Mudanças que afetam os componentes operacionais tipo infraestrtura, deployment, backup
    - `chore`: Mudanças em ferramentas auxiliares e bibliotecas

2. **Descrição do Commit:** Uma breve descrição do que foi feito.

### Exemplos de Mensagens de Commit

- `US01 feat: adiciona funcionalidade de login`
- `US01 fix: corrige bug no carregamento de dados`
- `US02 refactor: reorganiza estrutura das pastas`
- `US01 perf: otimização de funcionalidade de login`
- `US02 style: formata código no arquivo MainViewController.swift`
- `US01 test: adiciona testes para o serviço de autenticação`
- `US02 docs: atualiza README com instruções de instalação`
- `US02 build: ajuste CI pipeline`
- `US02 ops: ajuste backup de dados`
- `US02 chore: atualiza dependências do Podfile`

## Instalação

1. Clone o repositório:
    ```bash
    git clone https://github.com/Eirado/FPSARMini06.git
    ```

2. Navegue até o diretório do projeto:
    ```bash
    cd FPSARMini06
    ```

3. Instale as dependências do projeto:
    ```bash
    pod install
    ```

4. Abra o projeto no Xcode:
    ```bash
    open FPSARMini06.xcworkspace
    ```

## Contribuição

1. Faça um fork do projeto.
2. Crie uma nova branch com a sua funcionalidade ou correção de bug:
    ```bash
    git checkout -b minha-nova-feature
    ```
3. Commit suas mudanças:
    ```bash
    git commit -m 'US## [tipo]: [comentário descrevendo o que foi feito]'
    ```
4. Envie para o repositório remoto:
    ```bash
    git push origin minha-nova-feature
    ```
5. Abra um Pull Request.
